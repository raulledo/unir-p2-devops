ansible-playbook -i hosts configuracion-inicial-vms.yaml
ansible-playbook -i hosts -l nfs instalacion-nfs.yaml
ansible-playbook -i hosts -l master,workers tareas-comunes-master-workers.yaml
ansible-playbook -i hosts -l master configuracion-kubernetes.yaml
ansible-playbook -i hosts instalacion-sdn.yaml
ansible-playbook -i hosts -l master instalacion-ingress-controller.yaml
ansible-playbook -i hosts -l master crear-usuario-no-admin.yaml
