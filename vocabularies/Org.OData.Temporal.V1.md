# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms for describing time-dependent data

*This is a public review draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[ApplicationTimeSupport](./Org.OData.Temporal.V1.xml#L71:~:text=<Term%20Name="-,ApplicationTimeSupport,-")|[ApplicationTimeSupportType](#ApplicationTimeSupportType)|<a name="ApplicationTimeSupport"></a>This collection supports temporal requests


## Actions

### <a name="Update"></a>[Update](./Org.OData.Temporal.V1.xml#L175:~:text=<Action%20Name="-,Update,-")

Updates existing time slices with values from delta time slices whose object keys match and whose periods overlap

The update behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-update)
          `UPDATE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.

`deltaTimeslices` with non-matching object keys and non-overlapping sub-periods of `deltaTimeslices` are disregarded.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](./Org.OData.Temporal.V1.xml#L183:~:text=<Action%20Name="-,Update,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](./Org.OData.Temporal.V1.xml#L186:~:text=<Action%20Name="-,Update,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices whose property values are used to update the `timeslices` collection<br>The delta time slices need not contain all properties, but at least the boundary values of the period to change. An absent object key property matches any key property value. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](./Org.OData.Temporal.V1.xml#L194:~:text=<Action%20Name="-,Update,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Modified time slices


### <a name="Upsert"></a>[Upsert](./Org.OData.Temporal.V1.xml#L199:~:text=<Action%20Name="-,Upsert,-")

Like [`Update`](#Update), but additionally inserts those (sub-periods of) `deltaTimeslices` that `Update` disregards

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](./Org.OData.Temporal.V1.xml#L201:~:text=<Action%20Name="-,Upsert,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](./Org.OData.Temporal.V1.xml#L204:~:text=<Action%20Name="-,Upsert,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|New time slices to be merged into the `timeslices` collection<br>The delta time slices must contain all properties that are needed for insertion. New time slices are processed in the order of the collection, which especially matters if some of the specified change periods overlap.
[&rarr;](./Org.OData.Temporal.V1.xml#L211:~:text=<Action%20Name="-,Upsert,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Modified time slices


### <a name="Delete"></a>[Delete](./Org.OData.Temporal.V1.xml#L216:~:text=<Action%20Name="-,Delete,-")

Deletes (sub-periods of) existing time slices whose object keys match and whose periods overlap `deltaTimeslices`

The deletion behavior for a given object key is known from the [SQL statement](https://www.ibm.com/docs/en/db2oc?topic=statements-delete)
          `DELETE ... FOR PORTION OF BUSINESS_TIME ... WHERE ...`.
          The sub-period of an existing time slice that lies outside a given instance of `deltaTimeslices`
          is kept, effectively shortening the time slice.

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](./Org.OData.Temporal.V1.xml#L224:~:text=<Action%20Name="-,Delete,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[deltaTimeslices](./Org.OData.Temporal.V1.xml#L227:~:text=<Action%20Name="-,Delete,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Time slices to be deleted from the `timeslices` collection<br>The delta time slices contain only the boundary values of the period to delete and (parts of) the object key. An absent object key property matches any key property value.
[&rarr;](./Org.OData.Temporal.V1.xml#L234:~:text=<Action%20Name="-,Delete,-")|\[[TimesliceWithPeriod](#TimesliceWithPeriod)\]|Deleted (sub-periods of) time slices


## <a name="ApplicationTimeSupportType"></a>[ApplicationTimeSupportType](./Org.OData.Temporal.V1.xml#L78:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")


Property|Type|Description
:-------|:---|:----------
[UnitOfTime](./Org.OData.Temporal.V1.xml#L79:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")|[UnitOfTime](#UnitOfTime)|Unit of time and other properties of a time period
[Timeline](./Org.OData.Temporal.V1.xml#L82:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")|[Timeline](#Timeline)|Describes how the history and future of the data are represented
[SupportedActions](./Org.OData.Temporal.V1.xml#L85:~:text=<ComplexType%20Name="-,ApplicationTimeSupportType,-")|\[[QualifiedActionName](Org.OData.Core.V1.md#QualifiedActionName)\]|List of supported temporal actions

## <a name="UnitOfTime"></a>[*UnitOfTime*](./Org.OData.Temporal.V1.xml#L90:~:text=<ComplexType%20Name="-,UnitOfTime,-")
Unit of time and other properties of a time period

**Derived Types:**
- [UnitOfTimeDateTimeOffset](#UnitOfTimeDateTimeOffset)
- [UnitOfTimeDate](#UnitOfTimeDate)

## <a name="UnitOfTimeDateTimeOffset"></a>[UnitOfTimeDateTimeOffset](./Org.OData.Temporal.V1.xml#L94:~:text=<ComplexType%20Name="-,UnitOfTimeDateTimeOffset,-"): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[Precision](./Org.OData.Temporal.V1.xml#L96:~:text=<ComplexType%20Name="-,UnitOfTimeDateTimeOffset,-")|Byte|Precision of Edm.DateTimeOffset values for period start and end

## <a name="UnitOfTimeDate"></a>[UnitOfTimeDate](./Org.OData.Temporal.V1.xml#L101:~:text=<ComplexType%20Name="-,UnitOfTimeDate,-"): [UnitOfTime](#UnitOfTime)
Period start and end are of type Edm.Date

The period is a contiguous set of days and does not consider the time of the day.

Property|Type|Description
:-------|:---|:----------
[ClosedClosedPeriods](./Org.OData.Temporal.V1.xml#L104:~:text=<ComplexType%20Name="-,UnitOfTimeDate,-")|Boolean|If `true`, the period end is the last day in the period; if `false`, the period end is the first day after the period

## <a name="Timeline"></a>[*Timeline*](./Org.OData.Temporal.V1.xml#L110:~:text=<ComplexType%20Name="-,Timeline,-")
Describes how the history and future of the data are represented

**Derived Types:**
- [TimelineSnapshot](#TimelineSnapshot)
- [TimelineVisible](#TimelineVisible)

## <a name="TimelineSnapshot"></a>[TimelineSnapshot](./Org.OData.Temporal.V1.xml#L114:~:text=<ComplexType%20Name="-,TimelineSnapshot,-"): [Timeline](#Timeline)
Each OData entity maps each point in application time to an instance of the entity type

To address an entity in a resource path or path to related resources, a point in application time must be specified as described in [OData-Temporal, section 4.2.1].
          The addressed entity is then a snapshot of the data at the given point in time.
          When an action defined in this vocabulary is applied to a collection of this entity type,
          the entity key plays the role of object key.

## <a name="TimelineVisible"></a>[TimelineVisible](./Org.OData.Temporal.V1.xml#L124:~:text=<ComplexType%20Name="-,TimelineVisible,-"): [Timeline](#Timeline)
Each OData entity represents data during a period of application time

The temporal collection MUST NOT contain two entities with the same object key as defined by their `ObjectKey` properties
          and with overlapping application-time periods as defined by their `PeriodStart` and `PeriodEnd` properties.
          The temporal collection always contains all entities (with consecutive time periods) for a given object key.

Property|Type|Description
:-------|:---|:----------
[PeriodStart](./Org.OData.Temporal.V1.xml#L131:~:text=<ComplexType%20Name="-,TimelineVisible,-")|PropertyPath|Property containing lower boundary of a period
[PeriodEnd](./Org.OData.Temporal.V1.xml#L134:~:text=<ComplexType%20Name="-,TimelineVisible,-")|PropertyPath|Property containing upper boundary of a period<br>If an upper boundary property does not specify a default value, a default value of `max` is assumed.
[ObjectKey](./Org.OData.Temporal.V1.xml#L140:~:text=<ComplexType%20Name="-,TimelineVisible,-")|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose changes over application time are tracked by the service. The entities in the annotated collection belong to potentially multiple temporal objects, and each temporal object is uniquely identified by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, only a single temporal object belongs to the annotated collection.

## <a name="TimesliceWithPeriod"></a>[TimesliceWithPeriod](./Org.OData.Temporal.V1.xml#L146:~:text=<ComplexType%20Name="-,TimesliceWithPeriod,-")
Delta time slices with validity period

The properties `PeriodStart` and `PeriodEnd` MUST NOT be present
          if the entity type of the `Timeslice` already contains period start and end, that is,
          if the collection on which the action is invoked has visible timeline.
          If present, they MUST have the same type, either `Edm.Date` or `Edm.DateTimeOffset`,
          and they are interpreted according to the [`ApplicationTimeSupport/UnitOfTime`](#ApplicationTimeSupportType) of the collection.
          In particular, `ApplicationTimeSupport/UnitOfTime/ClosedClosedPeriods` governs whether a `PeriodEnd` of type `Edm.Date`
          is the last day in the period or the first day after the period.
          If `PeriodStart` is present and `PeriodEnd` is absent, a default value of `max` is assumed for `PeriodEnd`.

Property|Type|Description
:-------|:---|:----------
[PeriodStart](./Org.OData.Temporal.V1.xml#L158:~:text=<ComplexType%20Name="-,TimesliceWithPeriod,-")|PrimitiveType?|Lower boundary of the time slice
[PeriodEnd](./Org.OData.Temporal.V1.xml#L161:~:text=<ComplexType%20Name="-,TimesliceWithPeriod,-")|PrimitiveType?|Upper boundary of the time slice
[Timeslice](./Org.OData.Temporal.V1.xml#L164:~:text=<NavigationProperty%20Name="-,Timeslice,-")|EntityType|A time slice with the same entity type as the binding parameter of the action<br>When it appears in the return type of an action in this vocabulary, the time slice has the same entity set as the binding parameter value.
