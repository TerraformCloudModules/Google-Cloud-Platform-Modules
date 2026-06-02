# Google Cloud Platform Modules (Workspace-Driven Bootstrapper)

A plug-and-play, YAML-driven Terraform framework that provisions GCP infrastructure with automatic environment separation using **Terraform Workspaces**.

---

## Design Principles

*   **Single Project**: One GCP project for all environments.
*   **Single Billing Account**: One billing account for all environments.
*   **Single Configuration File**: One `gcp-config.yaml` as the source of truth.
*   **Workspace-Driven Naming**: The active Terraform workspace name is appended automatically to all resource names.

---

## Naming Convention

All resource names follow this pattern:

```text
<resource-name>-<workspace>
```

| Workspace | Service Account       | Bucket                              |
|-----------|-----------------------|-------------------------------------|
| `dev`     | `ankush-tf-sa-dev`    | `ankush-tf-framework-bucket-v2-dev` |
| `staging` | `ankush-tf-sa-staging`| `ankush-tf-framework-bucket-v2-staging` |
| `prod`    | `ankush-tf-sa-prod`   | `ankush-tf-framework-bucket-v2-prod`|

The GCP **Project ID**, **Billing Account**, and **API enablement** are shared and remain unsuffixed.

---

## Getting Started

### 1. Authenticate with GCP
```bash
gcloud auth application-default login
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Deploy to an Environment

```bash
# Create and switch to the dev workspace
terraform workspace select -or-create dev
terraform plan
terraform apply

# Switch to prod workspace
terraform workspace select -or-create prod
terraform plan
terraform apply
```

### 4. Destroy an Environment
```bash
terraform workspace select dev
terraform destroy
```

---

## Directory Structure

| Path | Description |
|------|-------------|
| [main.tf](main.tf) | Root orchestrator with naming middleware |
| [providers.tf](providers.tf) | Google Cloud provider configuration |
| [outputs.tf](outputs.tf) | Root-level output declarations |
| [gcp-config/gcp-config.yaml](gcp-config/gcp-config.yaml) | Single configuration file (base resource names) |
| [modules/gcp-config/](modules/gcp-config/) | YAML config parser module |
| [modules/gcp-project/](modules/gcp-project/) | GCP project & API enablement module |
| [modules/gcp-service-account/](modules/gcp-service-account/) | Service account & IAM module |
| [modules/gcp-bucket/](modules/gcp-bucket/) | GCS storage bucket module |
