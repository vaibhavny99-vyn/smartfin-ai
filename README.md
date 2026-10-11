# SmartFin AI 💰🤖

Personal finance dashboard powered by **FastAPI + PostgreSQL + scikit-learn** and **React + TypeScript + Tailwind CSS**. Currency: **INR (₹)**.

---

## 🌟 Features
- **Smart Categorization & Forecasting**: ML-powered expense prediction and category auto-tagging.
- **Financial Health Score**: Real-time spending health and budget tracking.
- **Twin Simulation & Affordability**: Test future purchase scenarios and simulate outcomes.
- **AI Financial Chatbot**: Natural language finance assistant (English & Hinglish).
- **Receipt OCR**: Extract merchant and amounts automatically from receipts.
- **Export & Demo Data**: 1-click demo data seeding for instant demonstration.

---

## 🚀 1-Click Deploy on Render (Recommended)

This repository includes a `render.yaml` Blueprint specification.

1. Push this repository to GitHub.
2. In [Render Dashboard](https://dashboard.render.com/), click **New +** > **Blueprint**.
3. Select your GitHub repository.
4. Render will automatically provision:
   - **smartfin-postgres**: Free managed PostgreSQL database
   - **smartfin-backend**: FastAPI web service connected to PostgreSQL
   - **smartfin-frontend**: Vite React static site configured to talk to backend
5. Click **Apply** and your fullstack app will be live!

---

## 🛠️ Manual Deploy on Render

### Step 1: Create PostgreSQL Database
1. Go to Render Dashboard > **New +** > **PostgreSQL**.
2. Name: `smartfin-postgres`
3. Plan: **Free**
4. Copy the **Internal Database URL** (or External URL).

### Step 2: Deploy Backend Web Service
1. Render Dashboard > **New +** > **Web Service**.
2. Connect your GitHub repository.
3. Configure:
   - **Root Directory**: `backend`
   - **Runtime**: `Python`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
4. Add Environment Variables:
   - `DATABASE_URL`: *(Paste your Render Postgres URL)*
   - `JWT_SECRET`: *(A secure random string, e.g. `sf-secret-prod-2026`)*
   - `CORS_ORIGINS`: `*`
5. Click **Deploy Web Service** and note your backend URL (e.g. `https://smartfin-backend.onrender.com`).

### Step 3: Deploy Frontend Static Site
1. Render Dashboard > **New +** > **Static Site**.
2. Connect your GitHub repository.
3. Configure:
   - **Root Directory**: `frontend`
   - **Build Command**: `npm install && npm run build`
   - **Publish Directory**: `dist`
4. Add Environment Variable:
   - `VITE_API`: `https://smartfin-backend.onrender.com` *(your backend URL)*
5. Under **Redirects/Rewrites**:
   - Source: `/*`
   - Destination: `/index.html`
   - Action: `Rewrite`
6. Click **Deploy Static Site**.

---

## 💻 Local Development

### Option A: 1-Click Launcher (Windows)
Double-click `run.bat` in the repository root.

### Option B: Manual
1. **Backend**:
   ```bash
   cd backend
   python -m venv venv
   venv\Scripts\activate      # On Mac/Linux: source venv/bin/activate
   pip install -r requirements.txt
   uvicorn app.main:app --reload
   ```
   API Docs: http://localhost:8000/docs

2. **Frontend**:
   ```bash
   cd frontend
   npm install
   npm run dev
   ```
   Frontend: http://localhost:5173
