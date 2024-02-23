# smtp-relay
Helm chart for smtp-relay

This image provides an SMTP relay host for emails from within a Kubernetes cluster.

Configure this container to use an upstream authenticated SMTP relay like SendGrid or your ISP's mail server, and provide an
open relay service to your cluster. This means you don't have to configure all of your containerised services with email auth secrets.

```
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update
helm upgrade --install -n smtp-relay  [-f values.yaml] --create-namespace djjudas21/smtp-relay
```

As a minimum, you will need to provide your own `values.yaml` with some SMTP config:

| Key               | Required | Use                                  | Example                         |
|-------------------|----------|--------------------------------------|---------------------------------|
| `smtp.host`       | Required | Hostname of SMTP server to relay to  | `[smtp.sendgrid.net]:587`       |
| `smtp.username`   | Required | Username for SMTP server to relay to | `apikey`                        |
| `smtp.password`   | Required | Password for SMTP server to relay to | `pAsSwOrD`                      |
| `smtp.myhostname` | Optional | Hostname of this relay SMTP server   | `smtp-relay.example.com         |
| `smtp.mynetworks` | Optional | Networks to permit relaying from     | `['127.0.0.0/8', '10.0.0.0/8']` |

## Persistence

By default, this chart sets up an [emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir) volume to contain the
Postfix spool directory (`/var/spool/postfix`). If the pod crashes or gets restarted while there are still unsent messages in the
queue, those messages will be lost, as the emptyDir has the same lifetime as the pod.

You can enable persistence which creates a small [persistent volume](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
to contain `/var/spool/postfix` which will survive pod restarts. If you have multiple replicas, each replica will have its own
spool volume to represent its own mail queue.

Example configuration:

```yaml
persistence:
  enabled: true
  accessMode: "ReadWriteOnce"
  size: 1Gi
  storageClass: ""
```

## Metrics

If the metrics sidecar is enabled, both the Postfix container and the metrics container additionally mount another subdir
`/var/spool/postfix/public` as an emptyDir. This directory contains some Postfix sockets, and allows both containers in
the same pod to have access to the same sockets, so the metrics container can report on your Postfix `mailq`.

Sockets do not work properly in persistent volumes, so this is why an emptyDir is mounted inside a persistent volume.
You shouldn't need to worry about this unless you are a chart maintainer!

Example configuration:

```yaml
metrics:
  enabled: true
  port: 9154
  serviceMonitor:
    enabled: false
  prometheusRules:
    enabled: false
```
