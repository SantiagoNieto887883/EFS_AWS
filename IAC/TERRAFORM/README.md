# Infraestructure efs 2 puntos de acceso

proyecto de EFS de manera modulada en AWS

---

# antes de iniciar

debes crear los archivos .tfvars en las rutas:

```bash
IAC/terraform/env/<env>/backend.tfvars

IAC/terraform/env/<env>/terraform.tfvars
```

-- contenido backend--

```bash
bucket         = "tu bucket"
key            = "tu ruta/terraform.tfstate"
region         = "tu region"
dynamodb_table = "tu tabla de dynamo"
encrypt        = true
profile = "tu perfil"
```
---

# reconfigurar el backend en tu terraform (opcional)

terraform init -reconfigure -backend-config=../../env/dev/backend.tfvars

## Comandos de despliegue


# DEV
```bash
cd IAC/terraform/live/dev
terraform init -backend-config=../../env/dev/backend.tfvars
terraform plan -var-file=../../env/dev/terraform.tfvars -out tfplan 
terraform apply tfplan
```

# PROD
```bash
cd IAC/terraform/live/prod
terraform init -backend-config=../../env/prod/backend.tfvars
terraform plan -var-file=../../env/prod/terraform.tfvars -out tfplan
terraform apply tfplan
```

# DESTRUYE

```bash

terraform destroy -var-file=../../env/dev/terraform.tfvars

```