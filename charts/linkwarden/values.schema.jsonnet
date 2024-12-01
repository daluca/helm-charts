local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local unix = import 'unix.libsonnet';
local net = import 'networking.libsonnet';
local kube = import 'kubernetes.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/linkwarden/values.schema.json',
  ingress=true,
  commonLibrary=true,
) {
  properties+: {
    config: js.object(additionalProperties=false, patternProperties={
      "^NEXT_PUBLIC_.*_ENABLED$": js.boolean,
      "_CUSTOM_NAME$": js.string(),
      "_ISSUER$": js.string(),
      "_CLIENT_NAME$": js.string(),
      "_CLIENT_SECRET$": js.string(),
    }) {
      properties: {
        PAGINATION_TAKE_COUNT: js.integer(minimum=1),
        AUTOSCROLL_TIMEOUT: js.integer(minimum=1),
        RE_ARCHIVE_LIMIT: js.integer(minimum=1),
        NEXT_PUBLIC_DISABLE_REGISTRATION: js.boolean,
        NEXT_PUBLIC_CREDENTIALS_ENABLED: js.boolean,
        DISABLE_NEW_SSO_USERS: js.boolean,
        SPACES_KEY: js.string(),
        SPACES_SECRET: js.string(),
        SPACES_ENDPOINT: js.string(),
        SPACES_BUCKET_NAME: js.string(),
        SPACES_REGION: js.string(),
        SPACES_FORCE_PATH_STYLE: js.boolean,
        NEXT_PUBLIC_EMAIL_PROVIDER: js.boolean,
        EMAIL_FROM: js.string(),
        EMAIL_SERVER: js.string(format='uri', pattern='^smtp://'),
        NEXTAUTH_SECRET: js.string(),
        ATLASSIAN_SCOPE: js.string(),
        AUTHELIA_WELLKNOWN_URL: js.string(),
        AZURE_AD_B2C_PRIMARY_USER_FLOW: js.string(),
        BUNGIE_API_KEY: js.string(),
        FOURSQUARE_APIVERSION: js.string(),
        FUSIONAUTH_TENANT_ID: js.string(),
        GITHUB_ID: js.string(),
        GITHUB_SECRET: js.string(),
      },
    },
    database: helm.externalDatabase(),
    postgresql: helm.postgresql,
  },
}
