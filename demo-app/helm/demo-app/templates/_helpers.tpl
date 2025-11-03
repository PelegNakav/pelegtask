{{/*
Common helper templates for demo-app chart
*/}}

{{- define "demo-app.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "demo-app.fullname" -}}
{{- printf "%s-%s" (include "demo-app.name" .) .Release.Name -}}
{{- end -}}

{{- /* Common labels template - returns YAML key: value lines (no leading indentation) */ -}}
{{- define "demo-app.labels" -}}
app.kubernetes.io/name: {{ include "demo-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}
