# Aggregation with rollup

The following example aggregates the areas of US states.

```
GET Areas?$apply=groupby((rollup(Country,State)),aggregate(Area))
&$select=Country,Country@Aggregation.rollup,State,State@Aggregation.rollup,Area
```

In the result the [`rolledup`](../vocabularies/Org.OData.Aggregation.V1.md#rolledup) instance annotation distinguishes the first instance, which represents the US total, from the second, which represents the federal district.

```
[{"Country": "US", "State@Aggregation.rolledup": true, "Area": 9629091},
 {"Country": "US", "Area": 177},
 {"Country": "US", "State": "TX", "Area": 695620},
 ...]
```
