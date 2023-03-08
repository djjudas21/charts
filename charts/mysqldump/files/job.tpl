{{- if .Values.podAnnotations }}
metadata:
  annotations:
{{ toYaml .Values.podAnnotations | indent 4 }}
{{- end }}
spec:
  {{- with .Values.imagePullSecrets }}
  imagePullSecrets:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if .Values.securityContext.enabled }}
  securityContext:
    fsGroup: {{ .Values.securityContext.fsGroup }}
    runAsUser: {{ .Values.securityContext.runAsUser }}
  {{- end }}
  containers:
  - name: mysql-backup
    image: "{{ .Values.image.registry }}/{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
    imagePullPolicy: {{ .Values.image.pullPolicy | quote }}
    command: ["/bin/bash", "/scripts/backup.sh"]
{{- if .Values.mysql.existingSecret }}
    env:
      - name: MYSQL_PWD
        valueFrom:
          secretKeyRef:
            name: {{ .Values.mysql.existingSecret | quote }}
            {{- if .Values.mysql.existingSecretKey }}
            key: {{ .Values.mysql.existingSecretKey | quote }}
            {{- else }}
            key: "mysql-root-password"
            {{- end }}
{{- end }}
    env:
    {{- if .Values.mysql.password }}
    - name: MYSQL_PWD
      value: {{ .Values.mysql.password | b64enc | quote }}
    {{- else }}
    - name: MYSQL_PWD
      value: {{ randAlphaNum 40 | b64enc | quote }}
    {{- end }}
    - name: MYSQL_HOST
      value: {{ .Values.mysql.host | quote }}
    - name: MYSQL_USERNAME
      value: {{ .Values.mysql.username | quote }}
    - name: MYSQL_PORT
      value: {{ .Values.mysql.port | quote }}
    - name: MYSQL_OPTS
      value: {{ .Values.options | quote }}
    - name: KEEP_DAYS
      value: {{ .Values.housekeeping.keepDays | quote }}
    volumeMounts:
    - name: backups
      mountPath: /backup
{{- if .Values.persistence.subPath }}
      subPath: {{ .Values.persistence.subPath }}
{{- end }}
    - name: mysql-backup-script
      mountPath: /scripts
    resources: 
{{ toYaml .Values.resources | indent 6 }}
{{- with .Values.nodeSelector }}
  nodeSelector:
{{ toYaml . | indent 4 }}
{{- end }}
{{- with .Values.affinity }}
  affinity:
{{ toYaml . | indent 4 }}
{{- end }}
{{- with .Values.tolerations }}
  tolerations:
{{ toYaml . | indent 4 }}
{{- end }}
  restartPolicy: Never
  volumes:
  - name: backups
{{- if .Values.persistentVolumeClaim }}
    persistentVolumeClaim:
      claimName: {{ .Values.persistentVolumeClaim }}
{{- else -}}
{{- if .Values.persistence.enabled }}
    persistentVolumeClaim:
      claimName: {{ template "mysqldump.fullname" . }}
{{- else }}
    emptyDir: {}
{{- end }}
{{- end }}
  - name: mysql-backup-script
    configMap:
      name: {{ template "mysqldump.fullname" . }}-script
