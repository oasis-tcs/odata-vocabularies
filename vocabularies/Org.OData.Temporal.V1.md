# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

This is a working draft that may incompatibly change any time.


## Terms

Term|Type|Description
:---|:---|:----------
[TemporalSupport](Org.OData.Temporal.V1.xml#L75)|[TemporalSupportType](#TemporalSupportType)|<a name="TemporalSupport"></a>This entity container, entity set, or navigation property supports the temporal system query option
[ObjectKey](Org.OData.Temporal.V1.xml#L106)|\[PropertyPath\]|<a name="ObjectKey"></a>The set of primitive properties that identify a temporal object
[From](Org.OData.Temporal.V1.xml#L115)|PrimitiveType|<a name="From"></a>Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or String with values min or now
[To](Org.OData.Temporal.V1.xml#L120)|PrimitiveType|<a name="To"></a>Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or String with values now or max
[SystemFrom](Org.OData.Temporal.V1.xml#L125)|PrimitiveType|<a name="SystemFrom"></a>Read-only lower boundary (inclusive) of system time. DateTimeOffset value or String with value min
[SystemTo](Org.OData.Temporal.V1.xml#L130)|PrimitiveType|<a name="SystemTo"></a>Read-only upper boundary (exclusive) of system time. DateTimeOffset value or String with value max

## <a name="TemporalSupportType"></a>[TemporalSupportType](Org.OData.Temporal.V1.xml#L81)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L82)|[TimeDimensionType](#TimeDimensionType)|
[SystemTime](Org.OData.Temporal.V1.xml#L83)|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L86)


**Derived Types:**
- [GranularityDateTimeOffset](#GranularityDateTimeOffset)
- [GranularityDate](#GranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L87)|[QueryType](#QueryType)|

## <a name="GranularityDateTimeOffset"></a>[GranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L90): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L87)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L92)|Byte|Precision of Edm.DateTimeOffset values for granularity DateTimeOffset

## <a name="GranularityDate"></a>[GranularityDate](Org.OData.Temporal.V1.xml#L97): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is Date

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L87)|[QueryType](#QueryType)|

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L101)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L102)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L103)|2|

## <a name="ObjectKeyValues"></a>[ObjectKeyValues](Org.OData.Temporal.V1.xml#L164)
Property values that identify a single temporal object

Structure must match the [`Temporal.ObjectKey`](#ObjectKey) of the entity type of the binding parameter value
