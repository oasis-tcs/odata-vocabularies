# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

Term|Type|Description
:---|:---|:----------
[TemporalSupported](Org.OData.Temporal.V1.xml#L63)|[TemporalSupportedType](#TemporalSupportedType)|<a name="TemporalSupported"></a>This entity container, entity set, or navigation property supports the temporal system query option
[From](Org.OData.Temporal.V1.xml#L100)|PrimitiveType|<a name="From"></a>
[To](Org.OData.Temporal.V1.xml#L105)|PrimitiveType|<a name="To"></a>
[SystemFrom](Org.OData.Temporal.V1.xml#L110)|PrimitiveType|<a name="SystemFrom"></a>
[SystemTo](Org.OData.Temporal.V1.xml#L115)|PrimitiveType|<a name="SystemTo"></a>

## <a name="TemporalSupportedType"></a>[TemporalSupportedType](Org.OData.Temporal.V1.xml#L69)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L70)|[TimeDimensionType](#TimeDimensionType)|
[SystemTime](Org.OData.Temporal.V1.xml#L71)|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|
[NonTemporalProperties](Org.OData.Temporal.V1.xml#L72)|\[PropertyPath\]|

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L77)


**Derived Types:**
- [TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)
- [TimeDimensionGranularityDate](#TimeDimensionGranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L78)|[QueryType](#QueryType)|

## <a name="TimeDimensionGranularityDateTimeOffset"></a>[TimeDimensionGranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L81): [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L78)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L83)|Byte|

## <a name="TimeDimensionGranularityDate"></a>[TimeDimensionGranularityDate](Org.OData.Temporal.V1.xml#L88): [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L78)|[QueryType](#QueryType)|

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L92)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L93)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L94)|2|
