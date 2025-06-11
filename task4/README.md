# Завдання 1:
Команди
```
chmod +x docker_install.sh
./docker_install.sh
docker_install.sh
```
### extra: script
```
#!/bin/bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
```

# Завдання 2
```
docker pull hello-world
docker run hello-world
```
### Extra
```
echo "<h1>El1ah Sandbox 2021</h1>" > ~/nginx/html/index.html
docker run -d -p 8080:80 -v ~/nginx/html:/usr/share/nginx/html nginx
```


# Завдання 3
### Dockerfile
```FROM nginx:alpine
ENV DEVOPS=El1ah
COPY gen_html.sh /docker-entrypoint.d/gen_html.sh
RUN chmod +x /docker-entrypoint.d/gen_html.sh
gen_html.sh
bash
```
### sh script for more convenient of html in Dockerfile
```
#!/bin/sh
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1>${DEVOPS} sandbox 2021</h1>
</body>
</html>
EOF
```
Commands
```
docker build -t contest:latest .
docker run -d -p 8080:80 contest:latest
```

## Завдання 4
```
docker login
docker tag contest:latest el1ah/myapp:latest
docker push el1ah/myapp:latest
```
https://hub.docker.com/r/el1ah/myapp


## Завдання 5
docker-compose file
```
version: '3.8'
services:
  web:
    build: ./custom_image
    deploy:
      replicas: 3
    ports:
      - "8080-8082:80"
    environment:
      - DEVOPS=${DEVOPS}
  db:
    image: postgres:15
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    volumes:
      - db-data:/var/lib/postgresql/data
  app:
    build: ./java-app
    depends_on:
      - db
    ports:
      - "${JAVA_APP_PORT}:8080"
volumes:
  db-data:
 ```
Java dockerfile

```
FROM openjdk:17-slim
WORKDIR /app
COPY target/java-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
```

### Extra: .env file

```
DEVOPS=el1ah
POSTGRES_DB=mydb
POSTGRES_USER=user
POSTGRES_PASSWORD=password
JAVA_APP_PORT=8083
```
```
docker-compose up -d
```
