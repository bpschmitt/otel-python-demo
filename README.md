# otel-python-demo
In this repo, you'll find a simple Python demo app instrumented with OpenTelemetry based on the Python [Getting Started](https://opentelemetry.io/docs/languages/python/getting-started/) guide.  This app provides a easy-to-use, lightweight way to familiarize yourself with running OpenTelemetry instrumented microservices running in a Kubernetes cluster.  

The OpenTelemetry Collector is configured to send telemetry data to your New Relic account where you can easily visualize Metrics, Traces, and Logs in a single, integrated platform.

## Installing the OpenTelemetry Collector

```
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm upgrade --install opentelemetry-collector open-telemetry/opentelemetry-collector -f collector/values.yaml -n collector --create-namespace
```

## Installing the demo app

```
kubectl create ns demo && kubectl apply -f k8s/. -n demo
```

## Building the Container

```
docker buildx build --platform linux/amd64,linux/arm64 ./ -t <your user>/otel-python-demo:0.1
```

```
docker push <your user>/otel-python-demo:0.1
```