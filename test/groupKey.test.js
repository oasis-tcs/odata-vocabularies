const assert = require("assert");
const groupKey = require("../docs/groupKey");

describe("Group key construction", function () {
  var data = [
    {Country: "US", Area: 177},
    {Country: "US", State: "TX", Area: 695620}
  ];
  it("without navigation property", function () {
    var groupingProperties = ["Country", "State"];
    assert.deepStrictEqual(
      groupKey(groupingProperties, data[0]),
      {Country: "US", "State@Aggregation.IsUndefined": true});
    assert.deepStrictEqual(
      groupKey(groupingProperties, data[1]),
      {Country: "US", State: "TX"});
  });
  it("with navigation property", function () {
    var groupingProperties = ["Country", "State/@odata.id"];
    assert.deepStrictEqual(
      groupKey(groupingProperties, data[0]),
      {Country: "US", State: {"@Aggregation.IsUndefined": true}});
    assert.deepStrictEqual(
      groupKey(groupingProperties, Object.assign({}, data[1], {State: {"@odata.id": "States('TX')'"}})),
      {Country: "US", State: {"@odata.id": "States('TX')'"}});
  });
});
