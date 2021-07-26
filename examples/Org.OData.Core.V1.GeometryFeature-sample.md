# Example for [Core.GeometryFeature](../vocabularies/Org.OData.Core.V1.md#GeometryFeature)

The term [Core.GeometryFeature](../vocabularies/Org.OData.Core.V1.md#GeometryFeature) allows servers to tell clients how to interpret parts of a structured type as a [GeoJSON Feature Object](https://datatracker.ietf.org/doc/html/rfc7946#section-3.2).

Example data for the entity type [HolidayLocation](./Org.OData.Core.V1.GeometryFeature-sample.xml#L13-L15):

```json
{
  "id": "42",
  "displayName": "Dinagat Islands",
  "location": {
    "type": "Point",
    "coordinates": [125.6, 10.1]
  }
}
```

Using the annotation [Core.GeometryFeature](./Org.OData.Core.V1.GeometryFeature-sample.xml#L16-L26) the data can be interpreted as this GeoJSON Feature Object:

```json
{
  "type": "Feature",
  "geometry": {
    "type": "Point",
    "coordinates": [125.6, 10.1]
  },
  "properties": {
    "name": "Dinagat Islands"
  },
  "id": "42"
}
```
