{{/* vim: set filetype=mustache: */}}
{{/*
  Return the proper image name

  Usage:
    `{{ include "blib.images.image" (dict "imageRoot" .Values.path.to.the.image "context" $) }}`
*/}}
{{- define "common.images.image" }}
    {{- $ := .context -}}

    {{- $registryName := $.Values.global.imageRegistry | default .image.registry | default (regexSplit "/" .image.repository 2 | first) }}
    {{- $repositoryName := .image.repository | trimPrefix (printf "%s/" $registryName) }}
    {{- $termination := printf ":%s" (.image.tag | default $.Chart.AppVersion) }}
    {{- with .image.digest }}
        {{- $termination := printf "@%s" (. | toString) }}
    {{- end }}
    {{- printf "%s/%s%s" $registryName $repositoryName $termination }}
{{- end }}
