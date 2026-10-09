Commande d'exécution du script (via Git Bash)

```bash

$ bash reseaux_egor_khaybulov.sh
60d93e85071f07041319a653f7876850505cb3992196cedc13ec16ce8f136ab1
0a8625f4f801539fbac6e4590c2192bb9b6cd760a78a0a2545e588b990bca0d1
4a2dfee784a48fbab9a314fe4e18d06fda9711ae52f4f073bb95170d222bf74c
[+] Building 0.9s (10/10) FINISHED                                                                   docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                         0.0s
 => => transferring dockerfile: 422B                                                                         0.0s
 => [internal] load metadata for docker.io/library/node:22.11-alpine                                         0.5s
 => [internal] load .dockerignore                                                                            0.0s
 => => transferring context: 83B                                                                             0.0s
 => [1/5] FROM docker.io/library/node:22.11-alpine@sha256:b64ced2e7cd0a4816699fe308ce6e8a08ccba463c757c00c14cd372e3d2c763e 0.0s
 => [internal] load build context                                                                            0.0s
 => => transferring context: 259B                                                                            0.0s
 => CACHED [2/5] WORKDIR /app                                                                                0.0s
 => CACHED [3/5] COPY --chown=node:node package*.json ./                                                     0.0s
 => CACHED [4/5] RUN npm ci --only=production                                                                0.0s
 => CACHED [5/5] COPY --chown=node:node . .                                                                  0.0s
 => exporting to image                                                                                       0.0s
 => => exporting layers                                                                                      0.0s
 => => writing image sha256:4051605aea06a2e86bbce86e7636b7b7e407c4a3fd7e76a26c928dac33e219a9                 0.0s
 => => naming to docker.io/library/demo-api:1.0                                                              0.0s

What's next:
    View a summary of image vulnerabilities and recommendations → docker scout quickview
ff09acfb04676583f9ed9ac1e6a3fbe74606f8455a225177b767e6de7b44f1de
172.19.0.2        demo-db  demo-db
nc: getaddrinfo for host "demo-db" port 5432: Name does not resolve
<nil> 172.19.0.2

{  []} 172.19.0.3
<nil> 172.18.0.2

[{"id":3,"name":"T-shirt conteneur","price_cents":1990,"created_at":"2026-10-09T09:20:46.307Z"},{"id":2,"name":"Mug Docker","price_cents":990,"created_at":"2026-10-09T09:20:46.307Z"},{"id":1,"name":"Sticker Demo","price_cents":150,"created_at":"2026-10-09T09:20:46.307Z"}]
demo-api
demo-db
demo_front
demo_back
```