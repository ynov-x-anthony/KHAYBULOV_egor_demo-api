```bash
docker run --name api -p 8080:3000 demo-api:1.0
{"level":"info","msg":"demo-api started","port":3000,"version":"dev"}

wsl curl -v http://localhost:8080/health
 Host localhost:8080 was resolved.
 IPv6: ::1
 IPv4: 127.0.0.1
   Trying [::1]:8080...
 Established connection to localhost (::1 port 8080) from ::1 port 32982 
 using HTTP/1.x
 GET /health HTTP/1.1
 Host: localhost:8080
 User-Agent: curl/8.18.0
 Accept: */*
 
Request completely sent off
 HTTP/1.1 200 OK
 X-Powered-By: Express
 Content-Type: application/json; charset=utf-8
 Content-Length: 15
 ETag: W/"f-RQ8OySFd+KR+AvtJ7qImjtT0D/0"
 Date: Tue, 06 Oct 2026 12:53:55 GMT
 Connection: keep-alive
 Keep-Alive: timeout=5
 
Connection #0 to host localhost:8080 left intact
{"status":"UP"}

docker image ls demo-api
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
demo-api     1.0       ec028f30ee0b   2 minutes ago    243MB

docker build -t demo-api:1.0 ./api --progress=plain
#0 building with "default" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 214B 0.0s done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/library/node:22-alpine
#2 DONE 1.0s

#3 [internal] load .dockerignore
#3 transferring context: 85B 0.0s done
#3 DONE 0.0s

#4 [1/5] FROM docker.io/library/node:22-alpine@sha256:0a7108bf6c7bf5de370ffb1a3ed6be93d405b43ff159f681a8d18c0e2bc2e402
#4 resolve docker.io/library/node:22-alpine@sha256:0a7108bf6c7bf5de370ffb1a3ed6be93d405b43ff159f681a8d18c0e2bc2e402 0.0s done
#4 DONE 0.0s

#5 [internal] load build context
#5 transferring context: 3.06kB 0.0s done
#5 DONE 0.0s

#6 [3/5] COPY package.json package-lock.json ./
#6 CACHED

#7 [2/5] WORKDIR /app
#7 CACHED

#8 [4/5] RUN npm ci --omit=dev
#8 CACHED

#9 [5/5] COPY server.js db.js ./
#9 DONE 0.0s

#10 exporting to image
#10 exporting layers 0.1s done
#10 exporting manifest sha256:1d3390922d6610e0ea9480da1fbff828482146adfa91c1f74b22b95ce6ff79fb 0.0s done
#10 exporting config sha256:ec028f30ee0b76e7587480035a675a6e93dfbad60b79cf89a6f8328636ce8651 0.0s done
#10 DONE 0.2s
docker tag demo-api:1.0 egorkhaybulov/demo-api:1.0                                                                                                                     
docker push egorkhaybulov/demo-api:1.0                                                                                                                                 
The push refers to repository [docker.io/egorkhaybulov/demo-api]                                                                                                                                                                    
f7f2d304681a: Pushed 
44136fa355b3: Pushed 
40a712ede1b8: Pushed 
e2de96513ba9: Mounted from library/postgres 
e554276b05e6: Pushed 
d39db1cf9caa: Pushed 
d9e00207214d: Pushed 
b1763a7d3ec4: Pushed 
e7c13e9b9bf5: Pushed 
1d5acbef86f2: Pushed 
1.0: digest: sha256:7dc43125f84dcdd2729e4c4fc1c19257c4ecae39c04ef79e10c791ce429bab85 size: 856
```