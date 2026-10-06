### 1. Lancement du conteneur PostgreSQL

```powershell
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker run -d --name demo-db -p 5432:5432 -e POSTGRES_USER=demo -e POSTGRES_PASSWORD=demo -e POSTGRES_DB=demo postgres:16-alpine
e0cc78b10572b62c583b10e95ff9e1648e9e70a83b94c7ff355c62a2b63fd551

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                                         NAMES
e0cc78b10572   postgres:16-alpine   "docker-entrypoint.s…"   3 seconds ago   Up 3 seconds   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp   demo-db
```

### 2. Connexion au CLI PostgreSQL (psql) et manipulation des données

```powershell
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker exec -it demo-db psql -U demo -d demo
psql (16.15)
```

```sql
demo=# CREATE TABLE products (id serial primary key, name text, price_cents int);
CREATE TABLE

demo=# INSERT INTO products (name, price_cents) VALUES ('Sticker Démo', 150);
INSERT 0 1

demo=# SELECT * FROM products;
 id |     name     | price_cents 
----+--------------+-------------
  1 | Sticker Démo |         150
(1 row)

demo=# \dt
        List of relations
 Schema |   Name   | Type  | Owner 
--------+----------+-------+-------
 public | products | table | demo
(1 row)

demo=# \q
```

*Exécution séquentielle fonctionnelle :*
```powershell
PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker stop demo-db
demo-db

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker rm demo-db
demo-db

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
