{{/* Returns the name of the chart */}}
{{- define "bpm-connector.name" -}}
{{- .Chart.Name -}}
{{- end }}

{{/* Returns the full name: release-name + chart-name, max 63 chars */}}
{{- define "bpm-connector.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Optional: Labels cho tất cả resources */}}
{{- define "bpm-connector.labels" -}}
app.kubernetes.io/name: {{ include "bpm-connector.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
