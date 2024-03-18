{
  local utils = self,

  objectPop(obj, key): {
    [k]: obj[k] for k in std.objectFieldsAll(obj) if k != key
  }
}
