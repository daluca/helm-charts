local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local kube = import 'kubernetes.libsonnet';
local unix = import 'unix.libsonnet';
local net = import 'networking.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/headscale/values.schema.json',
  ingress=true,
  commonLibrary=true,
) {
  properties+: {
    persistence: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        storageClass: js.string(),
        size: js.string(),
        accessModes: js.array(uniqueItems=true, unevaluatedItems=false) {
          items: js.enum(['ReadWriteOnce', 'ReadOnlyMany', 'ReadWriteMany', 'ReadWriteOncePod']),
        },
      },
    },
    config: js.object(additionalProperties=false, required=['prefixes']) {
      properties: {
        metrics_listen_addr: js.string(),
        grpc_listen_addr: js.string(),
        grpc_allow_insecure: js.boolean,
        prefixes: js.object(additionalProperties=false) {
          properties: {
            allocation: js.enum(['sequential', 'random']),
            v4: true,
            v6: true,
          },
          oneOf: [
            js.object(required=['v4']) {
              properties: {
                v4: js.string(),
                v6: js.Null,
              },
            },
            js.object(required=['v6']) {
              properties: {
                v4: js.Null,
                v6: js.string(),
              },
            },
            js.object(required=['v4', 'v6']) {
              properties: {
                v4: js.string(),
                v6: js.string(),
              }
            },
          ],
        },
        derp: js.object(additionalProperties=true) {
          properties: {
            server: js.object(additionalProperties=true) {
              properties: {
                enabled: js.boolean,
                region_id: js.integer(minimum=0),
                region_code: js.string(),
                region_name: js.string(),
                stun_listen_addr: js.string(),
                private_key_path: unix.fullPath,
                automatically_add_embedded_derp_region: js.boolean,
                ipv4: net.ipv4,
                ipv6: net.ipv6,
              },
            },
            urls: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: net.uri,
            },
            paths: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: unix.fullPath,
            },
            auto_update_enabled: js.boolean,
            update_frequency: js.string(),
          },
        },
        disable_check_updates: js.boolean,
        ephemeral_node_inactivity_timeout: js.string(),
        acme_url: net.uri,
        acme_email: net.email,
        tls_letsencrypt_hostname: net.hostname,
        tls_letsencrypt_cache_dir: unix.fullPath,
        tls_letsencrypt_challenge_type: js.enum(['HTTP-01', 'TLS-ALPN-01']),
        tls_letsencrypt_listen: js.enum([':http']),
        tls_cert_path: unix.fullPath,
        tls_key_path: unix.fullPath,
        log: js.object(additionalProperties=false) {
          properties: {
            format: js.enum(['text', 'json']),
            level: js.enum(['trace', 'debug', 'info', 'warn', 'error']),
          },
        },
        acl_policy_path: unix.fullPath,
        dns_config: js.object(additionalProperties=false) {
          properties: {
            override_local_dns: js.boolean,
            nameservers: js.array(uniqueItems=true, unevaluatedItems=false, minContains=1) {
              items: js.anyOf([net.ipv4, net.ipv6, net.uri]),
            },
            restricted_nameservers: js.object(additionalProperties=false, patternProperties={
              ".*\\..*": js.array(uniqueItems=true, unevaluatedItems=false) {
                items: js.anyOf([net.ipv4, net.ipv6, net.uri]),
              }
            }) {
              properties:: { hidden: true },
            },
            domains: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: net.hostname,
            },
            extra_records: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: js.object(additionalProperties=false) {
                properties: {
                  name: net.hostname,
                  type: js.string(),
                  value: net.ip,
                },
              },
            },
            magic_dns: js.boolean,
            base_domain: net.hostname,
          },
        },
        unix_socket: unix.fullPath,
        unix_socket_permission: js.string(),
        oidc: js.object(additionalProperties=false) {
          properties: {
            only_start_if_oidc_is_available: js.boolean,
            issuer: net.uri,
            client_id: js.string(),
            client_secret: true,
            client_secret_path: true,
            expiry: js.string(),
            use_expiry_from_token: js.boolean,
            scope: js.array(uniqueItems=true, unevaluatedItems=false, minContains=1) {
              items: js.string(),
            },
            extra_params: js.object(additionalProperties=js.string()) {
              properties:: { hidden: true },
            },
            allowed_domains: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: net.hostname,
            },
            allowed_groups: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: js.string(),
            },
            allowed_users: js.array(uniqueItems=true, unevaluatedItems=false) {
              items: js.string(),
            },
            strip_email_domain: js.boolean,
          },
          oneOf: [
            js.object(required=['client_secret']) {
              properties: {
                client_secret: js.string(),
              },
            },
            js.object(required=['client_secret_path']) {
              properties: {
                client_secret_path: unix.fullPath,
              },
            },
          ],
        },
        logtail: js.object(additionalProperties=false) {
          properties: {
            enabled: js.boolean,
          },
        },
        randomize_client_port: js.boolean,
      },
    },
    webui: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        replicaCount: js.integer(minimum=0),
        image: helm.image,
        service: helm.service,
        ingress: helm.ingress,
        resources: kube.resources,
        livenessProbe: helm.probe,
        readinessProbe: helm.probe,
        startupProbe: helm.probe,
      },
    },
    database: helm.externalDatabase(['postgres', 'sqlite3']) {
      properties+: {
        arguments: js.object(additionalProperties=false) {
          properties: {
            max_open_conns: js.integer(minimum=1),
            max_idle_conns: js.integer(minimum=1),
            conn_max_idle_time_secs: js.integer(minimum=0),
          },
        },
        ssl: js.boolean,
      }
    },
    postgresql: helm.postgresql,
  },
}
