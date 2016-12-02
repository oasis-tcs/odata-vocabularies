# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

Term|Type|Description
:---|:---|:----------
<a name="TemporalSupported"></a>TemporalSupported|??Aggregation.TemporalSupportedType??|This entity container, entity set, or navigation property supports the temporal system query option
<a name="From"></a>From|PrimitiveType|
<a name="To"></a>To|PrimitiveType|
<a name="SystemFrom"></a>SystemFrom|PrimitiveType|
<a name="SystemTo"></a>SystemTo|PrimitiveType|

## <a name="TemporalSupportedType"></a>TemporalSupportedType


Property|Type|Description
:-------|:---|:----------
ApplicationTime|[TimeDimensionType](#TimeDimensionType)|
SystemTime|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|
NonTemporalProperties|\[PropertyPath\]|

## <a name="TimeDimensionType"></a>*TimeDimensionType*


**Derived Types:**
- [TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)
- [TimeDimensionGranularityDate](#TimeDimensionGranularityDate)

Property|Type|Description
:-------|:---|:----------
SupportedQueries|[QueryType](#QueryType)|

## <a name="TimeDimensionGranularityDateTimeOffset"></a>TimeDimensionGranularityDateTimeOffset: [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
*SupportedQueries*|[QueryType](#QueryType)|
Precision|Byte|

## <a name="TimeDimensionGranularityDate"></a>TimeDimensionGranularityDate: [TimeDimensionType](#TimeDimensionType)


Property|Type|Description
:-------|:---|:----------
*SupportedQueries*|[QueryType](#QueryType)|

## <a name="QueryType"></a>QueryType


Flag Member|Value|Description
:-----|----:|:----------
TimeTravel|1|
TimeSeries|2|
