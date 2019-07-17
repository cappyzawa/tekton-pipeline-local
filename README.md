# tekton-pipeline-local
Running [tektoncd/pipeline: A K8s\-native Pipeline resource\.](https://github.com/tektoncd/pipeline) on Docker for mac.

## Settings
### Grant cluster-admin to current user
```bash
$ kubectl create clusterrolebinding cluster-admin-binding \
--clusterrole=cluster-admin \
--user=$USER
```

### Adding the Tekton Pipelines
```bash
$ curl -L https://github.com/tektoncd/pipeline/releases/download/v0.5.2/release.yaml | kubectl apply -f -
```

```bash
$ kubectl get pods --namespace tekton-pipelines
```

(optional) set context
```bash
$ kubectl config set-context docker-for-desktop/tekton-pipelines --cluster=docker-for-desktop-cluster --user=docker-for-desktop --namespace=tekton-pipelines
```

### Install requirements
See [Requirements](https://github.com/tektoncd/pipeline/blob/master/DEVELOPMENT.md#requirements)

### Setting insecure registry
See [Known good configuration](https://github.com/tektoncd/pipeline/blob/master/docs/tutorial.md)

### Install Tekton Dashboard
```bash
$ git clone https://github.com/tektoncd/dashboard && cd dashboard
$ kubectl apply -f config/release/gcr-tekton-dashboard.yaml
```

### Preparing run locally
```bash
$ make start
```

DockerRegistry: http://localhost:5000
DockerRegistryUI: http://localhost:8080
TektonDashboard: http://localhost:9097

### Running [Tutorial](https://github.com/tektoncd/pipeline/blob/master/docs/tutorial.md)
#### [Task](https://github.com/tektoncd/pipeline/blob/master/docs/tutorial.md#task)
```bash
$ kubectl apply -f examples/task.yaml
```

#### [Task Inputs and Outputs](https://github.com/tektoncd/pipeline/blob/master/docs/tutorial.md#task-inputs-and-outputs)
```bash
$ kubectl apply -f examples/task_inputs_and_outputs.yaml
```

#### [Pipeline](https://github.com/tektoncd/pipeline/blob/master/docs/tutorial.md#pipeline)
```bash
$ kubectl apply -f examples/pipeline.yaml
```
