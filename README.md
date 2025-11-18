# Fruit Counter

A small demo app: static frontend + minimal Express backend.  
This version uses in-memory product data and a client-side cart. Authentication and database integration were removed.

---

## Project Structure

- `backend/`
  - `server.js` — Express server (ES module), in-memory fruits, cart stock endpoint
  - `package.json` — backend dependencies & scripts
- `frontend/`
  - `index.html` — static UI (vanilla JS) that fetches products and manages cart in localStorage

---

## What changed

- Removed MongoDB and all user auth (register/login/JWT).
- Server keeps fruits in-memory and exposes only product & cart endpoints.
- Frontend no longer shows login/register. Cart and quantities are handled client-side and persisted in `localStorage`.
- Adding an item reduces stock both on the server (best-effort) and in the UI.

---

## API (backend)

Base URL: `http://localhost:4000/api`

- `GET /api/fruits`  
  Returns list of fruits: `{ id, name, price, stock }`

- `POST /api/cart/add/:id`  
  Decrements in-memory stock for fruit `id` (if stock > 0). Returns updated fruit or error.

- `GET /api/state` (optional)  
  Returns current in-memory state (fruits).

Notes
- No authentication required.
- Stocks are in-memory — restarting the server resets inventory.

---

## Run — Backend

1. Open Terminal and install deps:

```bash
cd /Users/rubhamsoni/Desktop/Fruit-Counter/backend
npm install express cors
```

2. Ensure `package.json` contains `"type": "module"` if `server.js` uses ES module imports.

3. Start server:

```bash
node server.js
```

Server runs at: `http://localhost:4000`

---

## Run — Frontend

Open `/Users/rubhamsoni/Desktop/Fruit-Counter/frontend/index.html` in your browser (or serve the folder with a static server).

The frontend expects the API at `http://localhost:4000/api`. If you serve frontend from a different origin, update `API_BASE` in `frontend/index.html`.

---

## Frontend behavior

- Fetches products from `GET /api/fruits`.
- "Add" button decrements stock (server call + UI update), and increases item quantity in the cart.
- Cart is viewable from the navbar Cart button and persists in `localStorage` under the key `cart`.
- Cart item controls let you increase/decrease quantity; increasing will attempt to decrement server stock.

---

## Notes & Next steps

- Stocks and cart are ephemeral (in-memory on server; localStorage on client). For persistence reintroduce a database and server-side cart model.
- To re-add authentication, restore auth endpoints and user storage.
- Consider adding server-side validation and a proper static server for production.

---
```// filepath: /Users/rubhamsoni/Desktop/Fruit-Counter/README.md
# Fruit Counter

A small demo app: static frontend + minimal Express backend.  
This version uses in-memory product data and a client-side cart. Authentication and database integration were removed.

---

## Project Structure

- `backend/`
  - `server.js` — Express server (ES module), in-memory fruits, cart stock endpoint
  - `package.json` — backend dependencies & scripts
- `frontend/`
  - `index.html` — static UI (vanilla JS) that fetches products and manages cart in localStorage

---

## What changed

- Removed MongoDB and all user auth (register/login/JWT).
- Server keeps fruits in-memory and exposes only product & cart endpoints.
- Frontend no longer shows login/register. Cart and quantities are handled client-side and persisted in `localStorage`.
- Adding an item reduces stock both on the server (best-effort) and in the UI.

---

## API (backend)

Base URL: `http://localhost:4000/api`

- `GET /api/fruits`  
  Returns list of fruits: `{ id, name, price, stock }`

- `POST /api/cart/add/:id`  
  Decrements in-memory stock for fruit `id` (if stock > 0). Returns updated fruit or error.

- `GET /api/state` (optional)  
  Returns current in-memory state (fruits).

Notes
- No authentication required.
- Stocks are in-memory — restarting the server resets inventory.

---

## Run — Backend

1. Open Terminal and install deps:

```bash
cd /Users/rubhamsoni/Desktop/Fruit-Counter/backend
npm install express cors
```

2. Ensure `package.json` contains `"type": "module"` if `server.js` uses ES module imports.

3. Start server:

```bash
node server.js
```

Server runs