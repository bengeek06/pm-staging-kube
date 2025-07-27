# pm-staging-kube

![Kubernetes](https://img.shields.io/badge/kubernetes-ready-blue?logo=kubernetes)
![Tilt](https://img.shields.io/badge/tilt-dev-green?logo=tilt)
![Docker](https://img.shields.io/badge/docker-ready-blue?logo=docker)
![PostgreSQL](https://img.shields.io/badge/postgres-3%20databases-blue?logo=postgresql)
![Next.js](https://img.shields.io/badge/next.js-frontend-black?logo=next.js)
![Swagger](https://img.shields.io/badge/swagger-ui-green?logo=swagger)
![Flask](https://img.shields.io/badge/flask-api-black?logo=flask)
![Python](https://img.shields.io/badge/python-3.11-blue?logo=python)

This repository contains Kubernetes and Tilt configuration for a multi-service development environment with:
- Multiple Python APIs (`pm-auth-api`, `pm-identity-api`, `pm-guardian-api`)
- Three persistent PostgreSQL databases
- A Next.js frontend
- Swagger UI for interactive API documentation
- PgAdmin for database administration

## Prerequisites
- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/docs/) (Docker driver recommended)
- [Tilt](https://tilt.dev/)

## Repository structure

```
k8s/                  # Kubernetes manifests (deployments, services, etc.)
pm-auth-api/          # Auth service source code and Dockerfile
pm-identity-api/      # Identity service source code and Dockerfile
pm-guardian-api/      # Guardian service source code and Dockerfile
pm-front/             # Next.js frontend
```

## How to start/stop the environment

Use the provided script to manage the full dev environment:

```bash
./dev-env.sh start   # Start minikube, all mounts, and Tilt
./dev-env.sh stop    # Stop Tilt, all mounts, and minikube
./dev-env.sh reload  # Restart all mounts (if needed)
```

Access the Tilt UI at http://localhost:10350

### Service endpoints
- **Swagger UI**: http://localhost:8081
- **PgAdmin**: http://localhost:8080 (login: admin@admin.com / adminpass)
- **pm-auth-api**: http://localhost:5000
- **pm-identity-api**: http://localhost:5001
- **pm-guardian-api**: http://localhost:5002
- **pm-front**: http://localhost:3000
- **Postgres auth-db**: localhost:5432
- **Postgres identity-db**: localhost:5433
- **Postgres guardian-db**: localhost:5434

## License
See LICENSE and LICENCE.md files in each directory.
