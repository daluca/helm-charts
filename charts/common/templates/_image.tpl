{{/* vim: set filetype=mustache: */}}

{{/*
Create a image based on registry, repository, tag and sha256.
*/}}
{{- define "common.image" -}}
{{- printf "%s%s:%s%s" (ternary (printf "%s/" .Values.image.registry) "" (gt (len .Values.image.registry) 0)) .Values.image.repository (default .Chart.AppVersion .Values.image.tag) (ternary (printf "@sha256:%s" .Values.image.sha256) "" (gt (len .Values.image.sha256) 0)) }}
{{- end -}}

{{/*
Create a image based on registry, repository, tag and sha256 with 'v' prefix.
*/}}
{{- define "common.vimage" -}}
{{- printf "%s%s:%s%s" (ternary (printf "%s/" .Values.image.registry) "" (gt (len .Values.image.registry) 0)) .Values.image.repository (default (printf "v%s" .Chart.AppVersion) .Values.image.tag) (ternary (printf "@sha256:%s" .Values.image.sha256) "" (gt (len .Values.image.sha256) 0)) }}
{{- end -}}
