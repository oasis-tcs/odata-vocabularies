# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](Org.OData.Temporal.V1.xml#L71)|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

### <a name="Update"></a>[Update](Org.OData.Temporal.V1.xml#L164)

Updates existing time slices with values from delta time slices whose object keys match and whose periods overlap

The update behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-update)
          `UPDATE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.
          `deltaTimeslices` with non-matching object keys and non-overlapping sub-periods of `deltaTimeslices` are disregarded.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L171)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](Org.OData.Temporal.V1.xml#L174)|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices whose property values are used to update the `timeslices` collection<br>The delta time slices need not contain all properties, but at least the boundary values of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L182)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Upsert"></a>[Upsert](Org.OData.Temporal.V1.xml#L188)

Like [`Update`](#Update), but additionally inserts those (sub-periods of) `deltaTimeslices` that `Update` disregards

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L190)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](Org.OData.Temporal.V1.xml#L193)|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices to be merged into the `timeslices` collection<br>The delta time slices must contain all properties that are needed for insertion. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L200)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateFrom"></a>[UpdateFrom](Org.OData.Temporal.V1.xml#L206)

Like [`Update`](#Update), but updates the properties that are present in a given delta time slice only in those contiguous time slices, starting with the earliest, that have same the original value for all these properties

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L208)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](Org.OData.Temporal.V1.xml#L211)|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices whose property values are used to update the `timeslices` collection<br>The delta time slices need not contain all properties, but at least the lower boundary of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](Org.OData.Temporal.V1.xml#L219)|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="Delete"></a>[Delete](Org.OData.Temporal.V1.xml#L225)

Deletes (sub-periods of) existing time slices whose object keys match and whose periods overlap `deltaTimeslices`

The deletion behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-delete)
          `DELETE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.
          The sub-period of an existing time slice that lies outside a given instance of `deltaTimeslices`
          is kept, effectively shortening the time slice.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L233)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](Org.OData.Temporal.V1.xml#L236)|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Time slices to be deleted from the `timeslices` collection<br>The delta time slices contain only the boundary values of the period to delete and (parts of) the object key. An absent object key property matches any key property value.
[&rarr;](Org.OData.Temporal.V1.xml#L243)|\[EntityType\]|Deleted (sub-periods of) time slices<br>Same entity type as binding parameter.


### <a name="DeleteFrom"></a>[DeleteFrom](Org.OData.Temporal.V1.xml#L249)

Like [`Delete`](#Delete), but deletes or shortens only those contiguous time slices, starting with the earliest, that have same the original value for all properties expect the period boundaries

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L251)**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](Org.OData.Temporal.V1.xml#L254)|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Time slices to be deleted from the `timeslices` collection<br>The delta time slices contain only the lower and optionally upper boundary values of the period to delete and (parts of) the object key. An absent object key property matches any key property value.
[&rarr;](Org.OData.Temporal.V1.xml#L261)|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


## <a name="ApplicationTimeSupportType"></a>[ApplicationTimeSupportType](Org.OData.Temporal.V1.xml#L78)


Property|Type|Description
:-------|:---|:----------
[UnitOfTime](Org.OData.Temporal.V1.xml#L79)|[UnitOfTime](#UnitOfTime)|Unit of time and other properties of a time period
[Timeline](Org.OData.Temporal.V1.xml#L82)|[Timeline](#Timeline)|Describes how the history and future of the data are represented
[SupportedActions](Org.OData.Temporal.V1.xml#L85)|\[[QualifiedActionName](Org.OData.Core.V1.md#QualifiedActionName)\]|List of supported temporal actions

## <a name="UnitOfTime"></a>[*UnitOfTime*](Org.OData.Temporal.V1.xml#L90)
Unit of time and other properties of a time period

**Derived Types:**
- [UnitOfTimeDateTimeOffset](#UnitOfTimeDateTimeOffset)
- [UnitOfTimeDate](#UnitOfTimeDate)

## <a name="UnitOfTimeDateTimeOffset"></a>[UnitOfTimeDateTimeOffset](Org.OData.Temporal.V1.xml#L94): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](Org.OData.Temporal.V1.xml#L96)|Byte|Precision of Edm.DateTimeOffset values for period start and end

## <a name="UnitOfTimeDate"></a>[UnitOfTimeDate](Org.OData.Temporal.V1.xml#L101): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.Date

The period is a contiguous set of days and does not consider the time of the day.

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L104)|Boolean|If `true`, the period end is the last day in the period; if `false`, the period end is the first day after the period

## <a name="Timeline"></a>[*Timeline*](Org.OData.Temporal.V1.xml#L110)
Describes how the history and future of the data are represented

**Derived Types:**
- [TimelineSnapshot](#TimelineSnapshot)
- [TimelineVisible](#TimelineVisible)

## <a name="TimelineSnapshot"></a>[TimelineSnapshot](Org.OData.Temporal.V1.xml#L114): [Timeline](#Timeline)
Each OData entity maps each point in application time to an instance of the entity type

To address an entity in a resource path or path to related resources, a point in application time must be specified as described in [OData-Temporal, section 4.2.1].
          The addressed entity is then a snapshot of the data at the given point in time.

## <a name="TimelineVisible"></a>[TimelineVisible](Org.OData.Temporal.V1.xml#L122): [Timeline](#Timeline)
Each OData entity represents data during a period of application time

The temporal collection MUST NOT contain two entities with the same object key as defined by their `ObjectKey` properties
          and with overlapping application-time periods as defined by their `PeriodStart` and `PeriodEnd` properties.
          The temporal collection always contains all entities (with consecutive time periods) for a given object key.

Property|Type|Description
:-------|:---|:----------
[PeriodStart](Org.OData.Temporal.V1.xml#L129)|PropertyPath|Property containing lower boundary of a period
[PeriodEnd](Org.OData.Temporal.V1.xml#L132)|PropertyPath|Property containing upper boundary of a period
[ObjectKey](Org.OData.Temporal.V1.xml#L135)|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose changes over application time are tracked by the service. The entities in the annotated collection belong to potentially multiple temporal objects, and each temporal object is uniquely identified by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, only a single temporal object belongs to the annotated collection.

## <a name="TimesliceWithPeriod"></a>[TimesliceWithPeriod](Org.OData.Temporal.V1.xml#L141)
Delta time slices with validity period in an action defined in this vocabulary

The properties `PeriodStart` and `PeriodEnd` MUST NOT be present
          if the entity type of the `Timeslice` already contains period start and end, that is,
          if the collection on which the action is invoked has visible timeline.
          If present, they MUST have the same type, either `Edm.Date` or `Edm.DateTimeOffset`,
          depending on the `ApplicationTimeSupport/UnitOfTime` of the collection.

Property|Type|Description
:-------|:---|:----------
[Timeslice](Org.OData.Temporal.V1.xml#L150)|EntityType|A time slice with the same entity type as the binding parameter of the action
[PeriodStart](Org.OData.Temporal.V1.xml#L153)|PrimitiveType?|Lower boundary of the time slice
[PeriodEnd](Org.OData.Temporal.V1.xml#L156)|PrimitiveType?|Upper boundary of the time slice
