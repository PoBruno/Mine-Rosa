# Instalação Minecraft Server Container

* Clone repositório
```sh
git clone https://github.com/PoBruno/Mine-Rosa
cd Mine-Rosa
```

* Troubleshoot folder permission
```sh
chown 1000:1000 data
chmod 777 data
```

* Deploy Container Server
```sh
docker-compose up -d
```

## CLI Minecraft Server
```sh
docker attach mcserver
```
