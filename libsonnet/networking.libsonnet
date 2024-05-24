local js = import 'json-schema/draft/2020-12/schema.libsonnet';

{
  local net = self,

  port:: js.integer(minimum=0, maximum=65535),
  privilegedPorts:: js.integer(minimum=0, maximum=1023),
  unprivilegedPort:: js.integer(minimum=1024, maximum=65535),
  dnsName:: js.string(pattern='^([a-z0-9]([-a-z0-9]*[a-z0-9])?|)$', maxLength=63),
  hostname:: js.string(format='hostname'),
  ipv4:: js.string(format='ipv4'),
  ipv6:: js.string(format='ipv6'),
  uri:: js.string(format='uri'),
  email:: js.string(format='email'),
  ip:: js.oneOf([self.ipv4, self.ipv6]),
}
