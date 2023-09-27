**Namespace: [interface.sample](Org.OData.Core.V1.IsInterface-equivalence.xml)**



The [implementation](#ReturnsOrderWeight)'s signature differs from the [interface](#SalesDocumentWeight)'s signature in the following allowed ways:
- Changed name of the binding parameter
- Specialized parameter type from `Edm.EntityType` to a concrete entity type
- Omitted optional parameter from the implementation
- Changed type name of the return type
- Changed name of the return type property that contains the weight, because this appears in the [`Weight`](#Weight) annotation
- Changed name of the return type property that contains the unit, because this appears in the `Measures.Unit` annotation.


## Terms

Term|Type|Description
:---|:---|:----------
Weight|Decimal|<a name="Weight"></a>Numeric value of the weight of the instance


## Functions

<a name="SalesDocumentWeight"></a>
### SalesDocumentWeight

**Interface:**
Determines the total weight of the goods in a sales document

Parameter|Type|Description
:--------|:---|:----------
**SalesDocument**|EntityType|**Binding parameter**
*IncludePackaging*|Boolean|*Optional parameter*
&rarr;|[SalesOrderWeightType](#SalesOrderWeightType)|


<a name="ReturnsOrderWeight"></a>
### ReturnsOrderWeight

**Implements [SalesDocumentWeight](#SalesDocumentWeight)**


Parameter|Type|Description
:--------|:---|:----------
**ReturnsOrder**|[ReturnsOrderType](#ReturnsOrderType)|**Binding parameter**
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
