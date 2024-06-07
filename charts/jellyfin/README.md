

<!-- markdownlint-disable MD033 -->

<h1 align="center">
    <a href="https://jellyfin.org/">
        <img src="https://raw.githubusercontent.com/jellyfin/jellyfin-ux/master/branding/SVG/icon-transparent.svg" alt="Logo" style="max-height: 150px">
    </a>
</h1>

<h4 align="center">Jellyfin - Your media, your server, your way</h4>

<div align="center">
  <br/>

  [
    ![License](https://img.shields.io/github/license/beluga-cloud/charts?logo=git&logoColor=white&logoWidth=20)
  ](LICENSE)
  <br/>
  ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat)
  ![Version: 2.3.0](https://img.shields.io/badge/Version-2.3.0-informational?style=flat)
  ![AppVersion: 10.8.13](https://img.shields.io/badge/AppVersion-10.8.13-informational?style=flat)

</div>

---

## [Jellyfin](https://jellyfin.org/)

> _Disclaimer: This application has been developed by the [Jellyfin](https://jellyfin.org/) community._

_Jellyfin_ is the volunteer-built media solution that puts you in control of your media. Stream to any device from
your own server, with no strings attached.

Some features of Jellyfin:
- **Movies**: Enjoy your entire movie collection, easy to browse and with beautiful artwork.
- **Shows**: Watch your favorite shows, automatically sorted by season and ready to binge.
- **Music**: Listen to music, your artists and your playlists, at home or on the go.
- **Live TV & DVR**: Watch TV and set automatic recordings to expand your library.
- **Books**: Read your books, comics, and magazines.
- **Photos**: Organize your photos and share memories with your friends and family.
- **SyncPlay**: Sharing a movie night remotely has never been so easy.

[> More about Jellyfin](https://jellyfin.org/)

---

## TL;DR

```shell
helm repo add beluga-cloud https://beluga-cloud.github.io/charts
helm install my-release beluga-cloud/jellyfin
```

## Introduction

This chart bootstraps a Jellyfin deployment on a [Kubernetes](kubernetes.io) cluster using the [Helm](helm.sh) package manager.

## Prerequisites

- Kubernetes >=1.20
- Helm 3+

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm repo add beluga-cloud https://beluga-cloud.github.io/charts
helm install my-release beluga-cloud/jellyfin
```

These commands deploy jellyfin on the Kubernetes cluster in the default configuration.
The Parameters section lists the parameters that can be configured during installation.

> **Tip:** List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Key | Description | Default |
|-----|-------------|---------|
| `global.commonLabels` |  Labels to apply to all resources. | `{}` |
| `global.debug` |  Enable global debug mode | `false` |
| `global.imagePullSecrets` |  Reference to one or more secrets to be used when pulling images    ([kubernetes.io/docs](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/)) | `[]` |
| `global.imageRegistry` |  Global Docker image registry | `""` |

### Common parameters

| Key | Description | Default |
|-----|-------------|---------|
| `fullnameOverride` | String to fully override `common.names.fullname` template | `""` |
| `nameOverride` | String to partially override `common.names.fullname` template (will maintain the release name) | `""` |

### Jellyfin parameters

| Key | Description | Default |
|-----|-------------|---------|
| `images.jellyfin.digest` | jellyfin image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""` |
| `images.jellyfin.pullPolicy` | jellyfin image pull policy | `"IfNotPresent"` |
| `images.jellyfin.registry` | jellyfin image registry (optional) | `""` |
| `images.jellyfin.repository` | jellyfin image repository | `"ghcr.io/beluga-cloud/jellyfin/jellyfin"` |
| `images.jellyfin.tag` | jellyfin image tag (immutable tags are recommended) | `""` |
| `jellyfin.extraDevices` | Additional device like GPU to mount | `[]` |
| `jellyfin.mediaVolumes` | The list of volumes that will be mounted inside jellyfin pod, to `/media`. | `[]` |
| `jellyfin.persistentTranscodes` | Keep all transcoded files persistent. | `false` |

### Security parameters

| Key | Description | Default |
|-----|-------------|---------|
| `containerSecurityContext` | Security context for the jellyfin container    ([kubernetes.io/docs](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)) | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":64710,"runAsNonRoot":true,"runAsUser":64710}` |
| `podSecurityContext` | Security context for the pod ([kubernetes.io/docs](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)) | `{"fsGroup":64710,"runAsGroup":64710,"runAsNonRoot":true,"runAsUser":64710,"seccompProfile":{"type":"RuntimeDefault"}}` |

### Deployment/Statefulset parameters

| Key | Description | Default |
|-----|-------------|---------|
| `affinity` | Affinity for pod assignment ([kubernetes.io/docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.26/#affinity-v1-core)) | `{}` |
| `nodeSelector` | Node labels for pod assignment | `{"kubernetes.io/os":"linux"}` |
| `podAnnotations` | Additional annotations to apply to the pod. | `{}` |
| `podLabels` | Additional labels to be added to pods. | `{}` |
| `resources.jellyfin.limits` | The resources limits for the container | `{"cpu":"2","memory":"6Gi"}` |
| `resources.jellyfin.requests` | The requested resources for the container | `{"cpu":"500m","memory":"512Mi"}` |
| `strategy` | Set up update strategy for jellyfin installation. Set to `Recreate` if you use persistent volume    that cannot be mounted by more than one pods to make sure the pods is destroyed first.    ([kubernetes.io/docs](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy)) | `{}` |
| `tolerations` | Tolerations for pod assignment ([kubernetes.io/docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.26/#toleration-v1-core)) | `[]` |
| `topologySpreadConstraints` | Topology Spread Constraints for pod assignment    ([kubernetes.io/docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.24/#topologyspreadconstraint-v1-core)) | `[]` |

### Network parameters

| Key | Description | Default |
|-----|-------------|---------|
| `ingress.annotations` | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}` |
| `ingress.enabled` | Enable ingress resource | `false` |
| `ingress.extraHosts` | The list of additional hostnames to be covered with this ingress record. | `[]` |
| `ingress.extraPaths` | Any additional paths that may need to be added to the ingress under the main host | `[]` |
| `ingress.extraRules` | Additional rules to be covered with this ingress record | `[]` |
| `ingress.extraTls` | The tls configuration for additional hostnames to be covered with this ingress record. | `[]` |
| `ingress.hostname` | Default host for the ingress resource | `"jellyfin.local"` |
| `ingress.ingressClassName` | IngressClass that will be used to implement the Ingress | `""` |
| `ingress.path` | The Path to jellyfin. You may need to set this to '/*' in order to use this with ALB ingress controllers. | `"/"` |
| `ingress.pathType` | Ingress path type | `"ImplementationSpecific"` |
| `ingress.tls` | Enable TLS configuration for the hostname defined at apiIngress.hostname parameter | `true` |
| `networkPolicy.allowAllOutbound` | Whether to allow all outbound traffic by default. | `true` |
| `networkPolicy.allowExternal` | Don't require client label for connections | `true` |
| `networkPolicy.egress` | Sets egress policy block. See NetworkPolicies documentation ([kubernetes.io/docs](https://kubernetes.io/docs/concepts/services-networking/network-policies/).) | `[]` |
| `networkPolicy.enabled` | Enable the default NetworkPolicy policy | `false` |
| `networkPolicy.ingress` | Sets ingress policy block. See NetworkPolicies documentation ([kubernetes.io/docs](https://kubernetes.io/docs/concepts/services-networking/network-policies/).) | `[]` |
| `service.annotations` | Additional annotations for the Service | `{}` |
| `service.clusterIP` | Service Cluster IP | `""` |
| `service.externalTrafficPolicy` | Enable client source IP preservation | `"Cluster"` |
| `service.loadBalancerIP` | LoadBalancer IP if service type is `LoadBalancer` (optional, cloud specific) | `""` |
| `service.loadBalancerSourceRanges` | Addresses that are allowed when service is `LoadBalancer` | `[]` |
| `service.type` | Service type | `"ClusterIP"` |
| `service.web.nodePort` | Specify the nodePort value for the `LoadBalancer` and `NodePort` service types | `0` |
| `service.web.port` | `web` service port | `8096` |

### Persistence parameters

| Key | Description | Default |
|-----|-------------|---------|
| `persistence.config.enabled` | Enable configuration persistence using `PVC`. If false, use emptyDir | `true` |
| `persistence.config.volumeClaimSpec` | Claims that pods are allowed to reference (see    [kubernetes.io/docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.26/#persistentvolumeclaim-v1-core)    for structural reference) | `{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"250Mi"}}}` |
| `persistence.data.enabled` | Enable data persistence using `PVC`. If false, use emptyDir | `true` |
| `persistence.data.volumeClaimSpec` | Claims that pods are allowed to reference (see    [kubernetes.io/docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.26/#persistentvolumeclaim-v1-core)    for structural reference) | `{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"2Gi"}}}` |

### RBAC parameters

| Key | Description | Default |
|-----|-------------|---------|

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```shell
helm install my-release --set fullnameOverride=my-jellyfin beluga-cloud/jellyfin
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```shell
helm install my-release -f values.yaml my-repo/jellyfin
```

> **Tip:** You can use the default values.yaml

## License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
language governing permissions and limitations under the License.

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
