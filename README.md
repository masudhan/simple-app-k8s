# simple-app-k8s

Create virtual environment

`python3 -m venv venv` </br>
`source venv/bin/activate`

### For testing locally

Install dependencies

`pip install -r requirements.txt`

Run the app

`uvicorn main:app --reload`

Check the website at - http://localhost:8000

### To run as docker container

`docker build -t <image-name>:<tag> .`

`docker run -p 8000:80 <image-name>:<tag>`

Check the website at - http://localhost:8000

### Deploy in k8s

Expecting you have 

1. metallb setup, if not check [this](https://github.com/masudhan/learn-kubernetes/tree/main/5.1%20metallb) out
2. [ingress-nginx](https://github.com/kubernetes/ingress-nginx)


```
kubectl get all -n ingress-nginx - get the external IP

sudo vi /etc/hosts - paste the external IP, <IP> backend.example.com
cd k8s
kubectl apply -f deployment.yaml -f ingress.yaml -f service.yaml
```



