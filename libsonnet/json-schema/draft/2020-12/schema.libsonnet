{
  local js = self,

  string(
    minLength=null,
    maxLength=null,
    pattern='',
    format='',
  ):: {
    type: 'string',
    [if std.isNumber(minLength) then 'minLength']: minLength,
    [if std.isNumber(maxLength) then 'maxLength']: maxLength,
    [if std.length(pattern) > 0 then 'pattern']: pattern,
    [if std.length(format) > 0 then 'format']: format,
  },
  number(
    multipleOf=null,
    minimum=null,
    exclusiveMinimum=null,
    maximum=null,
    exclusiveMaximum=null,
  ):: {
    type: 'integer',
    [if std.isNumber(multipleOf) then 'multipleOf']: multipleOf,
    [if std.isNumber(minimum) then 'minimum']: minimum,
    [if std.isNumber(exclusiveMinimum) then 'exclusiveMinimum']: exclusiveMinimum,
    [if std.isNumber(maximum) then 'maximum']: maximum,
    [if std.isNumber(exclusiveMaximum) then 'exclusiveMaximum']: exclusiveMaximum,
  },
  integer(
    multipleOf=null,
    minimum=null,
    exclusiveMinimum=null,
    maximum=null,
    exclusiveMaximum=null,
  ):: {
    type: 'integer',
    [if std.isNumber(multipleOf) then 'multipleOf']: multipleOf,
    [if std.isNumber(minimum) then 'minimum']: minimum,
    [if std.isNumber(exclusiveMinimum) then 'exclusiveMinimum']: exclusiveMinimum,
    [if std.isNumber(maximum) then 'maximum']: maximum,
    [if std.isNumber(exclusiveMaximum) then 'exclusiveMaximum']: exclusiveMaximum,
  },
  boolean:: {
    type: 'boolean',
  },
  'null':: {
    type: 'null',
  },
  object(
    additionalProperties=null,
    patternProperties={},
    unevaluatedProperties={},
    required=[],
    propertyNames={},
    minProperties=null,
    maxProperties=null,
  ):: {
    type: 'object',
    properties: error 'Must provide "properties" to object function',
    [if std.isBoolean(additionalProperties) || std.isObject(additionalProperties) then 'additionalProperties']: additionalProperties,
    [if std.length(patternProperties) > 0 then 'patternProperties']: patternProperties,
    [if std.length(unevaluatedProperties) > 0 then 'unevaluatedProperties']: unevaluatedProperties,
    [if std.length(required) > 0 then 'required']: required,
    [if std.length(propertyNames) > 0 then 'propertyNames']: propertyNames,
    [if std.isNumber(minProperties) then 'minProperties']: minProperties,
    [if std.isNumber(maxProperties) then 'maxProperties']: maxProperties,
  },
  array(
    prefixItems=[],
    unevaluatedItems=null,
    contains={},
    minContains=null,
    maxContains=null,
    minItems=null,
    maxItems=null,
    uniqueItems=null,
  ):: {
    type: 'array',
    items: error 'Must provide "item" to array function',
    [if std.length(prefixItems) > 0 then 'prefixItems']: prefixItems,
    [if std.isBoolean(unevaluatedItems) then 'unevaluatedItems']: unevaluatedItems,
    [if std.length(contains) > 0 then 'contains']: contains,
    [if std.isNumber(minContains) then 'minContains']: minContains,
    [if std.isNumber(maxContains) then 'maxContains']: maxContains,
    [if std.isNumber(minItems) then 'minItems']: minItems,
    [if std.isNumber(maxItems) then 'maxItems']: maxItems,
    [if std.isBoolean(uniqueItems) then 'uniqueItems']: uniqueItems,
  },
  enum(array=[]):: {
    enum: if std.length(array) > 0 then array else error 'Must pass array containing at least one item to enum function.',
  },
  url:: 'https://json-schema.org/draft/2020-12/schema',
  multipleTypes(types=[]):: {
    type: if std.length(types) >= 2 then types else error 'Must pass array containing at least two types to multipleTypes function.',
  },
  oneOf(types=[]):: {
    oneOf: if std.length(types) >= 2 then types else error 'Must pass array containinc at least two types to oneOf function.'
  }
}
