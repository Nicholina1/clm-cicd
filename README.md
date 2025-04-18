# clm-cicd

A full-stack web application integrated with Docker and GitHub Actions for a complete CI/CD pipeline setup. This project showcases how modern DevOps practices can be implemented in a development workflow using containerization, automation and continuous integration and deployment.

---

## Project Overview

The `clm-cicd` project is designed as a demonstration of building and deploying a multi-tiered web application using Docker and GitHub Actions. The backend is written in PHP, with a Nextjs frontend, all containerized and orchestrated via Docker Compose.

Key goals include:
- Automating the build and deployment process
- Running backend services with proper isolation
- Using GitHub Actions for CI/CD pipelines
- Learning best practices in DevOps and deployment workflows

---

## Project Structure

```bash
clm-cicd/
│
├── .github/workflows/       # GitHub Actions workflows (CI/CD definitions)
├── back-end/                # Backend PHP application source code
├── frontend-old/            # Frontend JavaScript code
├── Dockerfile.Postgres      # Dockerfile for PostgreSQL setup
├── docker-compose.yaml      # Docker Compose file to spin up services
├── deploy.sh                # Shell script for deployment steps
└── set_env.sh               # Script for exporting environment variables
```

---

## Tech Stack

- **Backend**: PHP
- **Frontend**: Nextjs 
- **Database**: PostgreSQL (via Docker)
- **Containerization**: Docker, Docker Compose
- **CI/CD**: GitHub Actions

---

## Setup Instructions

### Prerequisites

- Docker & Docker Compose installed
- Git installed
- Bash shell (for running scripts)
- A GitHub account with repository access

---

### Local Development Setup

1. **Clone the Repository**

```bash
git clone https://github.com/Nicholina1/clm-cicd.git
cd clm-cicd
```

2. **Set Environment Variables**

Run the environment setup script:

```bash
source set_env.sh
```

Make sure to edit `set_env.sh` to reflect your environment settings.

3. **Start the Application with Docker Compose**

```bash
docker-compose up --build
```

4. **Access the Application**

Once the containers are running, open your browser:

```
http://localhost:8000
```

---

## Docker Configuration

### docker-compose.yaml

Orchestrates services including:

- PHP backend
- PostgreSQL database
- (Optional) Frontend

### Dockerfile.Postgres

Defines a custom PostgreSQL image used in the development environment.

---

## CI/CD Workflow with GitHub Actions

Located in `.github/workflows/`, the workflow automates:

- Code checkout and validation
- Linting and basic tests
- Docker image build
- Optional deployment trigger

### Sample Steps in GitHub Actions

- **CI Phase**:
  - Runs on `push` or `pull_request` to `main`
  - Sets up PHP environment
  - Installs dependencies
  - Executes tests (to be implemented)

- **CD Phase**:
  - Builds Docker containers
  - Pushes to Docker Hub (if configured)
  - Runs deployment scripts

---

## Deployment

To deploy manually (if not using GitHub Actions CD):

```bash
bash deploy.sh
```

Ensure the script contains the appropriate SSH commands, Docker image pull, and container startup instructions for your remote server.

---

## Testing

> _Note: Test coverage will be added in future versions._

For now, focus is on:
- Linting PHP/JS files
- Ensuring successful container builds
- CI pipeline integrity

---

## Environment Configuration

The `set_env.sh` file is used to export required environment variables. Edit this file with actual values for:

- Database credentials
- API secrets
- Port numbers

Example:

```bash
export DB_HOST=localhost
export DB_USER=postgres
export DB_PASSWORD=yourpassword
```

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a new feature branch: `git checkout -b feature/YourFeature`
3. Commit changes: `git commit -m "Add your message"`
4. Push to your fork: `git push origin feature/YourFeature`
5. Open a pull request

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 📬 Contact

For inquiries or collaboration opportunities, please contact [Nicholina](mailto:noacheaw18@gmail.com).

---
