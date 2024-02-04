local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local net = import 'networking.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/rss-bridge/values.schema.json',
  ingress=true,
) {
  properties+: {
    rssBridge: js.object(additionalProperties=false) {
      properties: {
        system: js.object(additionalProperties=false) {
          properties: {
            bridges: js.array(uniqueItems=true, minContains=1) {
              items: js.string(),
            },
            timezone: js.string(),
            message: js.string(),
            debug: js.object(additionalProperties=false) {
              properties: {
                enabled: js.boolean,
                whitelist: js.array(uniqueItems=true) {
                  items: net.ipv4,
                },
              },
            },
            maintenanceMode: js.boolean,
          },
        },
        http: js.object(additionalProperties=false) {
          properties: {
            timeout: js.integer(minimum=1),
            retries: js.integer(minimum=0),
            useragent: js.string(),
            maxFilesize: js.integer(minimum=1),
          },
        },
        cache: js.object(additionalProperties=false) {
          properties: {
            type: js.enum(['file', 'sqlite', 'memcached']),
            customTimeout: js.boolean,
          },
        },
        admin: js.object(additionalProperties=false) {
          properties: {
            email: net.email + js.multipleTypes(['string', 'null']),
            telegram: js.string(),
            donations: js.boolean,
          },
        },
        proxy: js.object(additionalProperties=false) {
          properties: {
            url: net.uri + js.multipleTypes(['string', 'null']),
            name: js.string(),
            byBridge: js.boolean,
          },
        },
        authentication: js.object(additionalProperties=false) {
          properties: {
            enabled: js.boolean,
            username: js.string(),
            password: js.string(minLength=12),
            token: js.string(minLength=12) + js.multipleTypes(['string', 'null']),
          },
        },
        'error': js.object(additionalProperties=false) {
          properties: {
            output: js.enum(['feed', 'http', 'none']),
            reportLimit: js.integer(minimum=1),
          },
        },
        fileCache: js.object(additionalProperties=false) {
          properties: {
            path: js.string(),
            enablePurge: js.boolean,
          },
        },
        sqliteCache: js.object(additionalProperties=false) {
          properties: {
            file: js.string(),
            enablePurge: js.boolean,
            timeout: js.integer(minimum=0),
          },
        },
        memcachedCache: js.object(additionalProperties=false) {
          properties: {
            host: net.hostname,
            port: net.port,
          },
        },
        discogsBridge: js.object(additionalProperties=false) {
          properties: {
            presonalAccessToken: js.string(),
          },
        },
      },
    },
    memcached: js.object(additionalProperties=true, required=['enabled']) {
      properties: {
        enabled: js.boolean,
      },
    },
  },
}
