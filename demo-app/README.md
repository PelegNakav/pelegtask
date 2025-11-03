# Bank Hapoalim DevOps Project

This project demonstrates a complete CI/CD pipeline using Docker, Jenkins, and Helm for a Spring Boot application.

## Project Structure

```
demo-app/
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── example/
│   │               └── demo/
│   │                   └── DemoApplication.java
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── demo/
│                       └── DemoApplicationTests.java
├── helm/
│   └── demo-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── deployment.yaml
│           └── service.yaml
├── pom.xml
├── Dockerfile
├── Jenkinsfile-CI
└── Jenkinsfile-CD
```

## Components Explanation

### 1. Java Application
- Simple Spring Boot application with a REST endpoint
- Maven-based build configuration
- Unit tests included

### 2. Docker Configuration
- Base image: `openjdk:11-jre-slim`
- Exposes port 8080
- Includes the compiled JAR file
- Multi-stage build for optimized image size

### 3. Jenkins CI Pipeline
The CI pipeline (`Jenkinsfile-CI`) includes the following stages:
1. **Checkout**: Retrieves code from version control
2. **Build**: Compiles the Java application using Maven
3. **Test**: Runs unit tests and publishes results
4. **Build Docker Image**: Creates a Docker image of the application
5. **Push Docker Image**: Pushes the image to a Docker registry

### 4. Jenkins CD Pipeline
The CD pipeline (`Jenkinsfile-CD`) includes:
1. **Pull Docker Image**: Retrieves the image from the registry
2. **Deploy to Test**: Deploys the application using Helm
3. **Post-Deployment Tests**: Verifies the deployment
4. **Rollback**: Automatic rollback on failure

### 5. Helm Chart
The Helm chart includes:
- Deployment configuration
- Service configuration
- Configurable values for different environments
- Resource limits and requests
- Node affinity and tolerations support

## Setup Instructions

1. Build the Java application:
```bash
mvn clean package
```

2. Build the Docker image:
```bash
docker build -t your-registry/demo-app:latest .
```

3. Configure Jenkins:
- Install required plugins (Docker, Kubernetes)
- Add credentials for Docker registry
- Create CI pipeline pointing to Jenkinsfile-CI
- Create CD pipeline pointing to Jenkinsfile-CD

4. Deploy using Helm:
```bash
helm install demo-app ./helm/demo-app
```

## Troubleshooting

### Common Issues and Solutions

1. **Maven Build Failures**
   - Check Java version compatibility
   - Verify dependencies in pom.xml
   - Clear Maven cache if needed

2. **Docker Build Issues**
   - Ensure Docker daemon is running
   - Check for sufficient disk space
   - Verify base image availability

3. **Jenkins Pipeline Failures**
   - Verify credentials configuration
   - Check tool installations (Maven, JDK)
   - Review pipeline syntax

4. **Helm Deployment Issues**
   - Verify Kubernetes cluster connection
   - Check namespace permissions
   - Validate values.yaml configuration

## Best Practices

1. **Security**
   - Use specific versions for base images
   - Implement security scanning
   - Follow least privilege principle

2. **Performance**
   - Implement resource limits
   - Use multi-stage Docker builds
   - Configure horizontal scaling

3. **Maintainability**
   - Document all configuration
   - Use version control for Helm charts
   - Implement monitoring and logging
