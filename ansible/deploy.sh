ansible-playbook -i hosts configuracion-inicial-vms.yaml
ansible-playbook -i hosts -l master,workers tareas-comunes-master-workers.yaml
