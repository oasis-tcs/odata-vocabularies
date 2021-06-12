# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L70)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This entity set or navigation property supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L149)

Adds time slices to a time-slice collection, splitting and updating other time slices in order to avoid overlap

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L151)**|\[EntityType\]|**Binding parameter:** Collection of time slices to be updated with additional time slices
[newTimeslices](Org.OData.Temporal.V1.xml#L154)|\[EntityType\]|Time slices to be merged into the `timeslices` collection<br>Same entity type as binding parameter.
[&rarr;](Org.OData.Temporal.V1.xml#L158)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L164)

Upserts a temporal object in a given period of application time after splitting partially overlapping time slices by updating existing time slices in that period and creating new time slices to close gaps in that period

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L166)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L169)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L172)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L175)|EntityType|Property values to insert or update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L179)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L186)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateFrom"></a>[UpdateFrom](Org.OData.Temporal.V1.xml#L192)

Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L194)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L197)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L200)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L203)|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L207)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L214)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Synchronize"></a>[Synchronize](Org.OData.Temporal.V1.xml#L220)

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L222)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[Timeline](Org.OData.Temporal.V1.xml#L225)|\[EntityType\]|List of time slices covering the full timeline of the temporal object<br>Same entity type as the binding parameter.
*[ObjectKey](Org.OData.Temporal.V1.xml#L229)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.


### <a name="Delete"></a>[Delete](Org.OData.Temporal.V1.xml#L238)

Deletes all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L240)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L243)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L246)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L249)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L256)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


### <a name="DeleteFrom"></a>[DeleteFrom](Org.OData.Temporal.V1.xml#L262)

Deletes time slices of a temporal object from a a given point in application time onwards and stops if a property changes its value from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L264)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L267)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L270)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L273)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L280)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


## <a name="ApplicationTimeSupportType"></a>[ApplicationTimeSupportType](Org.OData.Temporal.V1.xml#L77)


Property|Type|Description
:-------|:---|:----------
[CollectionKind](Org.OData.Temporal.V1.xml#L78)|[CollectionKindType](#CollectionKindType)|Kind of temporal collection
[PeriodKind](Org.OData.Temporal.V1.xml#L81)|[PeriodKindType](#PeriodKindType)|Kind of application time period
[ObjectKey](Org.OData.Temporal.V1.xml#L84)|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose change over application and/or system time is tracked by the service. The entities of the annotated collection are time slices of potentially multiple temporal objects. A temporal object is uniquely identified within this set by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, the annotated collection only contains time slices for a single one temporal object.
[SupportedActions](Org.OData.Temporal.V1.xml#L88)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="CollectionKindType"></a>[*CollectionKindType*](Org.OData.Temporal.V1.xml#L93)
Kind of temporal collection

**Derived Types:**
- [CollectionKindSnapshot](#CollectionKindSnapshot)
- [CollectionKindTimeSlice](#CollectionKindTimeSlice)

## <a name="CollectionKindSnapshot"></a>[CollectionKindSnapshot](Org.OData.Temporal.V1.xml#L97): [CollectionKindType](#CollectionKindType)
Each OData entity represents a snapshot of data at a point in application time that is the same for all entities in the collection

The point in application time is defined by the `$at` clause of a request; default is the current point in time.

## <a name="CollectionKindTimeSlice"></a>[CollectionKindTimeSlice](Org.OData.Temporal.V1.xml#L104): [CollectionKindType](#CollectionKindType)
Each OData entity represents data during an interval of application time; it is called a *time slice*

Entities in a temporal collection of this kind are said to *overlap*
          if the intervals defined by their `TimeSliceStart` and `TimeSliceEnd` properties overlap
          and their other, *non-temporal*, key properties are identical.
          A temporal collection of this kind MUST NOT contain overlapping entities;
          and if it contains an entity, it MUST contain all entities
          that agree with the given one in their non-temporal key properties.

Property|Type|Description
:-------|:---|:----------
[TimeSliceStart](Org.OData.Temporal.V1.xml#L114)|PropertyPath|Property containing lower boundary of a time slice
[TimeSliceEnd](Org.OData.Temporal.V1.xml#L117)|PropertyPath|Property containing upper boundary of a time slice

## <a name="PeriodKindType"></a>[*PeriodKindType*](Org.OData.Temporal.V1.xml#L122)
Kind of a time period

**Derived Types:**
- [PeriodKindDateTimeOffset](#PeriodKindDateTimeOffset)
- [PeriodKindDate](#PeriodKindDate)

## <a name="PeriodKindDateTimeOffset"></a>[PeriodKindDateTimeOffset](Org.OData.Temporal.V1.xml#L126): [PeriodKindType](#PeriodKindType)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](Org.OData.Temporal.V1.xml#L128)|Byte|Precision of Edm.DateTimeOffset values for period start and end

## <a name="PeriodKindDate"></a>[PeriodKindDate](Org.OData.Temporal.V1.xml#L133): [PeriodKindType](#PeriodKindType)
Period start and end are of type Edm.Date

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L135)|Boolean|If `true`, the period end is included in the time period

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L141)
**Type:** String

The qualified name of an action in scope.
