**Namespace: [signature.sample](Org.OData.Core.V1.IsSignature-equivalence.xml)**



The [implementation](#ReturnsOrderWeight) differs from the [signature](#SalesDocumentWeight) in the following allowed ways:
- Specialized occurrences of type `Edm.EntityType` to a concrete entity type
- Specialized return type from [`self.QuantityUnitType`](#QuantityUnitType) to [`self.ReturnsOrderWeightType`](#ReturnsOrderWeightType)
  - Removed nullability of return type property `Unit`
  - Additional return type property `PackagingWeight` (could be ignored by the client)


## Functions

<a name="SalesDocumentWeight"></a>
### [*SalesDocumentWeight*](./Org.OData.Core.V1.IsSignature-equivalence.xml#L23:~:text=<Function%20Name="-,SalesDocumentWeight,-")

**Signature only:**
Determines the total weight of the goods in a sales document

Parameter|Type|Description
:--------|:---|:----------
**[SalesDocument](./Org.OData.Core.V1.IsSignature-equivalence.xml#L26:~:text=<Function%20Name="-,SalesDocumentWeight,-")**|EntityType|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsSignature-equivalence.xml#L27:~:text=<Function%20Name="-,SalesDocumentWeight,-")|[QuantityUnitType](#QuantityUnitType)|


<a name="ReturnsOrderWeight"></a>
### [ReturnsOrderWeight](./Org.OData.Core.V1.IsSignature-equivalence.xml#L36:~:text=<Function%20Name="-,ReturnsOrderWeight,-")

**Implements [SalesDocumentWeight](#SalesDocumentWeight)**


Parameter|Type|Description
:--------|:---|:----------
**[SalesDocument](./Org.OData.Core.V1.IsSignature-equivalence.xml#L38:~:text=<Function%20Name="-,ReturnsOrderWeight,-")**|[ReturnsOrderType](#ReturnsOrderType)|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsSignature-equivalence.xml#L39:~:text=<Function%20Name="-,ReturnsOrderWeight,-")|[ReturnsOrderWeightType](#ReturnsOrderWeightType)|


<a name="QuantityUnitType"></a>
## [QuantityUnitType](./Org.OData.Core.V1.IsSignature-equivalence.xml#L29:~:text=<ComplexType%20Name="-,QuantityUnitType,-")


**Derived Types:**
- [ReturnsOrderWeightType](#ReturnsOrderWeightType)

Property|Type|Description
:-------|:---|:----------
[Quantity](./Org.OData.Core.V1.IsSignature-equivalence.xml#L30:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|Decimal|
[Unit](./Org.OData.Core.V1.IsSignature-equivalence.xml#L33:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|String?|

<a name="ReturnsOrderWeightType"></a>
## [ReturnsOrderWeightType](./Org.OData.Core.V1.IsSignature-equivalence.xml#L41:~:text=<ComplexType%20Name="-,ReturnsOrderWeightType,-"): [QuantityUnitType](#QuantityUnitType)


Property|Type|Description
:-------|:---|:----------
[*Quantity*](./Org.OData.Core.V1.IsSignature-equivalence.xml#L30:~:text=<ComplexType%20Name="-,QuantityUnitType,-")|Decimal|
[Unit](./Org.OData.Core.V1.IsSignature-equivalence.xml#L42:~:text=<ComplexType%20Name="-,ReturnsOrderWeightType,-")|String|
[PackagingWeight](./Org.OData.Core.V1.IsSignature-equivalence.xml#L43:~:text=<ComplexType%20Name="-,ReturnsOrderWeightType,-")|Decimal|
