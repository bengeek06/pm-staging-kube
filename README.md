# pm-staging-kube

This repository contains Kubernetes and Tilt configuration for a multi-service development environment with:
- Multiple Python APIs (`pm-auth-api`, `pm-identity-api`)
- Two PostgreSQL databases
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
pm-front/             # Next.js frontend
```

## How to start the environment

1. **Start Minikube**
   ```bash
   minikube start --driver=docker
   ```

2. **Mount folders for Swagger UI and pm-front**
   (Open three terminals)
   ```bash
   minikube mount ./pm-auth-api:/mnt/pm-auth-api
   minikube mount ./pm-identity-api:/mnt/pm-identity-api
   minikube mount ./pm-front:/mnt/pm-front
   ```

3. **Start Tilt**
   ```bash
   tilt up
   ```
   Access the Tilt UI at http://localhost:10350

4. **Service endpoints**
   - **Swagger UI**: http://localhost:8081
   - **PgAdmin**: http://localhost:8080 (login: admin@admin.com / adminpass)
   - **pm-auth-api**: http://localhost:5000
   - **pm-identity-api**: http://localhost:5001
   - **pm-front**: http://localhost:3000
   - **Postgres auth-db**: localhost:5432
   - **Postgres identity-db**: localhost:5433

## License
See LICENSE and LICENCE.md files in each directory.
