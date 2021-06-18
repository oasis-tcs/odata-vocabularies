# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L70)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L143)

Updates existing time slices with values from new time slices whose object keys match and whose periods overlap

The update behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-update)
          `UPDATE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.
          `newTimeslices` with non-matching object keys and non-overlapping sub-periods of `newTimeslices` are disregarded.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L150)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[newTimeslices](Org.OData.Temporal.V1.xml#L153)|\[EntityType\]|New time slices whose property values are used to update the `timeslices` collection<br>Same entity type as binding parameter. The new time slices need not contain all properties, but at least the boundary values of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L162)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L168)

Like [`Update`](#Update), but additionally inserts those (sub-periods of) `newTimeslices` that `Update` disregards

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L170)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[newTimeslices](Org.OData.Temporal.V1.xml#L173)|\[EntityType\]|New time slices to be merged into the `timeslices` collection<br>Same entity type as binding parameter. The new time slices must contain all properties that are needed for insertion. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L181)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateFrom"></a>[UpdateFrom](Org.OData.Temporal.V1.xml#L187)

Like [`Update`](#Update), but updates a given property from a given new time slice only in those contiguous time slices, starting with the earliest, that have same the original value for that property

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L189)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[newTimeslices](Org.OData.Temporal.V1.xml#L192)|\[EntityType\]|New time slices whose property values are used to update the `timeslices` collection<br>Same entity type as binding parameter. The new time slices need not contain all properties, but at least the lower boundary of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L201)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Synchronize"></a>[Synchronize](Org.OData.Temporal.V1.xml#L207)

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L209)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[Timeline](Org.OData.Temporal.V1.xml#L212)|\[EntityType\]|List of time slices covering the full timeline of the temporal object<br>Same entity type as the binding parameter.
*[ObjectKey](Org.OData.Temporal.V1.xml#L216)*|EntityType|*Optional parameter:* Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.


### <a name="Delete"></a>[Delete](Org.OData.Temporal.V1.xml#L225)

Deletes (sub-periods of) existing time slices whose object keys match and where periods overlap

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L227)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deletionTimeslices](Org.OData.Temporal.V1.xml#L230)|\[EntityType\]|Time slices to be deleted from the `timeslices` collection<br>Same entity type as binding parameter. The deletion time slices contain only the boundary values of the period to delete and (parts of) the object key. An absent object key property matches any key property value.
[&rarr;](Org.OData.Temporal.V1.xml#L238)|\[EntityType\]|Deleted (sub-periods of) time slices<br>Same entity type as binding parameter.


### <a name="DeleteFrom"></a>[DeleteFrom](Org.OData.Temporal.V1.xml#L244)

Like [`Delete`](#DeleteFrom), but deletes or shortens only those contiguous time slices, starting with the earliest, that have same the original value for all properties expect the period boundaries

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L246)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deletionTimeslices](Org.OData.Temporal.V1.xml#L249)|\[EntityType\]|Time slices to be deleted from the `timeslices` collection<br>Same entity type as binding parameter. The deletion time slices contain only the lower and optionally upper boundary values of the period to delete and (parts of) the object key. An absent object key property matches any key property value.
[&rarr;](Org.OData.Temporal.V1.xml#L257)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


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
[SupportedActions](Org.OData.Temporal.V1.xml#L135)|\[[QualifiedActionName](Org.OData.Core.V1.md#QualifiedActionName)\]|List of supported temporal actions
