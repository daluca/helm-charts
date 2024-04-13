local js = import 'json-schema/draft/2020-12/schema.libsonnet';

{
  local unix = self,

  id:: js.integer(minimum=0, maximum=65534),
  uid:: unix.id,
  gid:: unix.id,

  systemId:: js.integer(minimum=1, maximum=999),
  systemUser:: unix.id,

  fullPath:: js.string(pattern="^/"),
}
