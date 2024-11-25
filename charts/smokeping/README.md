# smokeping

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.8.2](https://img.shields.io/badge/AppVersion-2.8.2-informational?style=flat-square)

SmokePing is a latency logging and graphing and alerting system

**Homepage:** <https://oss.oetiker.ch/smokeping/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| djjudas21 | <djjudas21@users.noreply.github.com> | <https://github.com/djjudas21> |

## Source Code

* <https://github.com/oetiker/SmokePing>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"linuxserver/smokeping"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `true` |  |
| persistence.mountPath | string | `"/data/"` |  |
| persistence.size | string | `"5Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes | object | `{"liveness":{"enabled":true,"failureThreshold":3,"initialDelaySeconds":0,"periodSeconds":10,"timeoutSeconds":1},"readiness":{"enabled":true,"failureThreshold":3,"initialDelaySeconds":0,"periodSeconds":10,"timeoutSeconds":1}}` | configure probes |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `false` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| smokeping.contact | string | `"admin@linuxserver.io"` |  |
| smokeping.database.pings | int | `20` | How many pings to send for each test |
| smokeping.database.step | int | `300` | How many seconds between tests |
| smokeping.email.AuthPass | string | `""` |  |
| smokeping.email.AuthUser | string | `""` |  |
| smokeping.email.UseSTARTTLS | string | `"yes"` |  |
| smokeping.email.from | string | `"smokealert@company.xy"` |  |
| smokeping.email.hostname | string | `""` | The full hostname |
| smokeping.email.mailhub | string | `"smtp.gmail.com:587"` | The place where the mail goes. The actual machine name is required - no MX records are consulted. Commonly mailhosts are named mail.domain.com |
| smokeping.email.rewriteDomain | string | `""` | Where will the mail seem to come from? |
| smokeping.email.root | string | `""` | The person who gets all mail for userids < 1000. Make this empty to disable rewriting. |
| smokeping.email.to | string | `"alertee@address.somewhere"` |  |
| smokeping.owner | string | `"LinuxServer.io"` |  |
| smokeping.targets[0].hosts[0].host | string | `"192.168.0.1"` |  |
| smokeping.targets[0].hosts[0].menu | string | `"Router"` |  |
| smokeping.targets[0].hosts[0].name | string | `"Router"` |  |
| smokeping.targets[0].hosts[0].title | string | `"Router"` |  |
| smokeping.targets[0].menu | string | `"Internal Devices"` |  |
| smokeping.targets[0].name | string | `"Internet"` |  |
| smokeping.targets[0].title | string | `"Internal Devices"` |  |
| smokeping.targets[1].hosts[0].host | string | `"google.com"` |  |
| smokeping.targets[1].hosts[0].menu | string | `"Google"` |  |
| smokeping.targets[1].hosts[0].name | string | `"GoogleSearch"` |  |
| smokeping.targets[1].hosts[0].title | string | `"google.com"` |  |
| smokeping.targets[1].menu | string | `"Internet Sites"` |  |
| smokeping.targets[1].name | string | `"InternetSites"` |  |
| smokeping.targets[1].title | string | `"Internet Sites"` |  |
| smokeping.targets[2].hosts[0].host | string | `"8.8.8.8"` |  |
| smokeping.targets[2].hosts[0].menu | string | `"Google DNS 1"` |  |
| smokeping.targets[2].hosts[0].name | string | `"GoogleDNS1"` |  |
| smokeping.targets[2].hosts[0].title | string | `"Google DNS 8.8.8.8"` |  |
| smokeping.targets[2].hosts[1].host | string | `"8.8.4.4"` |  |
| smokeping.targets[2].hosts[1].menu | string | `"Google DNS 2"` |  |
| smokeping.targets[2].hosts[1].name | string | `"GoogleDNS2"` |  |
| smokeping.targets[2].hosts[1].title | string | `"Google DNS 8.8.4.4"` |  |
| smokeping.targets[2].hosts[2].host | string | `"1.1.1.1"` |  |
| smokeping.targets[2].hosts[2].menu | string | `"Cloudflare DNS 1"` |  |
| smokeping.targets[2].hosts[2].name | string | `"CloudflareDNS1"` |  |
| smokeping.targets[2].hosts[2].title | string | `"Cloudflare DNS 1.1.1.1"` |  |
| smokeping.targets[2].hosts[3].host | string | `"1.0.0.1"` |  |
| smokeping.targets[2].hosts[3].menu | string | `"Cloudflare DNS 2"` |  |
| smokeping.targets[2].hosts[3].name | string | `"CloudflareDNS2"` |  |
| smokeping.targets[2].hosts[3].title | string | `"Cloudflare DNS 1.0.0.1"` |  |
| smokeping.targets[2].menu | string | `"DNS Probes"` |  |
| smokeping.targets[2].name | string | `"DNSProbes"` |  |
| smokeping.targets[2].probe | string | `"DNS"` |  |
| smokeping.targets[2].title | string | `"DNS Probes"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
