{{- define "fullname" -}}
{{- printf "fintrans-%s" .Release.Name  | trunc 55 | trimSuffix "-" -}}
{{- end -}}

{{- define "kafka-address" -}}
    {{- if .Values.kafka.deployChart -}}
        {{- $ctx := . -}}
        {{- range $i, $e := until (int $.Values.kafka.replicas) -}}
            {{- if $i }},{{- end -}}
            {{- template "kafka-fullname" $ctx -}}
            {{- printf "-%d." $i -}}
            {{- template "kafka-fullname" $ctx -}}
            {{- printf ":%d" (int $.Values.kafka.port) -}}
        {{- end -}}
    {{- else -}}
        {{- printf "%s" .Values.kafka.externalAddress -}}
    {{- end -}}
{{- end -}}
