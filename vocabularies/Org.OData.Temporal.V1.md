# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[TemporalSupport](Org.OData.Temporal.V1.xml#L75)|[TemporalSupportType](#TemporalSupportType)|<a name="TemporalSupport"></a>This entity container, entity set, or navigation property supports the temporal system query option
[ObjectKey](Org.OData.Temporal.V1.xml#L119)|\[PropertyPath\]|<a name="ObjectKey"></a>The set of primitive properties that identify a temporal object
[From](Org.OData.Temporal.V1.xml#L128)|PrimitiveType|<a name="From"></a>Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or String with values min or now
[To](Org.OData.Temporal.V1.xml#L133)|PrimitiveType|<a name="To"></a>Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or String with values now or max
[SystemFrom](Org.OData.Temporal.V1.xml#L138)|PrimitiveType|<a name="SystemFrom"></a>Read-only lower boundary (inclusive) of system time. DateTimeOffset value or String with value min
[SystemTo](Org.OData.Temporal.V1.xml#L143)|PrimitiveType|<a name="SystemTo"></a>Read-only upper boundary (exclusive) of system time. DateTimeOffset value or String with value max


## Actions

Action|Signature|Description
:-------|:--------|:----------
[UpdateObject](Org.OData.Temporal.V1.xml#L151)|timeslices:&nbsp;\[EntityType\], ObjectKey:&nbsp;EntityType, From:&nbsp;PrimitiveType, To:&nbsp;PrimitiveType, Values:&nbsp;EntityType &rarr;&nbsp;\[EntityType\]|<a name="UpdateObject"></a>Updates all time slices of a temporal object in a given period of application time
[UpsertObject](Org.OData.Temporal.V1.xml#L181)|timeslices:&nbsp;\[EntityType\], ObjectKey:&nbsp;EntityType, From:&nbsp;PrimitiveType, To:&nbsp;PrimitiveType, Values:&nbsp;EntityType &rarr;&nbsp;\[EntityType\]|<a name="UpsertObject"></a>Upserts a temporal object in a given period of application time by updating existing time slices in that period and creating new time slices to close gaps in that period
[UpdateObjectFrom](Org.OData.Temporal.V1.xml#L211)|timeslices:&nbsp;\[EntityType\], ObjectKey:&nbsp;EntityType, From:&nbsp;PrimitiveType, To:&nbsp;PrimitiveType, Values:&nbsp;EntityType &rarr;&nbsp;\[EntityType\]|<a name="UpdateObjectFrom"></a>Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

## <a name="TemporalSupportType"></a>[TemporalSupportType](Org.OData.Temporal.V1.xml#L81)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L82)|[TimeDimensionType](#TimeDimensionType)|Application time granularity
[SystemTime](Org.OData.Temporal.V1.xml#L85)|[TimeDimensionGranularityDateTimeOffset](#TimeDimensionGranularityDateTimeOffset)|System time granularity
[SupportedActions](Org.OData.Temporal.V1.xml#L88)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L93)


**Derived Types:**
- [GranularityDateTimeOffset](#GranularityDateTimeOffset)
- [GranularityDate](#GranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L94)|[QueryType](#QueryType)|

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L97)
**Type:** String

The qualified name of an action in scope.

*TODO: move this to Core, where we already have QualifiedTypeName and QualifiedTermName?*

## <a name="GranularityDateTimeOffset"></a>[GranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L103): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L94)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L105)|Byte|Precision of Edm.DateTimeOffset values for granularity DateTimeOffset

## <a name="GranularityDate"></a>[GranularityDate](Org.OData.Temporal.V1.xml#L110): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is Date

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L94)|[QueryType](#QueryType)|

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L114)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L115)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L116)|2|
