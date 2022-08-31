# Hammond

A self-hosted vehicle expense tracking system with support for multiple users

## Source Code

* <https://github.com/akhilrex/hammond>
* <https://hub.docker.com/r/akhilrex/hammond>
* <https://github.com/djjudas21/charts>

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| `http://bjw-s.github.io/helm-charts/` | common | 4.3.0 |

## TL;DR

```console
helm repo add djjudas21 https://djjudas21.github.io/charts/
helm repo update
helm install djjudas21/hammond
```

## Installing the Chart

To install the chart with the release name `hammond`

```console
helm install hammond djjudas21/hammond
```

## Uninstalling the Chart

To uninstall the `hammond` deployment

```console
helm uninstall hammond
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/bjw-s/helm-charts/blob/main/charts/library/common/values.yaml) from the k8s@home
[common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install hammond \
  --set env.TZ="America/New York" \
    djjudas21/hammond
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install hammond djjudas21/hammond -f values.yaml
```

## Values

**Important**: When deploying an application Helm chart you can add more values from the k8s@home common library chart [here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below (only deviations from the default settings are specified) | environment variables. See [image docs](https://docs.kanboard.org/en/latest/admin_guide/docker.html#environment-variables) and [application docs](https://docs.kanboard.org/en/latest/admin_guide/config_file.html) for more details. |
| env.TZ | string | `"UTC"` | Application Timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"akhilrex/hammond"` | image repository |
| image.tag | string | `"1.0.0"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 0.1.0

* Initial chart version
