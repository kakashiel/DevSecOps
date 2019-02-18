Documentation accès: https://kakashiel.github.io/DevSecOps/
##INSTALL VM

**Version OS:** Ubuntu 16.04 LTS \
**Version Kubernetes:** 1.10.0 \
**Version Docker:** 18.06-ce \
**Version JHipster Container:** 5.2.1 
**Provider:** Virtualbox \
**Tool:** [Vagrant](https://www.vagrantup.com/downloads.html)


1.Installation
---------------


Modify in Vagrantfile the list of network configuration (depends on your machine).

We are fix locally the ip address of the server : 192.168.33.10. You can change it in the Vagrantfile.

```
    Run the VM
    ----------
    cd /Server
   vagrant up or vagrant up --provision


   Access to kube dasnhboard: http://192.168.33.10:30000/
   -------------------------
   Create on the host of VM, a local host (example: /etc/hosts) for kube dashboard:
        192.168.33.10 kube-intermarche.local

   Access to kube dasnhboard : http://kube-intermarche.local:30000/
```
####1.1 Verify installation and useful command
```

  Enter in the VM
  ---------------
  vagrant ssh
  
  To verify image updload: vagrant box list
  -----------------------
  
  Verify all activity un kube: kubectl get all --all-namespaces
  ---------------------------

  Share folder: /srv/app
  ------------
   
   To purge Minikube:
   ------------------
   
   minikube stop
   minikube delete
   docker rm $(docker ps -aq)
   docker volume ls
   docker volume prune
   docker rmi $(docker images -aq)


```
####1.1 Port access app's

| API | PORT |
| --- | --- |
| Docker registry| 5000:5000 |
| kubernetes dashboard | 30000 |
| Sonar | 30001:8080, 30002:9092 |
| jenkins | 30003:8080, 30004:5000 |
