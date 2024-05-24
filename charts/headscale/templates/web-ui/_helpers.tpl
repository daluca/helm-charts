{{/* vim: set filetype=mustache: */}}

{{/*
Delegation full name.
*/}}
{{- define "web-ui.fullname" -}}
{{ printf "%s-web-ui" (include "common.fullname" . | trunc 53 | trimSuffix "-") }}
{{- end }}
