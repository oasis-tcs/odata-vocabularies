# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

Term|Type|Description
:---|:---|:----------
[TemporalSupported](Org.OData.Temporal.V1.xml#L54)|??Aggregation.TemporalSupportedType??|<a name="TemporalSupported"></a>This entity container, entity set, or navigation property supports the temporal system query option
[From](Org.OData.Temporal.V1.xml#L91)|PrimitiveType|<a name="From"></a>
[To](Org.OData.Temporal.V1.xml#L96)|PrimitiveType|<a name="To"></a>
[SystemFrom](Org.OData.Temporal.V1.xml#L101)|PrimitiveType|<a name="SystemFrom"></a>
[SystemTo](Org.OData.Temporal.V1.xml#L106)|PrimitiveType|<a name="SystemTo"></a>

## <a name="TemporalSupportedType"></a>[TemporalSupportedType](Org.OData.Temporal.V1.xml#L60)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L61)|[TimeDimensionType](#TimeDimensionType)|
[SystemTime](Org.OData.Temporal.V1.xml#L62)|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|
[NonTemporalProperties](Org.OData.Temporal.V1.xml#L63)|\[PropertyPath\]|

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L68)


**Derived Types:**
- [TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)
- [TimeDimensionGranularityDate](#TimeDimensionGranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L69)|[QueryType](#QueryType)|

## <a name="TimeDimensionGranularityDateTimeOffset"></a>[TimeDimensionGranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L72): [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L69)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L74)|Byte|

## <a name="TimeDimensionGranularityDate"></a>[TimeDimensionGranularityDate](Org.OData.Temporal.V1.xml#L79): [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L69)|[QueryType](#QueryType)|

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L83)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L84)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L85)|2|
