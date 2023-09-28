**Namespace: [interface.sample](Org.OData.Core.V1.IsInterface-equivalence.xml)**



The [implementation](#ReturnsOrderWeight)'s signature differs from the [interface](#SalesDocumentWeight)'s signature in the following allowed ways:
- Changed name of the binding parameter
- Specialized parameter type from `Edm.EntityType` to a concrete entity type
- Changed type name of the return type
- Changed name of the return type property that contains the weight, because this appears in the [`Weight`](#Weight) annotation
- Changed name of the return type property that contains the unit, because this appears in the `Measures.Unit` annotation
- Removed nullability of the return type property that contains the unit



## Terms

Term|Type|Description
:---|:---|:----------
[Weight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L26:~:text=<Term%20Name="-,Weight,-")|Decimal|<a name="Weight"></a>Numeric value of the weight of the instance


## Functions

<a name="SalesDocumentWeight"></a>
### [SalesDocumentWeight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L30:~:text=<Function%20Name="-,SalesDocumentWeight,-")

**Interface:**
Determines the total weight of the goods in a sales document

Parameter|Type|Description
:--------|:---|:----------
**[SalesDocument](./Org.OData.Core.V1.IsInterface-equivalence.xml#L33:~:text=<Function%20Name="-,SalesDocumentWeight,-")**|EntityType|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsInterface-equivalence.xml#L34:~:text=<Function%20Name="-,SalesDocumentWeight,-")|[SalesOrderWeightType](#SalesOrderWeightType)|


<a name="ReturnsOrderWeight"></a>
### [ReturnsOrderWeight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L45:~:text=<Function%20Name="-,ReturnsOrderWeight,-")

**Implements [SalesDocumentWeight](#SalesDocumentWeight)**


Parameter|Type|Description
:--------|:---|:----------
**[ReturnsOrder](./Org.OData.Core.V1.IsInterface-equivalence.xml#L47:~:text=<Function%20Name="-,ReturnsOrderWeight,-")**|[ReturnsOrderType](#ReturnsOrderType)|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsInterface-equivalence.xml#L48:~:text=<Function%20Name="-,ReturnsOrderWeight,-")|[QuantityUnitType](#QuantityUnitType)|


<a name="SalesOrderWeightType"></a>
## [SalesOrderWeightType](./Org.OData.Core.V1.IsInterface-equivalence.xml#L40:~:text=<ComplexType%20Name="-,SalesOrderWeightType,-")


Property|Type|Description
:-------|:---|:----------
[Weight](./Org.OData.Core.V1.IsInterface-equivalence.xml#L41:~:text=<ComplexType%20Name="-,SalesOrderWeightType,-")|Decimal|
[WeightUnit](./Org.OData.Core.V1.IsInterface-equivalence.xml#L42:~:text=<ComplexType%20Name="-,SalesOrderWeightType,-")|String?|

<a name="QuantityUnitType"></a>
## [QuantityUnitType](./Org.OData.Core.V1.IsInterface-equivalence.xml#L54:~:text=<ComplexType%20Name="-,QuantityUnitType,-")


Property|Type|Description
:-------|:---|:----------
[Quantity](./Org.OData.Core.V1.IsInterface-equivalence.xml#L55:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|Decimal|
[Unit](./Org.OData.Core.V1.IsInterface-equivalence.xml#L56:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|String|
