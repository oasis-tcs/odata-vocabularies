# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[TemporalSupport](Org.OData.Temporal.V1.xml#L72)|[TemporalSupportType?](#TemporalSupportType)|<a name="TemporalSupport"></a>This entity set or navigation property supports temporal requests
[From](Org.OData.Temporal.V1.xml#L126)|PrimitiveType|<a name="From"></a>Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or String with values min or now
[To](Org.OData.Temporal.V1.xml#L130)|PrimitiveType|<a name="To"></a>Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or String with values now or max
[SystemFrom](Org.OData.Temporal.V1.xml#L134)|PrimitiveType|<a name="SystemFrom"></a>Read-only lower boundary (inclusive) of system time. DateTimeOffset value or String with value min
[SystemTo](Org.OData.Temporal.V1.xml#L138)|PrimitiveType|<a name="SystemTo"></a>Read-only upper boundary (exclusive) of system time. DateTimeOffset value or String with value max
[History](Org.OData.Temporal.V1.xml#L145)|\[EntityType\]|<a name="History"></a>A collection of time slices representing the history of the annotated entity <br>The time slices have the same entity type as the annotated entity and use the same select-expand projection.


## Actions

### <a name="UpdateObject"></a>[UpdateObject](Org.OData.Temporal.V1.xml#L153)

Updates all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
[timeslices](Org.OData.Temporal.V1.xml#L155)|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L158)|EntityType|Property values that identify a single temporal object <br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L162)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L165)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L168)|EntityType|Property values to update <br>Same entity type as binding parameter and return type, specify only values of non-key properties.
&rarr;|\[EntityType\]|Modified time slices <br>Same entity type as binding parameter.


### <a name="UpsertObject"></a>[UpsertObject](Org.OData.Temporal.V1.xml#L178)

Upserts a temporal object in a given period of application time after splitting partially overlapping time slices by updating existing time slices in that period and creating new time slices to close gaps in that period

Parameter|Type|Description
:--------|:---|:----------
[timeslices](Org.OData.Temporal.V1.xml#L180)|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L183)|EntityType|Property values that identify a single temporal object <br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L187)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L190)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L193)|EntityType|Property values to insert or update <br>Same entity type as binding parameter and return type, specify only values of non-key properties.
&rarr;|\[EntityType\]|Modified time slices <br>Same entity type as binding parameter.


### <a name="UpdateObjectFrom"></a>[UpdateObjectFrom](Org.OData.Temporal.V1.xml#L203)

Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
[timeslices](Org.OData.Temporal.V1.xml#L205)|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L208)|EntityType|Property values that identify a single temporal object <br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L212)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L215)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L218)|EntityType|Property values to update <br>Same entity type as binding parameter and return type, specify only values of non-key properties.
&rarr;|\[EntityType\]|Modified time slices <br>Same entity type as binding parameter.


### <a name="SynchronizeObject"></a>[SynchronizeObject](Org.OData.Temporal.V1.xml#L228)

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
[timeslices](Org.OData.Temporal.V1.xml#L230)|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L233)|EntityType|Property values that identify a single temporal object <br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[Timeline](Org.OData.Temporal.V1.xml#L237)|\[EntityType\]|List of time slices covering the full timeline of the temporal object <br>Same entity type as the binding parameter.


### <a name="DeleteObject"></a>[DeleteObject](Org.OData.Temporal.V1.xml#L243)

Deletes all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
[timeslices](Org.OData.Temporal.V1.xml#L245)|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L248)|EntityType|Property values that identify a single temporal object <br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L252)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L255)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
&rarr;|\[EntityType\]|Deleted time slices <br>Same entity type as binding parameter.


### <a name="DeleteObjectFrom"></a>[DeleteObjectFrom](Org.OData.Temporal.V1.xml#L264)

Deletes time slices of a temporal object from a a given point in application time onwards and stops if a property changes its value from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
[timeslices](Org.OData.Temporal.V1.xml#L266)|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L269)|EntityType|Property values that identify a single temporal object <br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L273)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L276)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
&rarr;|\[EntityType\]|Deleted time slices <br>Same entity type as binding parameter.


## <a name="TemporalSupportType"></a>[TemporalSupportType](Org.OData.Temporal.V1.xml#L78)


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L79)|[TimeDimensionType?](#TimeDimensionType)|Application time granularity
[SystemTime](Org.OData.Temporal.V1.xml#L82)|[GranularityDateTimeOffset?](#GranularityDateTimeOffset)|System time granularity
[ObjectKey](Org.OData.Temporal.V1.xml#L85)|\[PropertyPath\]|The set of primitive properties that identify a temporal object <br>A temporal object is a set of facts whose change over application and/or system time is tracked by the service. The entities of the annotated entity set are time slices of temporal objects. A temporal object is uniquely identified within this set by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, the object key is identical to the entity key.
[SupportedActions](Org.OData.Temporal.V1.xml#L89)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L94)


**Derived Types:**
- [GranularityDateTimeOffset](#GranularityDateTimeOffset)
- [GranularityDate](#GranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L95)|[QueryType](#QueryType)|

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L98)
**Type:** String

The qualified name of an action in scope.

*TODO: move this to Core, where we already have QualifiedTypeName and QualifiedTermName?*

## <a name="GranularityDateTimeOffset"></a>[GranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L103): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L95)|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L105)|Byte|Precision of Edm.DateTimeOffset values for granularity DateTimeOffset

## <a name="GranularityDate"></a>[GranularityDate](Org.OData.Temporal.V1.xml#L110): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is Date

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L95)|[QueryType](#QueryType)|
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L112)|Boolean|Application-time periods are stored with closed-closed semantics <br>Use the temporal query option `$toInclusive` instead of `$to` for specifying the period end in time-series queries.

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L118)


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L119)|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L120)|2|
