# Temporal Vocabulary
**Namespace: [Org.OData.Temporal.V1](Org.OData.Temporal.V1.xml)**

Terms to describe which data in a given entity model is time-dependent, and in which dimensions.

*This is a working draft that may incompatibly change any time.*


## Terms

Term|Type|Description
:---|:---|:----------
[TemporalSupport](Org.OData.Temporal.V1.xml#L72:~:text=Name="-,TemporalSupport,-")|[TemporalSupportType?](#TemporalSupportType)|<a name="TemporalSupport"></a>This entity set or navigation property supports temporal requests
[From](Org.OData.Temporal.V1.xml#L126:~:text=Name="-,From,-")|PrimitiveType|<a name="From"></a>Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or String with values min or now
[To](Org.OData.Temporal.V1.xml#L130:~:text=Name="-,To,-")|PrimitiveType|<a name="To"></a>Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or String with values now or max
[SystemFrom](Org.OData.Temporal.V1.xml#L134:~:text=Name="-,SystemFrom,-")|PrimitiveType|<a name="SystemFrom"></a>Read-only lower boundary (inclusive) of system time. DateTimeOffset value or String with value min
[SystemTo](Org.OData.Temporal.V1.xml#L138:~:text=Name="-,SystemTo,-")|PrimitiveType|<a name="SystemTo"></a>Read-only upper boundary (exclusive) of system time. DateTimeOffset value or String with value max
[History](Org.OData.Temporal.V1.xml#L145:~:text=Name="-,History,-")|\[EntityType\]|<a name="History"></a>A collection of time slices representing the history of the annotated entity<br>The time slices have the same entity type as the annotated entity and use the same select-expand projection.


## Actions

### <a name="UpdateObject"></a>[UpdateObject](Org.OData.Temporal.V1.xml#L153:~:text=Name="-,UpdateObject,-")

Updates all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L155:~:text=Name="-,timeslices,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L158:~:text=Name="-,ObjectKey,-")|EntityType|Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L162:~:text=Name="-,From,-")|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L165:~:text=Name="-,To,-")|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L168:~:text=Name="-,Values,-")|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
[&rarr;](Org.OData.Temporal.V1.xml#L172:~:text=Name="-,&rarr;,-")|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpsertObject"></a>[UpsertObject](Org.OData.Temporal.V1.xml#L178:~:text=Name="-,UpsertObject,-")

Upserts a temporal object in a given period of application time after splitting partially overlapping time slices by updating existing time slices in that period and creating new time slices to close gaps in that period

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L180:~:text=Name="-,timeslices,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L183:~:text=Name="-,ObjectKey,-")|EntityType|Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L187:~:text=Name="-,From,-")|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L190:~:text=Name="-,To,-")|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L193:~:text=Name="-,Values,-")|EntityType|Property values to insert or update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
[&rarr;](Org.OData.Temporal.V1.xml#L197:~:text=Name="-,&rarr;,-")|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="UpdateObjectFrom"></a>[UpdateObjectFrom](Org.OData.Temporal.V1.xml#L203:~:text=Name="-,UpdateObjectFrom,-")

Updates properties of time slices of a temporal object from a given point in time onwards and stops updating a property if its original value changes from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L205:~:text=Name="-,timeslices,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L208:~:text=Name="-,ObjectKey,-")|EntityType|Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L212:~:text=Name="-,From,-")|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L215:~:text=Name="-,To,-")|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[Values](Org.OData.Temporal.V1.xml#L218:~:text=Name="-,Values,-")|EntityType|Property values to update<br>Same entity type as binding parameter and return type, specify only values of non-key properties.
[&rarr;](Org.OData.Temporal.V1.xml#L222:~:text=Name="-,&rarr;,-")|\[EntityType\]|Modified time slices<br>Same entity type as binding parameter.


### <a name="SynchronizeObject"></a>[SynchronizeObject](Org.OData.Temporal.V1.xml#L228:~:text=Name="-,SynchronizeObject,-")

Synchronizes time slices of a temporal object to match the provided full application timeline

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L230:~:text=Name="-,timeslices,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L233:~:text=Name="-,ObjectKey,-")|EntityType|Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[Timeline](Org.OData.Temporal.V1.xml#L237:~:text=Name="-,Timeline,-")|\[EntityType\]|List of time slices covering the full timeline of the temporal object<br>Same entity type as the binding parameter.


### <a name="DeleteObject"></a>[DeleteObject](Org.OData.Temporal.V1.xml#L243:~:text=Name="-,DeleteObject,-")

Deletes all time slices of a temporal object in a given period of application time after splitting partially overlapping time slices

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L245:~:text=Name="-,timeslices,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L248:~:text=Name="-,ObjectKey,-")|EntityType|Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L252:~:text=Name="-,From,-")|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L255:~:text=Name="-,To,-")|PrimitiveType|Upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[&rarr;](Org.OData.Temporal.V1.xml#L258:~:text=Name="-,&rarr;,-")|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


### <a name="DeleteObjectFrom"></a>[DeleteObjectFrom](Org.OData.Temporal.V1.xml#L264:~:text=Name="-,DeleteObjectFrom,-")

Deletes time slices of a temporal object from a a given point in application time onwards and stops if a property changes its value from one time slice to the next

Parameter|Type|Description
:--------|:---|:----------
**[timeslices](Org.OData.Temporal.V1.xml#L266:~:text=Name="-,timeslices,-")**|\[EntityType\]|**Binding parameter:** Time slices to modify
[ObjectKey](Org.OData.Temporal.V1.xml#L269:~:text=Name="-,ObjectKey,-")|EntityType|Property values that identify a single temporal object<br>Select-expand projection of the same entity type as binding parameter, containing all and only properties reference in the [`ObjectKey`](#ObjectKey) of that entity type.
[From](Org.OData.Temporal.V1.xml#L273:~:text=Name="-,From,-")|PrimitiveType|Lower boundary (inclusive) of application time. Date or DateTimeOffset value, or string with value `min`
[To](Org.OData.Temporal.V1.xml#L276:~:text=Name="-,To,-")|PrimitiveType?|Optional upper boundary (exclusive) of application time. Date or DateTimeOffset value, or string with value `max`
[&rarr;](Org.OData.Temporal.V1.xml#L279:~:text=Name="-,&rarr;,-")|\[EntityType\]|Deleted time slices<br>Same entity type as binding parameter.


## <a name="TemporalSupportType"></a>[TemporalSupportType](Org.OData.Temporal.V1.xml#L78:~:text=Name="-,TemporalSupportType,-")


Property|Type|Description
:-------|:---|:----------
[ApplicationTime](Org.OData.Temporal.V1.xml#L79:~:text=Name="-,ApplicationTime,-")|[TimeDimensionType?](#TimeDimensionType)|Application time granularity
[SystemTime](Org.OData.Temporal.V1.xml#L82:~:text=Name="-,SystemTime,-")|[GranularityDateTimeOffset?](#GranularityDateTimeOffset)|System time granularity
[ObjectKey](Org.OData.Temporal.V1.xml#L85:~:text=Name="-,ObjectKey,-")|\[PropertyPath\]|The set of primitive properties that identify a temporal object<br>A temporal object is a set of facts whose change over application and/or system time is tracked by the service. The entities of the annotated entity set are time slices of temporal objects. A temporal object is uniquely identified within this set by the values of the specified object key properties. Object key properties follow the same rules as entity key properties. If no object key is specified, the object key is identical to the entity key.
[SupportedActions](Org.OData.Temporal.V1.xml#L89:~:text=Name="-,SupportedActions,-")|\[[QualifiedActionName](#QualifiedActionName)\]|List of supported temporal actions

## <a name="TimeDimensionType"></a>[*TimeDimensionType*](Org.OData.Temporal.V1.xml#L94:~:text=Name="-,TimeDimensionType,-")


**Derived Types:**
- [GranularityDateTimeOffset](#GranularityDateTimeOffset)
- [GranularityDate](#GranularityDate)

Property|Type|Description
:-------|:---|:----------
[SupportedQueries](Org.OData.Temporal.V1.xml#L95:~:text=Name="-,SupportedQueries,-")|[QueryType](#QueryType)|

## <a name="QualifiedActionName"></a>[QualifiedActionName](Org.OData.Temporal.V1.xml#L98:~:text=Name="-,QualifiedActionName,-")
**Type:** String

The qualified name of an action in scope.

*TODO: move this to Core, where we already have QualifiedTypeName and QualifiedTermName?*

## <a name="GranularityDateTimeOffset"></a>[GranularityDateTimeOffset](Org.OData.Temporal.V1.xml#L103:~:text=Name="-,GranularityDateTimeOffset,-"): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is DateTimeOffset

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L95:~:text=Name="-,SupportedQueries,-")|[QueryType](#QueryType)|
[Precision](Org.OData.Temporal.V1.xml#L105:~:text=Name="-,Precision,-")|Byte|Precision of Edm.DateTimeOffset values for granularity DateTimeOffset

## <a name="GranularityDate"></a>[GranularityDate](Org.OData.Temporal.V1.xml#L110:~:text=Name="-,GranularityDate,-"): [TimeDimensionType](#TimeDimensionType)
Granularity of this time dimension is Date

Property|Type|Description
:-------|:---|:----------
[*SupportedQueries*](Org.OData.Temporal.V1.xml#L95:~:text=Name="-,SupportedQueries,-")|[QueryType](#QueryType)|
[ClosedClosedPeriods](Org.OData.Temporal.V1.xml#L112:~:text=Name="-,ClosedClosedPeriods,-")|Boolean|Application-time periods are stored with closed-closed semantics<br>Use the temporal query option `$toInclusive` instead of `$to` for specifying the period end in time-series queries.

## <a name="QueryType"></a>[QueryType](Org.OData.Temporal.V1.xml#L118:~:text=Name="-,QueryType,-")


Flag Member|Value|Description
:-----|----:|:----------
[TimeTravel](Org.OData.Temporal.V1.xml#L119:~:text=Name="-,TimeTravel,-")|1|
[TimeSeries](Org.OData.Temporal.V1.xml#L120:~:text=Name="-,TimeSeries,-")|2|
