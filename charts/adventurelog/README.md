# adventurelog

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.10.0](https://img.shields.io/badge/AppVersion-v0.10.0-informational?style=flat-square)

Self-hostable travel tracker and trip planner

**Homepage:** <https://github.com/djjudas21/charts/tree/master/charts/adventurelog>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| djjudas21 | <djjudas21@users.noreply.github.com> |  |

## Source Code

* <https://adventurelog.app/>
* <https://github.com/seanmorley15/AdventureLog>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Define pod affinity |
| backend.disableRegistration | bool | `false` | Disable registration of new accounts |
| backend.django.adminEmail | string | `"admin@example.com"` | Admin email for AdventureLog |
| backend.django.adminPassword | string | `"admin"` | Admin password for AdventureLog |
| backend.django.adminUsername | string | `"admin"` | Admin username for AdventureLog |
| backend.django.debug | bool | `true` | Run in debug mode |
| backend.django.secretKey | string | `"adventure"` | Secret key used for cookies |
| backend.email.enabled | bool | `false` | Enable sending email |
| backend.email.from | string | `"user@example.com"` | Email from address |
| backend.email.host | string | `"smtp.gmail.com"` | SMTP server hostname |
| backend.email.password | string | `"password"` | SMTP password |
| backend.email.port | int | `587` | SMTP server port |
| backend.email.useSsl | bool | `false` | SMTP use SSL |
| backend.email.useTls | bool | `false` | SMTP use TLS |
| backend.email.user | string | `"user"` | SMTP username |
| backend.image.repository | string | `"ghcr.io/seanmorley15/adventurelog-backend"` | Container image for the frontend |
| backend.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| backend.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode of persistent volume. Must be ReadWriteMany if replicaCount > 1 |
| backend.persistence.enabled | bool | `true` | Enable persistent storage for the backend |
| backend.persistence.size | string | `"10Gi"` | Size of persistent volume to provision |
| backend.persistence.storageClassName | string | `""` | Storage class to provision a persistent volume |
| backend.replicaCount | int | `1` | Number of backend replicas to run. Running >1 replica requires RWX storage. |
| backend.resources | object | `{}` | Resource requests & limits for the backend |
| backend.service.port | int | `8000` | Backend port |
| backend.service.type | string | `"ClusterIP"` | Set the service type. More information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| backend.strategy | string | `"Recreate"` | Deployment strategy. Must be Recreate if persistence is RWO. |
| frontend.image.repository | string | `"ghcr.io/seanmorley15/adventurelog-frontend"` | Container image for the frontend |
| frontend.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| frontend.replicaCount | int | `1` | Number of frontend replicas to run |
| frontend.resources | object | `{}` | Resource requests & limits for the frontend |
| frontend.service.port | int | `3000` | Frontend port |
| frontend.service.type | string | `"ClusterIP"` | Set the service type. More information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| frontend.strategy | string | `"RollingUpdate"` | Deployment strategy |
| fullnameOverride | string | `""` | Override the chart name |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| ingress.annotations | object | `{}` | Annotations to add to the Ingress |
| ingress.className | string | `""` | The IngressClass to use |
| ingress.enabled | bool | `false` | Create an Ingress resource |
| ingress.hosts.backend | string | `"adventure-backend.example.com"` | DNS name of the backend |
| ingress.hosts.frontend | string | `"adventure.example.com"` | DNS name of the frontend |
| ingress.tls.enabled | bool | `false` | Enable TLS for this Ingress |
| ingress.tls.secretName | string | `"adventure-tls"` | Secret to store TLS certs in |
| livenessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Define liveness probes for frontend & backend |
| nameOverride | string | `""` | Override the chart name |
| nodeSelector | object | `{}` | Schedule pods on a specific node(s) |
| podAnnotations | object | `{}` | Add Annotations to Pods. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | Add Labels to Pods. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext | object | `{}` |  |
| postgis.database | string | `"adventure"` | Name of database to create |
| postgis.image.repository | string | `"postgis/postgis"` | Container image for the PostGIS database |
| postgis.image.tag | string | `"15-3.3"` | Container image tag for the PostGIS database |
| postgis.password | string | `"adventure"` | Database password to set |
| postgis.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode of persistent volume |
| postgis.persistence.enabled | bool | `true` | Enable persistent storage for the database |
| postgis.persistence.size | string | `"1Gi"` | Size of persistent volume to provision |
| postgis.persistence.storageClassName | string | `""` | Storage class to provision a persistent volume |
| postgis.resources | object | `{}` | Resource requests & limits for the database |
| postgis.service.port | int | `5432` |  |
| postgis.service.type | string | `"ClusterIP"` | Set the service type. More information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| postgis.user | string | `"adventure"` | Database user to create |
| readinessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | Define readiness probes for frontend & backend |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| startupProbe | object | `{"failureThreshold":30,"httpGet":{"path":"/","port":"http"},"periodSeconds":10}` | Define startup probes for backend only |
| tolerations | list | `[]` | Add tolerations to pods |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
