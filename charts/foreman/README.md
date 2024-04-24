Experimental Kubernetes support for [Foreman](https://theforeman.org) project.

by default, this deployment uses the published foreman image at https://quay.io/repository/foreman/foreman, and it does not include any additional plugins, if you require more plugins, please rebuild the image yourself.

This by no means is a replacement to the installer or should effect users besides the purpose of getting up an environment quickly

to use this repository
```sh
git clone git@github.com:ohadlevy/foreman-kube.git
cd foreman-kube
./deploy.sh
```

Your foreman instance should be available under https://foreman-prod.local (feel free to change the ingress)
default user admin, password changeme
