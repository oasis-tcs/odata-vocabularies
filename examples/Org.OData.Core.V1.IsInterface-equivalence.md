# interface Vocabulary
**Namespace: [interface.sample](Org.OData.Core.V1.IsInterface-equivalence.xml)**



The [implementation](#ReturnsWeight)'s signature differs from the [interface](#SalesDocumentWeight)'s signature in the following allowed ways:
- Changed name of the binding parameter
- Parameter type specialized from `Edm.EntityType` to a concrete entity type
- Optional parameter is omitted from the implementation
- Changed type name of the return type
- Changed name of the return type property that contains the weight, because this appears in a special `Weight` annotation
- Changed name of the return type property that contains the unit, because this appears in the `Measures.Unit` annotation.


## Terms

Term|Type|Description
:---|:---|:----------
Weight|Decimal|<a name="Weight"></a>Weight of the instance


## Functions

<a name="SalesDocumentWeight"></a>
### SalesDocumentWeight

**Interface**


Parameter|Type|Description
:--------|:---|:----------
**SalesDocument**|EntityType|**Binding parameter**
*IncludePackaging*|Boolean|*Optional parameter*
&rarr;|[SalesOrderWeightType](#SalesOrderWeightType)|


<a name="ReturnsWeight"></a>
### ReturnsWeight

**Implements [SalesDocumentWeight](#SalesDocumentWeight)**


Parameter|Type|Description
:--------|:---|:----------
**ReturnOrder**|[ReturnsType](#ReturnsType)|**Binding parameter**
&rarr;|[QuantityUnitType](#QuantityUnitType)|


<a name="SalesOrderWeightType"></a>
## SalesOrderWeightType


Property|Type|Description
:-------|:---|:----------
Weight|Decimal|
WeightUnit|String|

<a name="QuantityUnitType"></a>
## QuantityUnitType


Property|Type|Description
:-------|:---|:----------
Quantity|Decimal|
Unit|String|
