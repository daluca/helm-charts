{{/* vim: set filetype=mustache: */}}
{{/*
Delegation full name.
*/}}
{{- define "synapse.wellKnownFullname" -}}
{{ printf "%s-well-known" (include "common.fullname" . | trunc 53 | trimSuffix "-") }}
{{- end }}

