# domainmod

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.23.0](https://img.shields.io/badge/AppVersion-4.23.0-informational?style=flat-square)

DomainMOD is a self-hosted open source application used to manage your domains and other Internet assets in a central location

> [!WARNING]
> This chart now uses the [MariaDB Operator](https://github.com/mariadb-operator/mariadb-operator) (which must be installed separately) to provision a MariaDB instance.
> Your values **will** need to be configured based on the new default values in the chart.
> Bitnami MariaDB will be **deleted upon upgrade**, so make sure you have exported your DomainMOD config, ready to re-import after upgrade!

**Homepage:** <https://github.com/djjudas21/charts/tree/master/charts/domainmod>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| djjudas21 | <djjudas21@users.noreply.github.com> |  |

## Source Code

* <https://github.com/domainmod/domainmod>
* <https://domainmod.org/>
* <https://hub.docker.com/r/domainmod/domainmod>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| deploymentAnnotations | object | `{}` |  |
| deploymentLabels | object | `{}` |  |
| env | object | See below | environment variables |
| env.DOMAINMOD_DATABASE | string | `""` | The name of the database. You do not need to configure this if you are using the MariaDB Operator integration. |
| env.DOMAINMOD_DATABASE_HOST | string | `""` | The database hostname that DomainMOD should connect to. You do not need to configure this if you are using the MariaDB Operator integration. |
| env.DOMAINMOD_PASSWORD | string | `""` | The password for DOMAINMOD_USER. You do not need to configure this if you are using the MariaDB Operator integration. |
| env.DOMAINMOD_USER | string | `""` | The name of the database user. You do not need to configure this if you are using the MariaDB Operator integration. |
| env.DOMAINMOD_WEB_ROOT | string | `nil` | Set this if you plan on running DomainMOD in a subdirectory, otherwise leave it blank. |
| env.TZ | string | `"UTC"` | Container timezone |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"domainmod/domainmod"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| imagePullSecrets | list | `[]` |  |
| ingress | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| mariadbOperator | object | `{"auth":{"database":"domainmod","password":"domainmod","rootPassword":"domainmodadminpw","username":"domainmod"},"enabled":false,"persistence":{"size":"1Gi","storageClass":""},"resources":{}}` | Enable integration with MariaDB Operator This uses the MariaDB Operator (which must be installed separately) to provision a MariaDB instance. |
| mariadbOperator.auth.database | string | `"domainmod"` | Database name to create |
| mariadbOperator.auth.password | string | `"domainmod"` | Database password to create |
| mariadbOperator.auth.rootPassword | string | `"domainmodadminpw"` | Database root password to create |
| mariadbOperator.auth.username | string | `"domainmod"` | Database user to create |
| mariadbOperator.enabled | bool | `false` | Enable integration with MariaDB Operator |
| mariadbOperator.persistence | object | `{"size":"1Gi","storageClass":""}` | Persistence settings for MariaDB instance |
| mariadbOperator.persistence.size | string | `"1Gi"` | Size of volume to provision for MariaDB instance |
| mariadbOperator.persistence.storageClass | string | `""` | Storage class to use to provision volume for MariaDB instance |
| mariadbOperator.resources | object | `{}` | Resources for MariaDB instance |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` | Number of domainmod replicas. |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service | object | See values.yaml | Configures service settings for the chart. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `false` |  |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | a name is generated using the fullname template | The name of the service account to use. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)