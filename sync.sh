rsync -e "ssh -i $(minikube ssh-key)" -auv ./ docker@$(minikube ip):cni-from-scratch/

minikube ssh 'cd cni-from-scratch && ./install.sh'
