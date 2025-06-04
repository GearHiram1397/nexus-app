# Nexus - Infrastructure as Code Project

A modern web application deployment project showcasing Infrastructure as Code (IaC) best practices using multiple tools and technologies.

## Project Overview

Nexus is a Reddit-like application that demonstrates a complete infrastructure automation setup. The project implements various IaC tools and practices to create a robust, scalable, and maintainable infrastructure.

## Architecture

The project uses a microservices architecture with the following components:

- **Web Application**: Ruby-based Sinatra application
- **Database**: MongoDB for data persistence
- **Container Orchestration**: Kubernetes for container management
- **Infrastructure Provisioning**: Terraform for cloud infrastructure
- **Configuration Management**: Ansible for system configuration
- **Image Building**: Packer for custom AMI creation
- **Containerization**: Docker for application containerization

## Prerequisites

- Docker and Docker Compose
- Kubernetes cluster (minikube or cloud provider)
- Terraform
- Ansible
- Packer
- Ruby 3.1+
- MongoDB 6.0+

## Project Structure

```
.
├── ansible/              # Ansible playbooks and configuration
├── kubernetes/          # Kubernetes manifests
├── nexus-app/          # Application source code
├── packer/             # Packer templates for AMI creation
├── scripts/            # Deployment and configuration scripts
├── terraform/          # Infrastructure as Code
├── Dockerfile          # Application container definition
├── docker-compose.yml  # Local development environment
└── Vagrantfile        # Development VM configuration
```

## Quick Start

### Local Development

1. Start the application using Docker Compose:
   ```bash
   docker-compose up
   ```

2. Access the application at `http://localhost:9292`

### Infrastructure Deployment

1. Build the custom AMI using Packer:
   ```bash
   packer build packer/nexus-base-image.json
   ```

2. Deploy infrastructure using Terraform:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

3. Configure the instance using Ansible:
   ```bash
   ansible-playbook -i ansible/hosts.yml ansible/configuration.yml
   ```

4. Deploy the application:
   ```bash
   ansible-playbook -i ansible/hosts.yml ansible/deploy.yml
   ```

### Kubernetes Deployment

1. Apply Kubernetes manifests:
   ```bash
   kubectl apply -f kubernetes/manifests/
   ```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Infrastructure patterns and best practices from the DevOps community
