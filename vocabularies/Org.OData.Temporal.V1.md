# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L70)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L138)

Updates all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L140)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L143)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L146)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L149)|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L153)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L160)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L166)

Upserts a temporal object in a given period of application time after splitting partially overlapping time slices by updating existing time slices in that period and creating new time slices to close gaps in that period

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L168)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L171)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L174)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L177)|EntityType|Property values to insert or update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L181)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L188)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateFrom"></a>[UpdateFrom](Org.OData.Temporal.V1.xml#L194)

Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L196)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L199)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L202)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L205)|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L209)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L216)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Synchronize"></a>[Synchronize](Org.OData.Temporal.V1.xml#L222)

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L224)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[Timeline](Org.OData.Temporal.V1.xml#L227)|\[EntityType\]|List of time slices covering the full timeline of the temporal object<br>Same entity type as the binding parameter.
*[ObjectKey](Org.OData.Temporal.V1.xml#L231)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.


### <a name="Delete"></a>[Delete](Org.OData.Temporal.V1.xml#L240)

Deletes all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L242)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L245)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L248)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L251)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L258)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


### <a name="DeleteFrom"></a>[DeleteFrom](Org.OData.Temporal.V1.xml#L264)

Deletes time slices of a temporal object from a a given point in application time onwards and stops if a property changes its value from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L266)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L269)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L272)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L275)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L282)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


## <a name="ApplicationTimeSupportType"></a>[ApplicationTimeSupportType](Org.OData.Temporal.V1.xml#L77)


Property|Type|Description
:-------|:---|:----------
[CollectionKind](Org.OData.Temporal.V1.xml#L78)|[CollectionKindType](#CollectionKindType)|Kind of temporal collection
[PeriodKind](Org.OData.Temporal.V1.xml#L81)|[PeriodKindType](#PeriodKindType)|Kind of application time period
[SupportedActions](Org.OData.Temporal.V1.xml#L84)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="CollectionKindType"></a>[*CollectionKindType*](Org.OData.Temporal.V1.xml#L89)
Kind of temporal collection

**Derived Types:**
- [CollectionKindSnapshot](#CollectionKindSnapshot)
- [CollectionKindTimeSlice](#CollectionKindTimeSlice)

## <a name="CollectionKindSnapshot"></a>[CollectionKindSnapshot](Org.OData.Temporal.V1.xml#L93): [CollectionKindType](#CollectionKindType)
Each OData entity corresponds to a temporal object and by default only shows data of the current time slice

## <a name="CollectionKindTimeSlice"></a>[CollectionKindTimeSlice](Org.OData.Temporal.V1.xml#L97): [CollectionKindType](#CollectionKindType)
Each OData entity corresponds to a time slice and all time slices of a temporal object are part of the collection

Property|Type|Description
:-------|:---|:----------
[TimeSliceStart](Org.OData.Temporal.V1.xml#L99)|PropertyPath|Property containing lower boundary of a time slice
[TimeSliceEnd](Org.OData.Temporal.V1.xml#L102)|PropertyPath|Property containing upper boundary of a time slice
[ObjectKey](Org.OData.Temporal.V1.xml#L105)|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose changes over application time are tracked by the service. The entities in the annotated collection belong to potentially multiple temporal objects, and each temporal object is uniquely identified by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, only a single temporal object belongs to the annotated collection.

## <a name="PeriodKindType"></a>[*PeriodKindType*](Org.OData.Temporal.V1.xml#L111)
Kind of a time period

**Derived Types:**
- [PeriodKindDateTimeOffset](#PeriodKindDateTimeOffset)
- [PeriodKindDate](#PeriodKindDate)

## <a name="PeriodKindDateTimeOffset"></a>[PeriodKindDateTimeOffset](Org.OData.Temporal.V1.xml#L115): [PeriodKindType](#PeriodKindType)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](Org.OData.Temporal.V1.xml#L117)|Byte|Precision of Edm.DateTimeOffset values for period start and end

## <a name="PeriodKindDate"></a>[PeriodKindDate](Org.OData.Temporal.V1.xml#L122): [PeriodKindType](#PeriodKindType)
Period start and end are of type Edm.Date

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L124)|Boolean|If `true`, the period end is included in the time period

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L130)
**Type:** String

The qualified name of an action in scope.
