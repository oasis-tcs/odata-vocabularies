# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

Term|Type|Description
:---|:---|:----------
[TemporalSupported](Org.OData.Temporal.V1.xml#L73)|[TemporalSupportedType](#TemporalSupportedType)|<a name="TemporalSupported"></a>This entity container, entity set, or navigation property supports the temporal system query option
[From](Org.OData.Temporal.V1.xml#L110)|PrimitiveType|<a name="From"></a>Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or String with values min or now
[To](Org.OData.Temporal.V1.xml#L115)|PrimitiveType|<a name="To"></a>Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or String with values now or max
[SystemFrom](Org.OData.Temporal.V1.xml#L120)|PrimitiveType|<a name="SystemFrom"></a>Read-only lower boundary (inclusive) of system time. DateTimeOffset value or String with value min
[SystemTo](Org.OData.Temporal.V1.xml#L125)|PrimitiveType|<a name="SystemTo"></a>Read-only upper boundary (exclusive) of system time. DateTimeOffset value or String with value max

## <a name="TemporalSupportedType"></a>[TemporalSupportedType](Org.OData.Temporal.V1.xml#L79)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L80)|[TimeDimensionType](#TimeDimensionType)|
[SystemTime](Org.OData.Temporal.V1.xml#L81)|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|
[NonTemporalProperties](Org.OData.Temporal.V1.xml#L82)|\[PropertyPath\]|Properties whose value changes over time are not tracked

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L87)


**Derived Types:**
- [TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)
- [TimeDimensionGranularityDate](#TimeDimensionGranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L88)|[QueryType](#QueryType)|

## <a name="TimeDimensionGranularityDateTimeOffset"></a>[TimeDimensionGranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L91): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L88)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L93)|Byte|Precision of Edm.DateTimeOffset values for granularity DateTimeOffset

## <a name="TimeDimensionGranularityDate"></a>[TimeDimensionGranularityDate](Org.OData.Temporal.V1.xml#L98): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is Date

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L88)|[QueryType](#QueryType)|

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L102)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L103)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L104)|2|
