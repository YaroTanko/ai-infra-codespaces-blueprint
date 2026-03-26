# read.md

## 1) Step-by-step instruction for Coded Space

1. Open your repository in Coded Space.
2. Wait for the workspace/container to finish initializing.
3. Open the integrated terminal.
4. Verify available tools:
   - `git --version`
   - `python3 --version` (if Python is used)
   - `node --version` and `npm --version` (if Node.js is used)
5. Install project dependencies:
   - Python project: `pip install -r requirements.txt`
   - Node.js project: `npm install`
6. Set environment variables (if needed), for example by creating `.env` from `.env.example`.
7. Run the project:
   - Python example: `python3 app.py` or `pytest`
   - Node.js example: `npm run dev` or `npm test`
8. Make changes, run tests, then commit and push:
   - `git add .`
   - `git commit -m "your message"`
   - `git push`

## 2) Step-by-step instruction for Local ENV (including tool downloads)

1. Download and install required tools:
   - Git: https://git-scm.com/downloads
   - A code editor (choose one):
     - Cursor: https://www.cursor.com/downloads
     - VS Code: https://code.visualstudio.com/
   - Python (if needed): https://www.python.org/downloads/
   - Node.js LTS (if needed): https://nodejs.org/en/download
   - Docker Desktop (optional): https://www.docker.com/products/docker-desktop/
2. Verify installation in a terminal:
   - `git --version`
   - `python --version` or `python3 --version`
   - `node --version` and `npm --version`
   - `docker --version` (if using Docker)
3. Clone the repository:
   - `git clone <repository-url>`
   - `cd <repository-folder>`
4. Open the project in your editor (Cursor or VS Code).
5. Install dependencies:
   - Python project: `pip install -r requirements.txt`
   - Node.js project: `npm install`
6. Configure environment variables:
   - Copy `.env.example` to `.env` (if provided), then set values.
7. Start and test the application:
   - Python example: `python3 app.py` or `pytest`
   - Node.js example: `npm run dev` or `npm test`
8. Commit and push your work:
   - `git add .`
   - `git commit -m "your message"`
   - `git push origin <branch-name>`
