**Namespace: [interface.sample](Org.OData.Core.V1.IsInterface-equivalence.xml)**



The [implementation](#ReturnsOrderWeight)'s signature differs from the [interface](#SalesDocumentWeight)'s signature in the following allowed ways:
- Changed name of the binding parameter
- Specialized parameter type from `Edm.EntityType` to a concrete entity type
- Omitted optional parameter from the implementation
- Changed type name of the return type
- Changed name of the return type property that contains the weight, because this appears in the [`Weight`](#Weight) annotation
- Changed name of the return type property that contains the unit, because this appears in the `Measures.Unit` annotation


## Terms

Term|Type|Description
:---|:---|:----------
[Weight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L25:~:text=<Term%20Name="-,Weight,-")|Decimal|<a name="Weight"></a>Numeric value of the weight of the instance


## Functions

<a name="SalesDocumentWeight"></a>
### [SalesDocumentWeight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L29:~:text=<Function%20Name="-,SalesDocumentWeight,-")

**Interface:**
Determines the total weight of the goods in a sales document

Parameter|Type|Description
:--------|:---|:----------
**[SalesDocument](./Org.OData.Core.V1.IsInterface-equivalence.xml#L32:~:text=<Function%20Name="-,SalesDocumentWeight,-")**|EntityType|**Binding parameter**
*[IncludePackaging](./Org.OData.Core.V1.IsInterface-equivalence.xml#L33:~:text=<Function%20Name="-,SalesDocumentWeight,-")*|Boolean|*Optional parameter*
[&rarr;](./Org.OData.Core.V1.IsInterface-equivalence.xml#L38:~:text=<Function%20Name="-,SalesDocumentWeight,-")|[SalesOrderWeightType](#SalesOrderWeightType)|


<a name="ReturnsOrderWeight"></a>
### [ReturnsOrderWeight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L49:~:text=<Function%20Name="-,ReturnsOrderWeight,-")

**Implements [SalesDocumentWeight](#SalesDocumentWeight)**


Parameter|Type|Description
:--------|:---|:----------
**[ReturnsOrder](./Org.OData.Core.V1.IsInterface-equivalence.xml#L51:~:text=<Function%20Name="-,ReturnsOrderWeight,-")**|[ReturnsOrderType](#ReturnsOrderType)|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsInterface-equivalence.xml#L52:~:text=<Function%20Name="-,ReturnsOrderWeight,-")|[QuantityUnitType](#QuantityUnitType)|


<a name="SalesOrderWeightType"></a>
## [SalesOrderWeightType](./Org.OData.Core.V1.IsInterface-equivalence.xml#L42:~:text=<ComplexType%20Name="-,SalesOrderWeightType,-")


Property|Type|Description
:-------|:---|:----------
[Weight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L43:~:text=<ComplexType%20Name="-,SalesOrderWeightType,-")|Decimal|
[WeightUnit](./Org.OData.Core.V1.IsInterface-equivalence.xml#L46:~:text=<ComplexType%20Name="-,SalesOrderWeightType,-")|String|

<a name="QuantityUnitType"></a>
## [QuantityUnitType](./Org.OData.Core.V1.IsInterface-equivalence.xml#L56:~:text=<ComplexType%20Name="-,QuantityUnitType,-")


Property|Type|Description
:-------|:---|:----------
[Quantity](./Org.OData.Core.V1.IsInterface-equivalence.xml#L57:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|Decimal|
[Unit](./Org.OData.Core.V1.IsInterface-equivalence.xml#L60:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|String|
