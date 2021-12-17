const assert = require("assert");
const groupKey = require("../docs/groupKey");

describe("Group key construction", function () {
  it("without navigation property", function () {
    var groupingProperties = ["Country", "State"];
    assert.deepStrictEqual(groupKey(groupingProperties, {Country: "US"}),
                           {Country: "US", "State@Aggregation.IsUndefined": true});
    assert.deepStrictEqual(groupKey(groupingProperties, {Country: "US", State: "TX"}),
                           {Country: "US", State: "TX"});
  });
  it("with navigation property", function () {
    var groupingProperties = ["Country", "State/@odata.id"];
    assert.deepStrictEqual(groupKey(groupingProperties, {Country: "US"}),
                           {Country: "US", State: {"@Aggregation.IsUndefined": true}});
    assert.deepStrictEqual(groupKey(groupingProperties, {Country: "US", State: {"@odata.id": "States('TX')'"}}),
                           {Country: "US", State: {"@odata.id": "States('TX')'"}});
  });
});
