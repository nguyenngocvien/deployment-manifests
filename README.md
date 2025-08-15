# Deployment Manifests

Repo này chứa toàn bộ **Kubernetes manifests** và cấu hình **ArgoCD Applications** để triển khai hệ thống lên các môi trường (dev, staging, production).

## 📂 Cấu trúc thư mục
````
.
├── argocd-apps/          # ArgoCD Application manifest để quản lý deployment
│   ├── app1/
│   │   ├──app-dev.yaml
│   │   ├──app-staging.yaml
│   │   ├──app-prod.yaml
│   ├── app2/
│   └── ...
├── charts/                 # Kubernetes manifests của từng service/app
│   ├── app1/
│   │   ├── Chart.yaml
│   │   ├── values-dev.yaml
│   │   ├── values-staging.yaml
│   │   ├── values-prod.yaml
│   │   ├── template/
│   │   │   ├── deployment.yaml
│   │   │   ├── service.yaml
│   │   │   └── ingress.yaml
│   └── app2/
│       ├── deployment.yaml
│       └── service.yaml
└── README.md

````

## 🚀 Sử dụng

### 1. Deploy qua ArgoCD
1. Commit và push manifest lên branch tương ứng (ví dụ: `main` cho production).
2. Vào ArgoCD UI → **Sync** Application → Hệ thống sẽ tự động deploy.

### 2. Deploy trực tiếp bằng kubectl

```bash
kubectl apply -f apps/service-a/deployment.yaml
kubectl apply -f apps/service-a/service.yaml
```
### 3. Deploy bằng Kustomize

```bash
kubectl apply -k overlays/dev
```

## 🔑 Nguyên tắc commit

* Tất cả manifest **phải được review** trước khi merge vào branch chính.
* **Không commit secrets** trực tiếp.

  * Secrets phải được mã hóa bằng [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) hoặc lưu trong Vault.
* Tuân thủ `.gitignore` để tránh commit file nhạy cảm.

## 🛠 Công cụ khuyến nghị

* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [kustomize](https://kustomize.io/)
* [helm](https://helm.sh/)
* [argocd](https://argo-cd.readthedocs.io/)

## 📄 License

MIT License

---