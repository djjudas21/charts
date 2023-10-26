# connectbox-exporter

A Prometheus exporter for monitoring Compal CH7465LG cable modems. These are sold under the name "Connect Box" by Unitymedia in Germany, Ziggo in the Netherlands and UPC in Switzerland/Austria/Poland. Or as "Virgin Media Super Hub 3" by Virgin Media.

## Values

The most important values to set are the IP of your modem and its password.

```yaml
config:
  # Connect Box IP address
  ipAddress: 192.168.0.1

  # Connect Box web interface password
  password: WhatEverYourPasswordIs

# Allow Prometheus Monitor to scrape this exporter
serviceMonitor:
  enabled: false
```

## Deployment

Te recommended way to run this exporter is in Kubernetes via the [Helm chart](https://github.com/djjudas21/charts/tree/main/charts/connectbox-exporter).
The Helm chart also supports integration with the [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator) and will
create ServiceMonitor resources to enable automatic scraping.

```console
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update djjudas21
helm install -n monitoring connectbox-exporter djjudas21/connectbox-exporter
```
