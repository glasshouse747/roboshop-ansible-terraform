infra-apply:
	git pull
	terraform init
	terraform apply -auto-approve

infra-destroy:
	git pull
#	terraform init
	terraform init -backend=false
	terraform destroy -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-int.mydevops.shop, -e ansible_user=azuser -e ansible_password=Giveme123456 tools.yml -e tool_name=$(tool_name)