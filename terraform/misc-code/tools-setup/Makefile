infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-int.mydevops.shop, -e ansible_user=azuser -e ansible_password=Giveme123456 tool_setup.yml -e tool_name=$(tool_name)