# CST8918 Final Project - Group 2

## Overview

This project deploys a Redis-enabled Remix Weather App to Microsoft Azure using Terraform, AKS, ACR, Azure Cache for Redis, and GitHub Actions.

---

## Team Members

| Name | GitHub |
|------|--------|
| Jingjing Duan | https://github.com/Jingjing-Duan |
| Ruaa Thamer   | https://github.com/RuaaThamer    |
| Shan Jiang | https://github.com/Shan-AC|
| Khalid Amchat| https://github.com/KhalidAlgonquin |

---
## Azure Infrastructure

| Resource | Configuration |
|---|---|
| Resource Group | `cst8918-final-project-group-2` |
| Region | Canada Central |
| VNet | `10.0.0.0/14` |
| Test AKS | 1 node |
| Production AKS | Autoscaling: 1–3 nodes |
| AKS VM Size | `Standard_D4ls_v6` |
| AKS Tier | Free |
| Kubernetes | Current supported AKS version |
| ACR | Stores Weather App images |
| Redis | Separate Basic C0 caches for test and prod |
| Log Analytics | AKS monitoring |

> **Note:** The original requirements specified `Standard_B2s` and Kubernetes 1.32. These settings were not suitable for the available Azure environment, so a supported VM size and current AKS version were used.

## CI/CD Workflows

- **Terraform Static Tests** - runs `terraform fmt`, `validate`, and `tfsec` on pushes.
- **Terraform PR Checks** - runs `tflint` and `terraform plan` on PRs to `main`.
- **Terraform Apply** - deploys infrastructure after changes are merged to `main`.
- **Weather App Test Deploy** - builds and pushes a commit-SHA image to ACR and deploys it to the test AKS cluster on application PRs.
- **Weather App Production Deploy** - builds and deploys the merged application to the production AKS cluster.

GitHub Actions authenticates to Azure using **OIDC federation**.

## Application Deployment Flow

```text
Weather App change
      ↓
Pull Request
      ↓
Build + Push image to ACR
      ↓
Deploy to Test AKS
      ↓
Approval + Merge
      ↓
Build production image
      ↓
Deploy to Production AKS
```


## Validation

Successfully verified:

- Terraform infrastructure deployment
- Test and production AKS clusters
- Redis caches
- Docker image push to ACR
- Test AKS deployment and rollout
- Production AKS deployment and rollout
- Public LoadBalancer access to the Weather App
- GitHub Actions OIDC authentication

## Screenshots

1. Successful Terraform Apply workflow
([Screenshot](<Screenshots/Terraform Apply workflow.png>))
2. Successful Weather App Test Deploy workflow
([Screenshot](<Screenshots/App Test Deploy workflow.png>))
3. Successful Weather App Production Deploy workflow
([Screenshot](<Screenshots/App Production Deploy workflow.png>))
4. AKS production service with public IP 
([Screenshot](<Screenshots/AKS production service.png>))
5. Running Weather App in the browser
([Screenshot](<Screenshots/Running Weather App.png>))

## Cleanup

After completing the project, Azure resources were destroyed to avoid unnecessary charges.

