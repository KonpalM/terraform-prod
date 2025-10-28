# terraform-

your-repo/
├─ .github/
│  └─ workflows/
│     └─ terraform.yml          # GitHub Actions pipeline
├─ envs/
│  ├─ nonprod/
│  │  └─ main.tf                # example stack (intentionally insecure first)
│  └─ prod/
│     └─ main.tf                # hardened stack
├─ modules/
│  └─ s3_secure/
│     └─ main.tf                # optional module (keeps code tidy)
├─ backend/
│  └─ state-backend.tf          # infra for TF remote state (run once)
├─ .tfsec.yaml                  # org policies / ignores
├─ .pre-commit-config.yaml      # local guardrails (optional but recommended)
└─ README.md
