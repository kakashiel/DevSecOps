## Welcome to Adrien laboratory

The objectif of this project, it's to try tools for improve life of developer and sys admin. When you lauch installation, it's create a virtual machine with some tools like kuberntes . After that you can test your news devops tools  

Access to the web page [here:](https://kakashiel.github.io/DevSecOps/)

### Installation lab

Before begin you need to install:

**Version OS:** Ubuntu 18.10 LTS

**Provider:** [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

**Tools:** [Vagrant](https://www.vagrantup.com/downloads.html) / [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

```
$ brew cask install virtualbox
$ brew install vagrant
$ brew install ansible
$ sudo sh -c "echo 192.168.33.10   k8s >> /etc/hosts"
```

### Launch lab
```
$ cd ansible && ansible-playbook palybook.yml
```
### Access tools

Access to the [kubernetes dashboard](http://192.168.33.10:8080/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/)

Access to the [Grafana](/api/v1/namespaces/kube-system/services/monitoring-grafana/proxy)

### Useful tools:
For more info try 
```
// General system info
$ nmon

// K8s cluster info
$ k cluster-info
```