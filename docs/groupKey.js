function groupKey(groupingProperties, instance) {
  var groupKey = {};
  function group(obj, instance, groupingProperty) {
    if (groupingProperty[0] in instance) {
      if (groupingProperty.length === 1 || !instance[groupingProperty[0]])
        obj[groupingProperty[0]] = instance[groupingProperty[0]];
      else {
        obj[groupingProperty[0]] = obj[groupingProperty[0]] || {};
        group(obj[groupingProperty[0]],
              instance[groupingProperty[0]] || {},
              groupingProperty.slice(1));
      }
    } else if (groupingProperty[1] === "@odata.id")
      obj[groupingProperty[0]] = {"@Aggregation.IsUndefined": true};
    else
      obj[groupingProperty[0] + "@Aggregation.IsUndefined"] = true;
  }
  for (var groupingProperty of groupingProperties)
    group(groupKey, instance, groupingProperty.split("/"));
  return groupKey;
}
