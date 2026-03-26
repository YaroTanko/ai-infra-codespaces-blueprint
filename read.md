# Development Environment Setup

## 1) Step-by-step instructions for GitHub Codespaces (Coded Space)

1. Open your repository in [GitHub Codespaces](https://github.com/features/codespaces), then create a new Codespace.
2. Wait for the workspace container to finish initialization.
3. Open the integrated terminal and verify Git:
   - `git --version`
4. Check repository contents to understand current scope:
   - `ls`
   - Review the listed files (for example app code, `requirements.txt`, `package.json`, or similar) and follow any language/framework-specific setup instructions if present.
5. If you need environment variables, copy `.env.example` to `.env` only when `.env.example` exists.
6. Never commit secrets:
   - ensure `.env` is ignored by Git (see `.gitignore`)
   - in GitHub Codespaces, store sensitive values in [GitHub repository/org secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) or [GitHub Codespaces secrets](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces)
   - never put credentials in `.env` files or shell history
7. Make your documentation/infrastructure changes in the workspace.
8. Commit and push:
   - `git add .`
   - `git commit -m "your message"`
   - `git push -u origin <branch-name>`

## 2) Step-by-step instructions for local environment setup (including tool downloads)

1. Download and install required tools:
   - Git: https://git-scm.com/downloads
   - A code editor (choose one):
     - Cursor: https://www.cursor.com/downloads
     - VS Code: https://code.visualstudio.com/
2. Download optional tools used in this repository's planned infrastructure workflows:
   - Docker Desktop: https://www.docker.com/products/docker-desktop/
   - kubectl: https://kubernetes.io/docs/tasks/tools/
   - kind: https://kind.sigs.k8s.io/docs/user/quick-start/
   - Helm: https://helm.sh/docs/intro/install/
3. Verify installation in a terminal:
   - `git --version`
   - `docker --version` (if installed)
   - `kubectl version --client` (if installed)
   - `kind version` (if installed)
   - `helm version` (if installed)
4. Clone the repository:
   - `git clone <repository-url>`
   - `cd <repository-folder>`
5. Open the project in your editor (Cursor or VS Code).
6. If `.env.example` exists, copy it to `.env` and set values for your machine.
7. Keep secrets safe:
   - do not commit `.env`
   - use secure secret stores for real credentials
8. Commit and push your work:
   - `git add .`
   - `git commit -m "your message"`
   - `git push origin <branch-name>`
