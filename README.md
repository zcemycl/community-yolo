# Community You Only Look Once

## Infrastructure Setup
```bash
cd architecture/envs/prod
terraform init
terraform apply -auto-approve
```

## Installation
|Scenario|Command|
|---|---|
|MacOS Dev|`poetry install`|
|MacOS Deploy|`poetry install --without dev`|
