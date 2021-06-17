# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L70)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L150)

Updates existing time slices with values from new time slices whose object keys match and whose periods overlap

The update behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-update)
          `UPDATE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.
          `newTimeslices` with non-matching object keys and non-overlapping sub-periods of `newTimeslices` are disregarded.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L157)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[newTimeslices](Org.OData.Temporal.V1.xml#L160)|\[EntityType\]|New time slices whose property values are used to update the `timeslices` collection<br>Same entity type as binding parameter. The new time slices need not contain all properties, but at least the boundary values of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L169)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L175)

Like `Update`, but additionally inserts those (sub-periods of) `newTimeslices` that `Update` disregards

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L177)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[newTimeslices](Org.OData.Temporal.V1.xml#L180)|\[EntityType\]|New time slices to be merged into the `timeslices` collection<br>Same entity type as binding parameter. The new time slices must contain all properties that are needed for insertion. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
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
[UnitOfTime](Org.OData.Temporal.V1.xml#L78)|[UnitOfTime](#UnitOfTime)|Unit of time and other properties of a time period
[DataHistory](Org.OData.Temporal.V1.xml#L81)|[DataHistory](#DataHistory)|Describes how the data history is represented

## <a name="UnitOfTime"></a>[*UnitOfTime*](Org.OData.Temporal.V1.xml#L86)
Unit of time and other properties of a time period

**Derived Types:**
- [UnitOfTimeDateTimeOffset](#UnitOfTimeDateTimeOffset)
- [UnitOfTimeDate](#UnitOfTimeDate)

## <a name="UnitOfTimeDateTimeOffset"></a>[UnitOfTimeDateTimeOffset](Org.OData.Temporal.V1.xml#L90): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](Org.OData.Temporal.V1.xml#L92)|Byte|Precision of Edm.DateTimeOffset values for period start and end

## <a name="UnitOfTimeDate"></a>[UnitOfTimeDate](Org.OData.Temporal.V1.xml#L97): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.Date

The period is a contiguous set of days and does not consider the time of the day.

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L100)|Boolean|If `true`, the period end is the last day in the period; if `false`, the period end is the first day after the period

## <a name="DataHistory"></a>[*DataHistory*](Org.OData.Temporal.V1.xml#L106)
Describes how the data history is represented

**Derived Types:**
- [DataHistorySnapshot](#DataHistorySnapshot)
- [DataHistoryVisible](#DataHistoryVisible)

## <a name="DataHistorySnapshot"></a>[DataHistorySnapshot](Org.OData.Temporal.V1.xml#L110): [DataHistory](#DataHistory)
Each OData entity represents a snapshot of data at a point in application time that is the same for all entities in the collection

The point in application time is defined by the `$at` clause of a request; default is the current point in time.

## <a name="DataHistoryVisible"></a>[DataHistoryVisible](Org.OData.Temporal.V1.xml#L117): [DataHistory](#DataHistory)
Each OData entity represents data during a period of application time; it is called a *time slice*

The temporal collection MUST NOT contain two entities with the same object key as defined by their `ObjectKey` properties
          and with overlapping application-time periods as defined by their `TimeSliceStart` and `TimeSliceEnd` properties.
          The temporal collection always contains all entities (with consecutive time periods) for a given object key.
          The actions defined in this vocabulary MUST be invoked on collections with visible data history only.

Property|Type|Description
:-------|:---|:----------
[TimeSliceStart](Org.OData.Temporal.V1.xml#L125)|PropertyPath|Property containing lower boundary of a time slice
[TimeSliceEnd](Org.OData.Temporal.V1.xml#L128)|PropertyPath|Property containing upper boundary of a time slice
[ObjectKey](Org.OData.Temporal.V1.xml#L131)|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose changes over application time are tracked by the service. The entities in the annotated collection belong to potentially multiple temporal objects, and each temporal object is uniquely identified by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, only a single temporal object belongs to the annotated collection.
[SupportedActions](Org.OData.Temporal.V1.xml#L135)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L142)
**Type:** String

The qualified name of an action in scope.
