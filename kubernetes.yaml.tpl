apiVersion: apps/v1
kind: Deployment
metadata:
  name: testbuildcluster
  labels:
    app: testbuildcluster
spec:
  replicas: 1
  selector:
    matchLabels:
      app: testbuildcluster
  template:
    metadata:
      labels:
        app: testbuildcluster
    spec:
      containers:
      - name: testbuildcluster
        image: us-central1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/myrepo/testbuild:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: testbuildcluster
spec:
  selector:
    app: testbuildcluster
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
