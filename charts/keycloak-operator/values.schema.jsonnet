local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local net = import 'networking.libsonnet';
local utils = import 'utils.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/keycloak-operator/values.schema.json',
) {
  properties+: {
    openshift: js.boolean,
    keycloakImage: js.object(additionalProperties=false) {
      properties: utils.objectPop(helm.image.properties, "pullPolicy"),
    },
  },
}
