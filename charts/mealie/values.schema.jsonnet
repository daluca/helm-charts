local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local unix = import 'unix.libsonnet';
local net = import 'networking.libsonnet';
local kube = import 'kubernetes.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/mealie/values.schema.json',
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
          items: js.enum(['ReadWriteOnce', 'ReadOnlyMany', 'ReadWriteMany', 'ReadWriteOncePod'])
        },
      },
    },
    extraEnvs: js.array(uniqueItems=true) {
      items: kube.envVar,
    },
    config: js.object(additionalProperties=false, required=['SMTP_AUTH_STRATEGY']) {
      properties: {
        PUID: unix.uid,
        PGID: unix.gid,
        DEFAULT_GROUP: js.string(),
        BASE_URL: net.uri,
        TOKEN_TIME: js.integer(minimum=1),
        API_PORT: net.port,
        API_DOCS: js.boolean,
        TZ: js.string(),
        ALLOW_SIGNUP: js.boolean,
        LOG_CONFIG_OVERRIDE: unix.fullPath,
        LOG_LEVEL: js.enum(['critical', 'error', 'warning', 'info', 'debug', 'trace']),
        DAILY_SCHEDULE_TIME: js.string(pattern="[0-9]{2}:[0-9]{2}"),
        SECURITY_MAX_LOGIN_ATTEMPTS: js.integer(minimum=1),
        SECURITY_USER_LOCKOUT_TIME: js.integer(minimum=0),
        SMTP_HOST: net.hostname,
        SMTP_PORT: net.port,
        SMTP_FROM_NAME: js.string(),
        SMTP_AUTH_STRATEGY: js.enum(['TLS', 'SSL', 'NONE']),
        SMTP_FROM_EMAIL: js.string(),
        SMTP_USER: js.string(),
        SMTP_PASSWORD: js.string(),
        UVICORN_WORKERS: js.integer(minimum=1),
        LDAP_AUTH_ENABLED: js.boolean,
        LDAP_SERVER_URL: net.uri,
        LDAP_TLS_INSECURE: js.boolean,
        LDAP_TLS_CACERTFILE: unix.fullPath,
        LDAP_ENABLE_STARTTLS: js.boolean,
        LDAP_BASE_DN: js.string(),
        LDAP_QUERY_BIND: js.string(),
        LDAP_QUERY_PASSWORD: js.string(),
        LDAP_USER_FILTER: js.string(),
        LDAP_ADMIN_FILTER: js.string(),
        LDAP_ID_ATTRIBUTE: js.string(),
        LDAP_NAME_ATTRIBUTE: js.string(),
        LDAP_MAIL_ATTRIBUTE: js.string(),
        OIDC_AUTH_ENABLED: js.boolean,
        OIDC_SIGNUP_ENABLED: js.boolean,
        OIDC_CONFIGURATION_URL: net.uri,
        OIDC_CLIENT_ID: js.string(),
        OIDC_USER_GROUP: js.string(),
        OIDC_ADMIN_GROUP: js.string(),
        OIDC_AUTO_REDIRECT: js.boolean,
        OIDC_PROVIDER_NAME: js.string(),
        OIDC_REMEMBER_ME: js.boolean,
        OIDC_SIGNING_ALGORITHM: js.string(),
        OIDC_USER_CLAIM: js.string(),
        OIDC_GROUPS_CLAIM: js.string(),
        OIDC_TLS_CACERTFILE: unix.fullPath,
        OPENAI_BASE_URL: net.uri,
        OPENAI_API_KEY: js.string(),
        OPENAI_MODEL: js.string(),
        OPENAI_ENABLE_IMAGE_SERVICES: js.boolean,
        OPENAI_WORKERS: js.integer(minimum=1),
        OPENAI_SEND_DATABASE_DATA: js.boolean,
        OPENAI_REQUEST_TIMEOUT: js.integer(minimum=1),
        THEME_LIGHT_PRIMARY: js.string(pattern="#[0-9A-F]{6}"),
        THEME_LIGHT_ACCENT: js.string(pattern="#[0-9A-F]{6}"),
        THEME_LIGHT_SECONDARY: js.string(pattern="#[0-9A-F]{6}"),
        THEME_LIGHT_SUCCESS: js.string(pattern="#[0-9A-F]{6}"),
        THEME_LIGHT_INFO: js.string(pattern="#[0-9A-F]{6}"),
        THEME_LIGHT_WARNING: js.string(pattern="#[0-9A-F]{6}"),
        THEME_LIGHT_ERROR: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_PRIMARY: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_ACCENT: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_SECONDARY: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_SUCCESS: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_INFO: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_WARNING: js.string(pattern="#[0-9A-F]{6}"),
        THEME_DARK_ERROR: js.string(pattern="#[0-9A-F]{6}"),
      },
      allOf: [
        {
          anyOf: [
            {
              not: {
                properties: {
                  SMTP_AUTH_STRATEGY: { const: 'TLS' },
                },
              },
            },
            {
              required: ['SMTP_USER', 'SMTP_PASSWORD'],
            },
          ],
        },
        {
          anyOf: [
            {
              not: {
                properties: {
                  SMTP_AUTH_STRATEGY: { const: 'SSL' },
                },
              },
            },
            {
              required: ['SMTP_USER', 'SMTP_PASSWORD'],
            },
          ],
        },
      ],
    },
    database: helm.externalDatabase(['postgres', 'sqlite']),
    postgresql: helm.postgresql,
  }
}
