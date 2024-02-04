local js = import 'json-schema/draft/2020-12/schema.libsonnet';

{
  port:: js.integer(minimum=0, maximum=65535),
  dnsName:: js.string(pattern='^([a-z0-9]([-a-z0-9]*[a-z0-9])?|)$', maxLength=63),
  hostname:: js.string(format='hostname'),
  ipv4:: js.string(format='ipv4'),
  ipv6:: js.string(format='ipv6'),
  uri:: js.string(format='uri'),
  email:: js.string(format='email'),
}
