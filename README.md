# trivy-init

### Build

```
## download trivy-db releases
wget https://github.com/aquasecurity/trivy-db/releases/download/v1-2022072200/trivy-offline.db.tgz

tar -zxvf trivy-offline.db.tgz

## docker build
docker build -t trivy-init:0.0.1 .

## docker tag && docker push
```

### How to use

Add a init container to trivy:

```
      initContainers:
      - name: trivy-init
        image: trivy-init:0.0.1
        imagePullPolicy: IfNotPresent
        command: ["/bin/sh"]
        args: ["-c", "set -x && mkdir -p /home/scanner/.cache/trivy && cp -r /trivy/. /home/scanner/.cache/trivy/ || true"]
        volumeMounts:
        - mountPath: /home/scanner/.cache
          name: data
```

