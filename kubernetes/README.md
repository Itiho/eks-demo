# Kubernetes configure

## Metrics server

```
kubectl apply -f config/0-metrics-server/
```

## Create the namespaces
```
kubectl create namespace production
kubectl create namespace development
```