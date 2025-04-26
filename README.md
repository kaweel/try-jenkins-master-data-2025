# Jenkins Master-Data Pattern with Docker

This repository demonstrates the classic **Master-Data Container Pattern** using **Docker** to separate **Jenkins master service** and **data storage**.

Even though this pattern is less common nowadays (Docker volumes are preferred), it is a great exercise to understand **how containerized storage separation works** in Docker architecture.

---

## 📦 Structure

- `data/Dockerfile`
  - Create a **Jenkins Data Container** to store `/var/jenkins_home` and `/var/log/jenkins`.
- `master/Dockerfile`
  - Build a **Jenkins Master Container** based on the official `jenkins/jenkins:lts` image.
- `Makefile`
  - Provide commands to build and run the system easily.

---

## 🛠 How to Run

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/jenkins-master-data.git
cd jenkins-master-data
```

2. **Build Jenkins Data Container**

```bash
make build-jenkins-data
```

This will:
- Build a simple data container image
- Create a container named `jenkins-data`

3. **Build Jenkins Master Container**

```bash
make build-jenkins-master
```

4. **Run Jenkins Master**

```bash
make run
```

This will:
- Start a container named `jenkins-master`
- Mount volumes from `jenkins-data`
- Expose ports `8080` (Jenkins Web UI) and `50000` (JNLP Agent)

---

## 📚 What You Will Learn

- How to separate data from service containers.
- How `--volumes-from` works in Docker.
- Why data persists even if the data container is removed.
- Volume management behind the scenes in Docker.

---

## 🧐 Notes

- The **Data Container** (`jenkins-data`) **only holds volume information**, it doesn't run any Jenkins service.
- The **Master Container** (`jenkins-master`) holds the Jenkins server and uses the data volume for persistent storage.
- Removing `jenkins-data` container **does not** affect running Jenkins Master as long as it still holds the volume.

---

## ⚡ Future Improvements

- Migrate to **Docker Volumes** instead of relying on `--volumes-from`.
- Build a **docker-compose.yml** to manage master and data containers together.
- Add **automatic backup** of Jenkins data volumes.

---