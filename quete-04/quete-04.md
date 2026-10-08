
### `api/Dockerfile.naive`
```dockerfile
FROM node:22
WORKDIR /app
COPY . .
RUN npm ci
EXPOSE 3000
CMD ["node", "server.js"]
```

### `api/Dockerfile.multi`
```dockerfile
# syntax=docker/dockerfile:1
FROM node:22.11-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

FROM node:22.11-alpine AS runtime
ENV NODE_ENV=production
WORKDIR /app
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --chown=node:node server.js db.js package.json ./
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1
USER node
CMD ["node", "server.js"]
```

---

## `docker image ls demo-api`

| Version Image | Base OS | Dépendances | Taille sur le Disque | Ratio de réduction |
| :--- | :--- | :--- | :--- | :--- |
| **`demo-api:naive`** | Debian (complète) | `devDependencies` incluses | **1.65 GB** | Référence (1x) |
| **`demo-api:multi`** | Alpine (légère) | Uniquement Production | **228 MB** | **~7.2× plus petit** 🚀 |

---

### A. Non-persistance dans l'historique (`docker history`)
```powershell
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker history --no-trunc demo-api:multi | Select-String "FAKE-123"
```

### B. Absence de fichier secret dans le système de fichiers final
```powershell
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker run --rm demo-api:multi sh -c 'cat /root/.npmrc 2>&1'
cat: can't open '/root/.npmrc': No such file or directory
```

### C. Test de fonctionnement
```powershell
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker run -d --name api-multi-test -p 8080:3000 demo-api:multi
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> (Invoke-WebRequest -Uri "http://localhost:8080/health" -UseBasicParsing).Content
{"status":"UP"}
```
