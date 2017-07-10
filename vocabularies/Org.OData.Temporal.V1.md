# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

Term|Type|Description
:---|:---|:----------
[TemporalSupported](Org.OData.Temporal.V1.xml#L68)|[TemporalSupportedType](#TemporalSupportedType)|<a name="TemporalSupported"></a>This entity container, entity set, or navigation property supports the temporal system query option
[From](Org.OData.Temporal.V1.xml#L105)|PrimitiveType|<a name="From"></a>
[To](Org.OData.Temporal.V1.xml#L110)|PrimitiveType|<a name="To"></a>
[SystemFrom](Org.OData.Temporal.V1.xml#L115)|PrimitiveType|<a name="SystemFrom"></a>
[SystemTo](Org.OData.Temporal.V1.xml#L120)|PrimitiveType|<a name="SystemTo"></a>

## <a name="TemporalSupportedType"></a>[TemporalSupportedType](Org.OData.Temporal.V1.xml#L74)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L75)|[TimeDimensionType](#TimeDimensionType)|
[SystemTime](Org.OData.Temporal.V1.xml#L76)|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|
[NonTemporalProperties](Org.OData.Temporal.V1.xml#L77)|\[PropertyPath\]|

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L82)


**Derived Types:**
- [TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)
- [TimeDimensionGranularityDate](#TimeDimensionGranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L83)|[QueryType](#QueryType)|

## <a name="TimeDimensionGranularityDateTimeOffset"></a>[TimeDimensionGranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L86): [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L83)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L88)|Byte|

## <a name="TimeDimensionGranularityDate"></a>[TimeDimensionGranularityDate](Org.OData.Temporal.V1.xml#L93): [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L83)|[QueryType](#QueryType)|

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L97)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L98)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L99)|2|
