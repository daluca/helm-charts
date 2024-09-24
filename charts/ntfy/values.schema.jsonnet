local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local net = import 'networking.libsonnet';
local unix = import 'unix.libsonnet';

local duration = js.string(pattern='[0-9]{1,}(s|m|h|d)');
local size = js.string(pattern='[0-9]{1,}(k|M|G)');
local ipPort = js.string(pattern='([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3})?:[0-9]{1,5}');

helm.schema(
  schemaId="https://raw.githubusercontent.com/daluca/helm-charts/main/charts/ntfy/values.schema.json",
  ingress=true,
  commonLibrary=true,
) {
  properties+: {
    replicaCount:: { hidden: true },
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
    config: js.object(additionalProperties=true) {
      properties: {
        base_url: net.uri,
        listen_https: ipPort,
        key_file: unix.fullPath,
        cert_file: unix.fullPath,
        firebase_key_file: unix.fullPath,
        cache_duration: duration,
        cache_startup_queries: js.string(),
        cache_batch_size: js.integer(minimum=0),
        cache_batch_timeout: duration,
        auth_default_access: js.enum(['read-write', 'read-only', 'write-only', 'deny-all']),
        auth_startup_queries: js.string(),
        attachment_file_size_limit: size,
        attachment_expiry_duration: duration,
        smtp_sender_addr: js.oneOf([net.hostname, js.string(pattern='[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}(:[0-9]{1,5})?')]),
        smtp_sender_from: net.email,
        smtp_sender_user: js.string(),
        smtp_sender_pass: js.string(),
        smtp_sender_listen: ipPort,
        smtp_sender_domain: net.hostname,
        smtp_sender_add_prefix: js.string(),
        web_push_public_key: js.string(),
        web_push_private_key: js.string(),
        web_push_email_address: net.email,
        web_push_startup_queries: js.string(),
        twilio_account: js.string(),
        twilio_auth_token: js.string(),
        twilio_phone_number: js.string(),
        twilio_verify_service: js.string(),
        keepalive_interval: duration,
        manager_interval: duration,
        disallowed_topics: js.array(uniqueItems=true, unevaluatedItems=false) { items: js.string() },
        web_root: js.oneOf([js.string(pattern='^/'), js.enum(['disable'])]),
        enable_signup: js.boolean,
        enable_login: js.boolean,
        enable_reservations: js.boolean,
        upstream_base_url: net.uri,
        upstream_access_token: js.string(),
        message_size_limit: size,
        message_delay_limit: duration,
        global_topic_limit: js.integer(minimum=1),
        visitor_subscription_limit: js.integer(minimum=1),
        visitor_request_limit_burst: js.integer(minimum=1),
        visitor_request_limit_replenish: duration,
        visitor_request_limit_exempt_hosts: js.string(),
        visitor_message_daily_limit: js.integer(minimum=0),
        visitor_email_limit_burst: js.integer(minimum=1),
        visitor_email_limit_replenish: duration,
        visitor_attachment_total_size_limit: size,
        visitor_attachment_daily_bandwidth_limit: size,
        visitor_subscriber_rate_limiting: js.boolean,
        stripe_secret_key: js.string(),
        stripe_webhook_key: js.string(),
        billing_contact: js.oneOf([net.email, net.hostname]),
        enable_metrics: js.boolean,
        metrics_listen_http: ipPort,
        profile_listen_http: ipPort,
        log_level: js.enum(['trace', 'debug', 'info', 'warn', 'error']),
        log_level_overrides: js.string(),
        log_format: js.enum(['text', 'json']),
        log_file: unix.fullPath,
      },
    },
  },
}
