# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L70)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L147)

Updates existing time slices with values from new time slices whose [`ApplicationTimeSupport/ObjectKey`](#ApplicationTimeSupportType)s match and whose intervals overlap

The update behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-update)
          `UPDATE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L153)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[newTimeslices](Org.OData.Temporal.V1.xml#L156)|\[EntityType\]|New time slices whose property values are used to update the `timeslices` collection<br>Same entity type as binding parameter. The new time slices need not contain all properties, but at least the boundary values of the interval to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change intervals overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L165)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L171)

Upserts a temporal object in a given period of application time after splitting partially overlapping time slices by updating existing time slices in that period and creating new time slices to close gaps in that period

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L173)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L176)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L179)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L182)|EntityType|Property values to insert or update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L186)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L193)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateFrom"></a>[UpdateFrom](Org.OData.Temporal.V1.xml#L199)

Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L201)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L204)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L207)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L210)|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
*[ObjectKey](Org.OData.Temporal.V1.xml#L214)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L221)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Synchronize"></a>[Synchronize](Org.OData.Temporal.V1.xml#L227)

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L229)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[Timeline](Org.OData.Temporal.V1.xml#L232)|\[EntityType\]|List of time slices covering the full timeline of the temporal object<br>Same entity type as the binding parameter.
*[ObjectKey](Org.OData.Temporal.V1.xml#L236)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.


### <a name="Delete"></a>[Delete](Org.OData.Temporal.V1.xml#L245)

Deletes all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L247)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L250)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L253)|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L256)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L263)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


### <a name="DeleteFrom"></a>[DeleteFrom](Org.OData.Temporal.V1.xml#L269)

Deletes time slices of a temporal object from a a given point in application time onwards and stops if a property changes its value from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L271)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[From](Org.OData.Temporal.V1.xml#L274)|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L277)|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
*[ObjectKey](Org.OData.Temporal.V1.xml#L280)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[&rarr;](Org.OData.Temporal.V1.xml#L287)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


## <a name="ApplicationTimeSupportType"></a>[ApplicationTimeSupportType](Org.OData.Temporal.V1.xml#L77)


Property|Type|Description
:-------|:---|:----------
[DataHistory](Org.OData.Temporal.V1.xml#L78)|[DataHistory](#DataHistory)|Describes how the data history is represented
[UnitOfTime](Org.OData.Temporal.V1.xml#L81)|[UnitOfTime](#UnitOfTime)|Unit of time and other properties of a time period

## <a name="DataHistory"></a>[*DataHistory*](Org.OData.Temporal.V1.xml#L86)
Describes how the data history is represented

**Derived Types:**
- [DataHistorySnapshot](#DataHistorySnapshot)
- [DataHistoryVisible](#DataHistoryVisible)

## <a name="DataHistorySnapshot"></a>[DataHistorySnapshot](Org.OData.Temporal.V1.xml#L90): [DataHistory](#DataHistory)
Each OData entity represents a snapshot of data at a point in application time that is the same for all entities in the collection

The point in application time is defined by the `$at` clause of a request; default is the current point in time.

## <a name="DataHistoryVisible"></a>[DataHistoryVisible](Org.OData.Temporal.V1.xml#L97): [DataHistory](#DataHistory)
Each OData entity represents data during a period of application time; it is called a *time slice*

A temporal collection of this kind MUST NOT contain two entities with the same
          `ObjectKey` whose application-time periods defined by their `TimeSliceStart` and `TimeSliceEnd` properties overlap;
          and it always contains all entities (with consecutive time periods) for a given object key.
          A collection MUST be of this kind if an action defined in this vocabulary is invoked on it.

Property|Type|Description
:-------|:---|:----------
[TimeSliceStart](Org.OData.Temporal.V1.xml#L105)|PropertyPath|Property containing lower boundary of a time slice
[TimeSliceEnd](Org.OData.Temporal.V1.xml#L108)|PropertyPath|Property containing upper boundary of a time slice
[ObjectKey](Org.OData.Temporal.V1.xml#L111)|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose changes over application time are tracked by the service. The entities in the annotated collection belong to potentially multiple temporal objects, and each temporal object is uniquely identified by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, only a single temporal object belongs to the annotated collection.
[SupportedActions](Org.OData.Temporal.V1.xml#L115)|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="UnitOfTime"></a>[*UnitOfTime*](Org.OData.Temporal.V1.xml#L120)
Unit of time and other properties of a time period

**Derived Types:**
- [UnitOfTimeDateTimeOffset](#UnitOfTimeDateTimeOffset)
- [UnitOfTimeDate](#UnitOfTimeDate)

## <a name="UnitOfTimeDateTimeOffset"></a>[UnitOfTimeDateTimeOffset](Org.OData.Temporal.V1.xml#L124): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](Org.OData.Temporal.V1.xml#L126)|Byte|Precision of Edm.DateTimeOffset values for period start and end

## <a name="UnitOfTimeDate"></a>[UnitOfTimeDate](Org.OData.Temporal.V1.xml#L131): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.Date

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L133)|Boolean|If `true`, the period end is included in the time period

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L139)
**Type:** String

The qualified name of an action in scope.
