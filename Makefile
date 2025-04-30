dev-apply:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=terraform/environments/dev/state.tfvars
	terraform apply -auto-approve -var-file terraform/environments/dev/main.tfvars

dev-destroy:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=terraform/environments/dev/state.tfvars
	terraform destory -auto-approve -var-file terraform/environments/dev/main.tfvars

prod-apply:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=terraform/environments/prod/state.tfvars
	terraform apply -auto-approve -var-file terraform/environments/prod/main.tfvars

prod-destroy:
	git pull
	rm -rf .terraform/terraform.tfstate
	terraform init -backend-config=terraform/environments/prod/state.tfvars
	terraform destory -auto-approve -var-file terraform/environments/prod/main.tfvars