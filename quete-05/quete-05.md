## 1. Commande d'exécution du script depuis PowerShell (via WSL)
```powershell
wsl bash ./volumes_egor_khaybulov.sh
```

## 2. Logs d'exécution et preuve de persistance des données
```text
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> wsl bash ./volumes_egor_khaybulov.sh
demo-api-container
demo_net
0ee77e8050d077fec95bc456d352f9b20ac11ffb4623b6297b69954a9aec185b
[+] Building 0.6s (9/9) FINISHED                                                                   docker:default
 => [internal] load build definition from Dockerfile                                                         0.0s
 => => transferring dockerfile: 422B                                                                         0.0s
 => [internal] load .dockerignore                                                                            0.0s
 => => transferring context: 83B                                                                             0.0s
 => [internal] load metadata for docker.io/library/node:22.11-alpine                                         0.2s
 => [1/4] FROM docker.io/library/node:22.11-alpine                                                           0.0s
 => CACHED [2/4] WORKDIR /app                                                                                0.0s
 => CACHED [3/4] COPY package*.json ./                                                                       0.0s
 => CACHED [4/4] RUN npm ci --omit=dev                                                                       0.0s
 => CACHED [runtime 3/4] COPY --from=deps --chown=node:node /app/node_modules ./node_modules                 0.0s
 => CACHED [runtime 4/4] COPY --chown=node:node server.js db.js package.json ./                              0.0s
 => exporting to image                                                                                       0.0s
 => => exporting layers                                                                                      0.0s
 => => naming to docker.io/library/demo-api:1.0                                                              0.0s
demo_pgdata
f252db9bb277217bc92577d63cdd2398e6dab61a72c588aad0205c7720bf4d77
....b642606726f4e3866356d34a3b0ac425447f838c755f25d3497a785113760208
{"id":4,"name":"Casquette Démo","price_cents":1200,"created_at":"2026-10-08T12:52:14.386Z"}

demo-db
258924980f632c3b774f5144f5e0b7490af5853d60965fc7bb19d38f5674d803
....local               demo_pgdata
[{"id":4,"name":"Casquette Démo","price_cents":1200,"created_at":"2026-10-08T12:52:14.386Z"},{"id":3,"name":"T-shirt conteneur","price_cents":1990,"created_at":"2026-10-08T12:52:08.312Z"},{"id":2,"name":"Mug Docker","price_cents":990,"created_at":"2026-10-08T12:52:08.312Z"},{"id":1,"name":"Sticker Demo","price_cents":150,"created_at":"2026-10-08T12:52:08.312Z"}]

Nettoyage

```
