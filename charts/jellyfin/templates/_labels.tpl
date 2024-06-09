{{/* vim: set filetype=mustache: */}}
{{/* source: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_labels.tpl */}}
{{/*
  Kubernetes standard labels

  Usage:
    `{{ include "common.labels.standard" $ }}`
*/}}
{{- define "common.labels.standard" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
  Labels to use on deploy.spec.selector.matchLabels and svc.spec.selector

  Usage:
    `{{ include "common.labels.matchLabels" $ }}`
*/}}
{{- define "common.labels.matchLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
