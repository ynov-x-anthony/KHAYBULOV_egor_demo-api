```powershell
docker build -t demo-api:hardened -f api/Dockerfile api/

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker run --rm demo-api:hardened id
uid=1000(node) gid=1000(node) groups=1000(node)

docker run -d --name api -p 8080:3000 --read-only --tmpfs /tmp:size=16m --cap-drop ALL --security-opt no-new-privileges --pids-limit 200 --memory 256m --cpus 1 --network demo_net -e PGHOST=demo-db demo-api:hardened

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> (Invoke-WebRequest -Uri "http://localhost:8080/health" -UseBasicParsing).Content
{"status":"UP"}

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker exec api sh -c 'touch /app/x 2>&1'
touch: /app/x: Read-only file system

PS C:\Users\aze\IdeaProjects\Docker\KHAYBULOV_Egor_demo-api> docker inspect --format 'readonly={{.HostConfig.ReadonlyRootfs}} capdrop={{.HostConfig.CapDrop}}' api
readonly=true capdrop=[ALL]
```
