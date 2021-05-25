# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L70)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This entity set or navigation property supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L131)

Updates all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L133)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L136)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L139)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L142)|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L146)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L153)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L159)

Upserts a temporal object in a given period of application time after splitting partially overlapping time slices by updating existing time slices in that period and creating new time slices to close gaps in that period

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L161)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L164)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L167)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L170)|EntityType|Property values to insert or update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L174)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L181)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateFrom"></a>[UpdateFrom](Org.OData.Temporal.V1.xml#L187)

Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L189)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L192)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L195)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L198)|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L202)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L209)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Synchronize"></a>[Synchronize](Org.OData.Temporal.V1.xml#L215)

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L217)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[Timeline](Org.OData.Temporal.V1.xml#L220)|\[EntityType\]|List of time slices covering the full timeline of the temporal object<br>Same entity type as the binding parameter.
*[ObjectKey](Org.OData.Temporal.V1.xml#L224)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.


### <a name="Delete"></a>[Delete](Org.OData.Temporal.V1.xml#L233)

Deletes all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L235)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L238)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L241)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L244)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L251)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


### <a name="DeleteFrom"></a>[DeleteFrom](Org.OData.Temporal.V1.xml#L257)

Deletes time slices of a temporal object from a a given point in application time onwards and stops if a property changes its value from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L259)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L262)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L265)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L268)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L275)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


## <a name="ApplicationTimeSupportType"></a>[ApplicationTimeSupportType](Org.OData.Temporal.V1.xml#L77)


Property|Type|Description
:-------|:---|:----------
[Granularity](Org.OData.Temporal.V1.xml#L78)|[GranularityType?](#GranularityType)|Application time granularity
[ObjectKey](Org.OData.Temporal.V1.xml#L81)|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose change over application and/or system time is tracked by the service. The entities of the annotated collection are time slices of potentially multiple temporal objects. A temporal object is uniquely identified within this set by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, the annotated collection only contains time slices for a single one temporal object.
[SupportedActions](Org.OData.Temporal.V1.xml#L85)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="GranularityType"></a>[*GranularityType*](Org.OData.Temporal.V1.xml#L90)


**Derived Types:**
- [GranularityDateTimeOffset](#GranularityDateTimeOffset)
- [GranularityDate](#GranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L91)|[QueryType](#QueryType)|
[TimeSliceStart](Org.OData.Temporal.V1.xml#L92)|PropertyPath?|Property containing lower boundary of a time slice<br>Must be present if time-period queries are supported
[TimeSliceEnd](Org.OData.Temporal.V1.xml#L96)|PropertyPath?|Property containing upper boundary of a time slice<br>Must be present if time-period queries are supported

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L102)


Flag Member|Value|Description
:-----|----:|:----------
[PointInTime](Org.OData.Temporal.V1.xml#L103)|1|
[TimePeriod](Org.OData.Temporal.V1.xml#L104)|2|

## <a name="GranularityDateTimeOffset"></a>[GranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L107): [GranularityType](#GranularityType)
Granularity of this time dimension is DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L91)|[QueryType](#QueryType)|
[*TimeSliceStart*](Org.OData.Temporal.V1.xml#L92)|PropertyPath?|Property containing lower boundary of a time slice<br>Must be present if time-period queries are supported
[*TimeSliceEnd*](Org.OData.Temporal.V1.xml#L96)|PropertyPath?|Property containing upper boundary of a time slice<br>Must be present if time-period queries are supported
[Precision](Org.OData.Temporal.V1.xml#L109)|Byte|Precision of Edm.DateTimeOffset values for granularity DateTimeOffset

## <a name="GranularityDate"></a>[GranularityDate](Org.OData.Temporal.V1.xml#L114): [GranularityType](#GranularityType)
Granularity of this time dimension is Date

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L91)|[QueryType](#QueryType)|
[*TimeSliceStart*](Org.OData.Temporal.V1.xml#L92)|PropertyPath?|Property containing lower boundary of a time slice<br>Must be present if time-period queries are supported
[*TimeSliceEnd*](Org.OData.Temporal.V1.xml#L96)|PropertyPath?|Property containing upper boundary of a time slice<br>Must be present if time-period queries are supported
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L116)|Boolean|Application-time periods are stored with closed-closed semantics<br>If `true`, the value of the property referenced by `TimeSliceEnd` is included in the time slice.

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L123)
**Type:** String

The qualified name of an action in scope.
