# Antes de inciar

** Instala AWS CLI

** Instala terraform

# Luego

Debes autenticarte con tus credenciales de AWS (SSO o Secret key, access key)

```bash
aws configure --profile <tu perfil>

o

aws configure sso --profile <tu perfil>

```

El comando anterior te debe solicitar los valores de Secret key, access key.

Si utilizas SSO consulta en llaves de inicio de sesion los valores: (URL SSO, REGION)

# Despliegue de infraestructura en Terraform 

vea indicaciones en

https://github.com/SantiagoNieto887883/Terraform_v3/tree/main/IAC/TERRAFORM