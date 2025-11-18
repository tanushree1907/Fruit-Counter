# Multi-stage Dockerfile (build & run backend). Frontend is kept as static file in the image.
FROM node:18-alpine AS build

WORKDIR /app/backend

# Install dependencies (copy package files from backend)
COPY backend/package*.json ./
RUN npm install --production

# Copy backend source
COPY backend/ ./

# Copy top-level frontend file(s) so they're available in the image (optional)
# adjust path if your frontend lives in a different location
COPY index.html ../frontend/index.html

# Final runtime image (smaller)
FROM node:18-alpine AS runtime
WORKDIR /app/backend

# Copy installed deps and app code from builder
COPY --from=build /app/backend /app/backend
# copy frontend files (optional)
COPY --from=build /app/frontend /app/frontend

ENV NODE_ENV=production
EXPOSE 4000

# Ensure working dir is backend and run server
WORKDIR /app/backend
CMD ["node", "server.js"]