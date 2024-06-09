{{/* vim: set filetype=mustache: */}}
{{/* source: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_labels.tpl */}}
{{/*
  Generate backend entry that is compatible with all Kubernetes API versions.

  Usage:
    `{{ include "common.ingress.backend" (dict "serviceName" "backendName" "servicePort" "backendPort" "context" $) }}`

  Params:
    - serviceName - String. Name of an existing service backend
    - servicePort - String/Int. Port name (or number) of the service. It will be translated to different yaml depending if it is a string or an integer.
    - context - Dict - Required. The context for the template evaluation.
*/}}
{{- define "common.ingress.backend" -}}
service:
  name: {{ .serviceName }}
  port:
    {{- if typeIs "string" .servicePort }}
    name: {{ .servicePort }}
    {{- else if or (typeIs "int" .servicePort) (typeIs "float64" .servicePort) }}
    number: {{ .servicePort | int }}
    {{- end }}
{{- end -}}

{{/*
  Return true if cert-manager required annotations for TLS signed
  certificates are set in the Ingress annotations
  Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations

  Usage:
    `{{ include "common.ingress.certManagerRequest" .Values.path.to.the.ingress.annotations }}`
*/}}
{{- define "common.ingress.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") (hasKey . "kubernetes.io/tls-acme") }}
    {{- true -}}
{{- end -}}
{{- end -}}
