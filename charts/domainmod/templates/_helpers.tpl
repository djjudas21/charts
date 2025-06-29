{{/*
Expand the name of the chart.
*/}}
{{- define "domainmod.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "domainmod.fullname" -}}
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
{{- define "domainmod.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "domainmod.labels" -}}
helm.sh/chart: {{ include "domainmod.chart" . }}
{{ include "domainmod.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "domainmod.selectorLabels" -}}
app.kubernetes.io/name: {{ include "domainmod.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "domainmod.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "domainmod.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the credentials secret
*/}}
{{- define "domainmod.credentialsSecretName" -}}
{{ .Values.domainmod.secretName | default (printf "%s-credentials" (include "domainmod.fullname" .)) }}
{{- end }}

{{/*
Build database connection strings as templates
*/}}
{{- define "domainmod.postgresConnectString" -}}
postgres://{{- .Values.postgresql.auth.username -}}:{{- .Values.postgresql.auth.password -}}@{{- include "domainmod.fullname" . -}}-postgresql/{{- .Values.postgresql.auth.database -}}
{{- end }}
{{- define "domainmod.externalPostgresConnectString" -}}
postgres://{{- .Values.externalPostgresql.auth.username -}}:{{- .Values.externalPostgresql.auth.password -}}@{{- .Values.externalPostgresql.auth.host -}}:{{- .Values.externalPostgresql.auth.port -}}/{{- .Values.externalPostgresql.auth.database -}}
{{- end }}
{{- define "domainmod.mariadbConnectString" -}}
mysql://{{- .Values.mariadb.auth.username -}}:{{- .Values.mariadb.auth.password -}}@{{- include "domainmod.fullname" . -}}-mariadb/{{- .Values.mariadb.auth.database -}}
{{- end }}
{{- define "domainmod.externalMariadbConnectString" -}}
mysql://{{- .Values.externalMariadb.auth.username -}}:{{- .Values.externalMariadb.auth.password -}}@{{- .Values.externalMariadb.auth.host -}}:{{- .Values.externalMariadb.auth.port -}}/{{- .Values.externalMariadb.auth.database -}}
{{- end }}
