# Demo-API - Docker Compose Architecture

Ce dépôt configure et déploie l'application `demo-api` accompagnée d'une base de données PostgreSQL et d'une interface Adminer à l'aide de Docker Compose.

## Prérequis
- Docker Desktop (avec BuildKit activé)
- PowerShell (Windows) ou terminal Bash

## Installation et Démarrage rapide

1. **Cloner le dépôt et se placer à la racine**
2. **Préparer les secrets locaux et l'environnement :**
   ```powershell
   Copy-Item .env.example .env
   Set-Content -Path ".\db_password.txt" -Value "MonMotDePasseSecurise"
   ```
3. **Lancer la stack applicative :**
   ```powershell
   docker compose up -d --build
   ```

## État de la stack (`docker compose ps`)
```text
NAME                                 IMAGE                 COMMAND                  SERVICE   STATUS              PORTS
khaybulov_egor_demo-api-adminer-1   adminer:4             "entrypoint.sh php -…"   adminer   running             0.0.0.0:8081->8080/tcp
khaybulov_egor_demo-api-api-1       demo-api-api          "docker-entrypoint.s…"   api       running             0.0.0.0:8080->3000/tcp
khaybulov_egor_demo-api-db-1        postgres:16-alpine    "docker-entrypoint.s…"   db        running (healthy)   5432/tcp
```

## URLs d'accès
- **API :** [http://localhost:8080/products](http://localhost:8080/products)
- **Adminer :** [http://localhost:8081](http://localhost:8081)

## Repartir de zéro
Pour détruire entièrement la stack ainsi que le volume de stockage persistant :
```powershell
docker compose down -v
```
