# Docker Compose: Nginx + Flask

This project demonstrates how to set up a simple **Flask** server behind **Nginx** using **Docker Compose**. The server responds with `"Hello World!"` when accessed.

## 📌 Requirements
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🚀 How to Use?

You can execute the following commands:

### 1️⃣ Start Docker Compose:
```bash
docker-compose up --build
```

### 2️⃣ In another terminal, run the following command:

```bash
curl -v http://localhost
```

### ✅ Expected Output:
- 📜 **In the first terminal:** You will see logs from the server and Nginx.  
- 📡 **In the second terminal:** You should see:  ```Hello World!```
