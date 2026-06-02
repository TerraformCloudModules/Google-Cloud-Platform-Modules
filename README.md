# Google Cloud Platform Modules (Multi-Environment Bootstrapper)

This framework provisions infrastructure inside Google Cloud Platform across isolated **Development** and **Production** environments within the **same** GCP project and billing account. 

State separation is handled natively using **Terraform Workspaces**, and configuration is driven by environment-specific YAML files.

---

## Workspace Directory Structure

*   [main.tf](main.tf) - Root orchestrator mapping modules together.
*   [providers.tf](providers.tf) - Configures the Google provider.
*   [gcp-config/](gcp-config/)
    *   [gcp-config/dev.yaml](gcp-config/dev.yaml) - Configuration file for the **dev** environment.
    *   [gcp-config/prod.yaml](gcp-config/prod.yaml) - Configuration file for the **prod** environment.

---

## Environments & Naming Separation

Since both environments reside inside the same GCP project, naming collisions are prevented by appending environment suffixes (e.g., `-dev` and `-prod`) to GCS bucket names and Service Account IDs in their respective YAML files.

State isolation is achieved using Terraform Workspaces:
*   **dev** Workspace $\rightarrow$ writes state to `terraform.tfstate.d/dev/terraform.tfstate`
*   **prod** Workspace $\rightarrow$ writes state to `terraform.tfstate.d/prod/terraform.tfstate`

---

## Getting Started

### 1. Initialize local GCP authentication
Run the following command to update your application credentials locally:
```bash
gcloud auth application-default login
```

### 2. Working in the Development Environment

```bash
# Switch to or create the dev workspace
terraform workspace select dev || terraform workspace new dev

# Initialize the workspace (downloads providers & links config/dev.yaml)
terraform init

# Run plan or apply
terraform plan
terraform apply
```

### 3. Working in the Production Environment

```bash
# Switch to or create the prod workspace
terraform workspace select prod || terraform workspace new prod

# Initialize/configure workspace (links config/prod.yaml)
terraform init

# Run plan or apply
terraform plan
terraform apply
```

---

## Cleanup
To remove all resources from a specific environment:
```bash
# Select target workspace
terraform workspace select dev

# Run destroy
terraform destroy
```
