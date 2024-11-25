# jump

![Version: 0.1.7](https://img.shields.io/badge/Version-0.1.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.4.1](https://img.shields.io/badge/AppVersion-v1.4.1-informational?style=flat-square)

Jump is a self-hosted startpage and real-time status page for your server designed to be simple, stylish, fast and secure.

**Homepage:** <https://github.com/djjudas21/charts/tree/master/charts/jump>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| djjudas21 | <djjudas21@users.noreply.github.com> |  |

## Source Code

* <https://github.com/daledavies/jump>
* <https://hub.docker.com/r/daledavies/jump>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env | object | `{"ALTBGPROVIDER":"","ALTLAYOUT":"true","AMPMCLOCK":"true","BGBLUR":50,"BGBRIGHT":90,"CACHEBYPASS":"false","CHECKSTATUS":"false","CUSTOMGREETING":"Some other greeting message","CUSTOMWIDTH":1000,"DEBUG":"false","LANGUAGE":"en","LATLONG":"","METRICTEMP":"true","NOINDEX":"true","OWMAPIKEY":"","SHOWCLOCK":"false","SHOWGREETING":"false","SHOWSEARCH":"false","STATUSCACHE":5,"UNSPLASHAPIKEY":"","UNSPLASHCOLLECTIONS":""}` | Config values for Jump. Always check https://github.com/daledavies/jump for latest details of available options. |
| env.ALTBGPROVIDER | string | `""` | An alternative background provider url. |
| env.ALTLAYOUT | string | `"true"` | Display list of sites using an alternative layout |
| env.AMPMCLOCK | string | `"true"` | Show 12 hour clock format if true |
| env.BGBLUR | int | `50` | Background image blur percentage |
| env.BGBRIGHT | int | `90` | Background image brightness percentage |
| env.CACHEBYPASS | string | `"false"` | Bypass all caches, useful for testing changes |
| env.CHECKSTATUS | string | `"false"` | Disable checking site availability status |
| env.CUSTOMGREETING | string | `"Some other greeting message"` | Show a custom greeting message instead |
| env.CUSTOMWIDTH | int | `1000` | Set a custom with for the page container/site list |
| env.DEBUG | string | `"false"` | Enable debug mode |
| env.LANGUAGE | string | `"en"` | Set to your chosen language code. |
| env.LATLONG | string | `""` | A latitude and longitude for the default location (e.g. "51.509865,-0.118092"). |
| env.METRICTEMP | string | `"true"` | Metric (C) or imperial (F) temperature units |
| env.NOINDEX | string | `"true"` | Include a robots noindex meta tag in site header |
| env.OWMAPIKEY | string | `""` | An API key for Open Weather Map, LATLONG (below) must also be defined. |
| env.SHOWCLOCK | string | `"false"` | Hide the clock |
| env.SHOWGREETING | string | `"false"` | Show the label "#home" instead of a friendly greeting message |
| env.SHOWSEARCH | string | `"false"` | Hide the search button (disable search) |
| env.STATUSCACHE | int | `5` | Duration in minutes to cache site availability status |
| env.UNSPLASHAPIKEY | string | `""` | An API key for Unsplash, enables fetching random background images from Unsplash. |
| env.UNSPLASHCOLLECTIONS | string | `""` | List of Unsplash collection ID's (separated by commas) to select random images from. |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"daledavies/jump"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| imagePullSecrets | list | `[]` |  |
| ingress | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` | Number of replicas |
| resources | object | `{}` |  |
| search | list | `[{"name":"Google","url":"https://www.google.co.uk/search?q="},{"name":"DuckDuckGo","url":"https://duckduckgo.com/?q="},{"name":"Bing","url":"https://www.bing.com/search?q="}]` | List of search providers, rendered as search.json |
| securityContext | object | `{}` |  |
| service | object | See values.yaml | Configures service settings for the chart. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | a name is generated using the fullname template | The name of the service account to use. |
| sites.default | object | `{"icon":"my-default-icon.png","newtab":false,"nofollow":true}` | Default settings for sites |
| sites.sites | list | `[{"description":"This is an example description","name":"Github","newtab":true,"nofollow":false,"url":"https://github.com/daledavies/jump"},{"name":"Docker Hub","url":"https://hub.docker.com/r/daledavies/jump"},{"description":"This is another example of a site with a description","icon":"bitwarden.png","name":"Bitwarden","tags":["stuff"],"url":"https://bitwarden.com/"},{"icon":"nextcloud.png","name":"Nextcloud","tags":["home","things"],"url":"https://cloud.example.com"},{"name":"Teapot","nofollow":false,"status":{"allowed_status_codes":[418],"request_method":"GET","url":"https://www.google.com/teapot","verify_cert":false},"tags":["stuff","things"],"url":"https://www.google.com/pagedoesnotexist"}]` | List of sites to include, rendered as sites.json |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[{"mountPath":"/backgrounds","name":"backgrounds"},{"mountPath":"/favicon","name":"favicon"},{"mountPath":"/sites/sites.json","name":"sites-config","subPath":"sites.json"},{"mountPath":"/search/searchengines.json","name":"search-config","subPath":"searchengines.json"}]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[{"emptyDir":{"sizeLimit":"100Mi"},"name":"backgrounds"},{"emptyDir":{"sizeLimit":"100Mi"},"name":"favicon"},{"emptyDir":{"sizeLimit":"100Mi"},"name":"search"},{"emptyDir":{"sizeLimit":"100Mi"},"name":"sites"},{"configMap":{"name":"sites-config"},"name":"sites-config"},{"configMap":{"name":"search-config"},"name":"search-config"}]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
