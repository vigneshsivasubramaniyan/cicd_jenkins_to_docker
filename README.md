# 🚀 Two Tier Web Application with CI/CD Automation

This project implements a **two-tier web application** deployed as a **Docker container**, fully automated using a **CI/CD pipeline** powered by **GitHub → Jenkins → Docker**.  
The entire process—build, containerize, push, deploy—is executed automatically on a self-hosted Docker server.

---

## 📌 Repository  
**GitHub Repo:** `cicd_jenkins_to_docker`

---

## 📁 Project Overview

This project demonstrates how to automate a real-world web application pipeline using:

- Git & GitHub  
- Jenkins Pipeline (Pipeline as Code)  
- Docker & Docker Hub  
- HTML, CSS, JavaScript  
- Self-hosted Docker environment

The goal of this setup is to achieve **zero manual deployment**, with Jenkins handling the entire lifecycle from commit to production.

---

## 🌐 Architecture Overview

### **Tier 1 – Web Frontend**
A static website built with **HTML/CSS/JS**, served using an NGINX container.

### **Tier 2 – Hosting Layer**
A self-hosted Docker engine running the containerized frontend.

### **Automation Pipeline**
1. Developer pushes code to GitHub  
2. GitHub Webhook triggers Jenkins  
3. Jenkins builds Docker image  
4. Jenkins pushes image to Docker Hub  
5. Jenkins deploys the new image on self-hosted server  

---

## ⚙️ Tech Stack

- **Git** – Version control  
- **GitHub** – Source code hosting  
- **Jenkins** – CI/CD automation  
- **Docker** – Containerization  
- **HTML / CSS / JavaScript** – Application frontend  
- **NGINX** – Web server  
- **Docker Hub** – Image registry  
- **Self-hosted Linux Server** – Deployment target  

---

## 🔄 CI/CD Workflow

### **1. Commit & Push**
Developer pushes changes to the main branch of the repository.

### **2. CI – Jenkins Pipeline**
Pipeline performs:
- Code checkout  
- Docker image build  
- Tagging with Jenkins build number  
- Push to Docker Hub registry  

### **3. CD – Automated Deployment**
Jenkins connects to the server through SSH:
- Pulls latest Docker image  
- Stops and removes old container  
- Runs updated container on port 80  

This ensures the application is always running the latest stable version.

---

## 📁 Folder Structure

```
cicd_jenkins_to_docker/
│
├── app/
│   ├── index.html
│   ├── styles.css
│   ├── script.js
│   └── assets/
│
├── Dockerfile
├── Jenkinsfile
├── docker-compose.yml
└── README.md
```

---

## 🐳 Deployment

### Local Run
```
docker build -t local/webapp .
docker run -p 80:80 local/webapp
```

### Production Deployment
Handled automatically by Jenkins using:
- Docker Hub  
- SSH to your self-hosted Docker server  
- `docker run` / `docker-compose`  

---

## 🔐 Credentials & Secrets

Stored securely in Jenkins:
- Docker Hub username/password  
- SSH private key for deployment server  

No secrets are stored in the repository.

---

## 🧿 Key Features

- End-to-end automated CI/CD  
- Static web app served via NGINX  
- Docker-based deployment  
- Self-hosted environment  
- Clean, interview-ready architecture  
- Zero manual intervention workflow  

---

## 🎯 Why This Project Is Relevant for Interviews

- Demonstrates real DevOps automation (Git → Jenkins → Docker → Server)  
- Shows Jenkins Pipeline as Code knowledge  
- Proves containerization and deployment skills  
- Includes a clear folder structure  
- Recruiters can test the project using one Docker command  

---

## 📎 References to Pipeline Files  
(Located directly in the repository)

- **Jenkinsfile** → Full CI/CD logic  
- **Dockerfile** → App containerization  
- **docker-compose.yml** → Deployment config  

These files contain the complete automation logic and can be viewed for full details.

---

