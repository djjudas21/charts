{{/*
Expand the name of the chart.
*/}}
{{- define "reactive-resume.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Expand the name of the chart for the Server component
*/}}
{{- define "reactive-resume.nameServer" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-server
{{- end }}


{{/*
Expand the name of the chart for the Client component
*/}}
{{- define "reactive-resume.nameClient" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-client
{{- end }}



{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "reactive-resume.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "reactive-resume.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "reactive-resume.labels" -}}
helm.sh/chart: {{ include "reactive-resume.chart" . }}
{{ include "reactive-resume.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "reactive-resume.selectorLabels" -}}
app.kubernetes.io/name: {{ include "reactive-resume.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Selector labels for the Server
*/}}
{{- define "reactive-resume.selectorLabelsServer" -}}
app.kubernetes.io/name: {{ include "reactive-resume.nameServer" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Selector labels for the Client
*/}}
{{- define "reactive-resume.selectorLabelsClient" -}}
app.kubernetes.io/name: {{ include "reactive-resume.nameClient" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: client
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "reactive-resume.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "reactive-resume.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create the name of the Server image tag
*/}}
{{- define "reactive-resume.serverImageTag" -}}
{{- if .Values.server.image.tag }}
{{- .Values.server.image.tag -}}
{{- else }}
{{- printf "server-%s" .Chart.AppVersion | default "latest" -}}
{{- end }}
{{- end }}

{{/*
Create the name of the Client image tag
*/}}
{{- define "reactive-resume.clientImageTag" -}}
{{- if .Values.client.image.tag }}
{{- .Values.client.image.tag -}}
{{- else }}
{{- printf "client-%s" .Chart.AppVersion | default "latest" -}}
{{- end }}
{{- end }}