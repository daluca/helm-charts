local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local kube = import 'kubernetes.libsonnet';
local net = import 'networking.libsonnet';
local unix = import 'unix.libsonnet';
local utils = import 'utils.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/eturnal/values.schema.json',
  commonLibrary=true,
) {
  local logLevels = js.enum(['debug', 'info', 'notice', 'warning', 'error', 'critical']),

  properties+: {
    podSecurityContext: kube.podSecurityContext,
    securityContext: kube.securityContext,
    extraVolumeMounts: js.array(uniqueItems=true, unevaluatedItems=false) {
      items: kube.volumeMount,
    },
    extraVolumes: js.array(uniqueItems=true, unevaluatedItems=false) {
      items: kube.volume
    },
    existingSecret: js.string(),
    config: js.object(additionalProperties=true) {
      properties: {
        blacklist_clients: js.array(uniqueItems=true, unevaluatedItems=false) {
          items: js.string(),
        },
        blacklist_peers: js.array(uniqueItems=true, unevaluatedItems=false) {
          items: js.string(),
        },
        credentials: js.object(additionalProperties=js.string()) { properties:: { hidden: true } },
        listen: js.array(uniqueItems=true, unevaluatedItems=false, minItems=1, maxItems=2) {
          items: js.object(additionalProperties=false, required=['transport']) {
            properties: {
              transport: js.enum(['udp', 'tcp', 'tls', 'auto']),
              proxy_protocol: js.boolean,
              enable_turn: js.boolean,
            },
          },
        },
        log_dir: js.oneOf([js.string(pattern="/^"), js.enum(['stdout'])]),
        log_level: logLevels,
        log_rotate_count: js.integer(minimum=1),
        log_rotate_size: js.oneOf([js.integer(minimum=1), js.enum(['unlimited'])]),
        max_bps: js.oneOf([js.integer(minimum=1), js.enum(['unlimited'])]),
        max_permissions: js.oneOf([js.integer(minimum=1), js.enum(['unlimited'])]),
        modules: js.object(additionalProperties=false) {
          properties: {
            mod_log_stun: js.object(additionalProperties=false) {
              properties: {
                level: logLevels,
              },
            },
            mod_stats_influx: js.object(additionalProperties=false) {
              properties: {
                host: net.hostname,
                port: net.port,
              },
            },
            mod_stats_prometheus: js.object(additionalProperties=false) {
              properties: {
                ip: js.oneOf([net.ipv4, net.ipv6, js.enum(['any'])]),
                port: net.port,
                tls: js.boolean,
                tls_crt_file: js.string(),
                tls_key_file: js.string(),
                vm_metrics: js.boolean,
              },
            },
          },
        },
        realm: js.string(),
        relay_ipv4_addr: net.ipv4,
        relay_ipv6_addr: net.ipv6,
        relay_max_port: net.port,
        relay_min_port: net.port,
        run_dir: js.string(),
        secret: js.string(),
        software_name: js.string(),
        strict_expiry: js.boolean,
        tls_ciphers: js.oneOf([js.string(), js.array(uniqueItems=true, unevaluatedItems=false) { items: js.string() }]),
        tls_crt_file: js.string(),
        tls_dh_file: js.string(),
        tls_key_file: js.string(),
        tls_options: js.oneOf([js.string(), js.array(uniqueItems=true, unevaluatedItems=false) { items: js.string() }]),
        whitelist_clients: js.array(uniqueItems=true, unevaluatedItems=false) {
          items: js.string(),
        },
        whitelist_peers: js.array(uniqueItems=true, unevaluatedItems=false) {
          items: js.string(),
        },
      },
    },
  },
}
