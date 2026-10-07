# Falcon CI/CD App

A containerized Python web service with an automated CI/CD pipeline built using GitHub Actions, Docker, automated testing, code coverage, and container vulnerability scanning.

This project demonstrates how a Python application can be tested, containerized, security-scanned, and delivered through an automated GitHub-based CI/CD workflow.

---

## Project Overview

The Falcon CI/CD App is a lightweight Python web application built with the Falcon framework.

The application exposes an `/images` endpoint that returns image metadata encoded using MessagePack.

The main objective of this project is not only to build the application, but to demonstrate a complete engineering workflow around it:

**Source Code → Automated Tests → Code Coverage → Docker Build → Security Scan → Artifact Reports → Docker Hub**

---

## Key Features

- Python REST-style web service using Falcon
- MessagePack response serialization
- Automated testing with Pytest
- Code coverage measurement
- Docker containerization
- GitHub Actions CI/CD automation
- Docker image build and delivery
- Docker Hub integration
- Container vulnerability scanning
- GitHub Code Scanning / SARIF integration
- CI artifacts for security and coverage reports
- Pull request validation
- Branch protection and required CI checks

---

## Technology Stack

| Category | Technology |
|---|---|
| Programming Language | Python |
| Web Framework | Falcon |
| Testing | Pytest |
| Code Coverage | Coverage.py |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| Container Registry | Docker Hub |
| Security Scanning | Anchore / Grype |
| Security Reporting | SARIF / GitHub Code Scanning |
| Version Control | Git / GitHub |

---

## Application Architecture

```text
                    Developer
                       |
                       v
                  Git Repository
                       |
                       v
                 GitHub Pull Request
                       |
                       v
              +---------------------+
              |   GitHub Actions    |
              +---------------------+
                       |
          +------------+-------------+
          |            |             |
          v            v             v
      Install       Pytest       Coverage
     Dependencies    Tests        Report
          |            |             |
          +------------+-------------+
                       |
                       v
                 Docker Build
                       |
                       v
             Container Security Scan
                       |
                       v
                SARIF / Artifacts
                       |
                       v
                 Docker Hub
```

---

## Project Structure

```text
falcon-cicd-app/
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── results/
│   ├── ci-pipeline-success.png
│   ├── coverage-report.png
│   └── vulnerability-report.png
│
├── tests/
│   └── test_app.py
│
├── app.py
├── images.py
├── __init__.py
├── Dockerfile
├── requirements.txt
├── .gitignore
└── README.md
```

---

## Application

The application is created with Falcon and exposes an `/images` endpoint.

The endpoint returns image metadata in MessagePack format.

Example response structure:

```python
{
    "images": [
        {
            "href": "/images/1eaf6ef1-7f2d-4ecc-a8d5-6e8adba7cc0e.png"
        }
    ]
}
```

---

## Running the Application Locally

### 1. Clone the repository

```bash
git clone https://github.com/Keerthikandula/falcon-cicd-app.git
cd falcon-cicd-app
```

### 2. Create a virtual environment

```bash
python -m venv env
```

### 3. Activate the virtual environment

#### Windows PowerShell

```powershell
.\env\Scripts\Activate.ps1
```

#### Linux / macOS

```bash
source env/bin/activate
```

### 4. Install dependencies

```bash
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### 5. Run the application

```bash
gunicorn -b 0.0.0.0:8000 app:app
```

The application will be available on:

```text
http://localhost:8000/images
```

---

## Running Tests

Run the automated test suite with:

```bash
python -m pytest tests/
```

To generate a coverage report:

```bash
coverage run -m pytest tests/
coverage report
```

---

## Docker

### Build the Docker image

```bash
docker build . -t keerthikandula/falcon-cicd-app
```

### Run the container

```bash
docker run -d -p 8000:8000 keerthikandula/falcon-cicd-app
```

The application can then be accessed at:

```text
http://localhost:8000/images
```

---

## CI/CD Pipeline

The GitHub Actions workflow automatically validates the application when changes are submitted through the repository workflow.

The pipeline performs the following major stages:

### 1. Environment Setup

- Checks out the repository
- Configures Python
- Installs project dependencies

### 2. Application Validation

- Builds the Docker image
- Starts the container
- Executes automated tests
- Generates a coverage report

### 3. Security

The Docker image is scanned for known vulnerabilities.

The security results are generated in SARIF format and uploaded to GitHub Code Scanning.

### 4. Artifacts

The workflow stores:

- Vulnerability scan results
- Coverage report

as GitHub Actions artifacts.

### 5. Docker Image Delivery

After successful validation, the Docker image is authenticated with Docker Hub and pushed as:

```text
keerthikandula/falcon-cicd-app:latest
```

---

## CI/CD Workflow

```text
Code Change
    |
    v
Pull Request
    |
    v
GitHub Actions
    |
    +--> Install Dependencies
    |
    +--> Docker Build
    |
    +--> Automated Tests
    |
    +--> Coverage Report
    |
    +--> Vulnerability Scan
    |
    +--> SARIF Security Report
    |
    +--> Upload Artifacts
    |
    v
Successful Validation
    |
    v
Docker Hub Image
```

---

## Security Scanning

The container image is scanned for known vulnerabilities before image delivery.

The scan results are integrated with GitHub Code Scanning using SARIF.

This provides visibility into potential security issues within the container image and demonstrates security integration within the CI/CD workflow.

---

## Testing and Quality

The project incorporates automated quality checks rather than relying only on manual verification.

The pipeline validates:

- Application tests
- Test execution
- Code coverage
- Docker image creation
- Container security
- CI workflow execution

This helps identify problems early in the development lifecycle.

---

## CI/CD Results

Screenshots demonstrating the successful pipeline execution are available in the `results/` directory.

The results include:

- Successful GitHub Actions pipeline
- Code coverage result
- Container vulnerability/security scan result

---

## Engineering Practices Demonstrated

This project demonstrates practical experience with:

- Version control using Git
- GitHub pull requests
- Branch-based development
- Automated CI workflows
- Automated testing
- Docker containerization
- Container security
- Artifact management
- Docker image publishing
- Security reporting
- Reproducible application environments

---

## Future Improvements

Possible future improvements include:

- Automated deployment to a cloud platform
- Kubernetes-based deployment
- Infrastructure as Code
- Automated release versioning
- Deployment environments
- Additional automated test coverage
- Monitoring and observability

---

## Author

**Keerthi Kandula**

MCA Graduate | Python | Software Testing | CI/CD | Docker | GitHub Actions

---

## Project Purpose

This project was developed as a practical demonstration of integrating software development, automated testing, containerization, security scanning, and CI/CD automation into a single engineering workflow.