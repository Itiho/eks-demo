# eks-demo

## Deploy infraestruture:

Use the following documents in sequence to deploy and configure kubernetes:

* [Network](terraform/network/README.md)
* [Eks](terraform/eks/README.md)



## Configure kubenetes:

Get the *kubeconfig_eks-demo* file in terraform/eks after deploy and add in your *~/.kube/config*.

After this following [Kubernetes config](kubernetes/README.md).


## Test application

Deploy the test application
```
helm upgrade --install nginx demo-chart --set image.repository=nginx --set image.tag=latest --set service.type=LoadBalancer
```

Wait to Loadbalance is create(ExternalIp is not <pending>)
```
kubectl get service nginx-demo-chart -w
```
Type 

Get the url

```
TEST_URL=$(kubectl get service nginx-demo-chart -o json |jq -r ".status.loadBalancer.ingress[].hostname")
```

Access the application

```
curl $TEST_URL                                                                                                                          <aws:pessoal>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

Remove test application

```
helm delete nginx
```