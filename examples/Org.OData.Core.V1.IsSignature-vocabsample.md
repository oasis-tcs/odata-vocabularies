**Namespace: [signature.sample](Org.OData.Core.V1.IsSignature-vocabsample.xml)**



The [implementation](#ReturnsOrderWeight) differs from the [signature](#SalesDocumentWeight) in the following allowed ways:
- Specialized binding parameter type from `Edm.EntityType` to a concrete entity type  
  When displaying a sales order entity of the binding parameter type, the client can invoke the function
  and offer a tooltip containing weight information about the sales document.
  (Specialization would also be allowed for types of non-binding parameters.)
- Specialized return type from [`self.QuantityUnitType`](#QuantityUnitType) to [`self.ReturnsOrderWeightType`](#ReturnsOrderWeightType)  
  The client could display the additional return type property `PackagingWeight`
  according to the [instruction](#SalesDocumentWeightType) about additional weight properties,
  or could ignore it.


## Functions

<a name="SalesDocumentWeight"></a>
### [*SalesDocumentWeight*](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L27:~:text=<Function%20Name="-,SalesDocumentWeight,-")

**Signature only:**
Determines weight information about a sales document

Parameter|Type|Description
:--------|:---|:----------
**[SalesDocument](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L30:~:text=<Function%20Name="-,SalesDocumentWeight,-")**|EntityType|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L31:~:text=<Function%20Name="-,SalesDocumentWeight,-")|[SalesDocumentWeightType](#SalesDocumentWeightType)|


<a name="ReturnsOrderWeight"></a>
### [ReturnsOrderWeight](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L48:~:text=<Function%20Name="-,ReturnsOrderWeight,-")

**Implements [SalesDocumentWeight](#SalesDocumentWeight)**


Parameter|Type|Description
:--------|:---|:----------
**[SalesDocument](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L50:~:text=<Function%20Name="-,ReturnsOrderWeight,-")**|[ReturnsOrderType](#ReturnsOrderType)|**Binding parameter**
[&rarr;](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L51:~:text=<Function%20Name="-,ReturnsOrderWeight,-")|[ReturnsOrderWeightType](#ReturnsOrderWeightType)|


<a name="SalesDocumentWeightType"></a>
## [SalesDocumentWeightType](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L33:~:text=<ComplexType%20Name="-,SalesDocumentWeightType,-")
Weight of a sales order

Subtypes of this type may contain additional weight properties that use the same `Unit`
          and can be displayed next to the `GoodsWeight`.

**Derived Types:**
- [ReturnsOrderWeightType](#ReturnsOrderWeightType)

Property|Type|Description
:-------|:---|:----------
[GoodsWeight](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L39:~:text=<ComplexType%20Name="-,SalesDocumentWeightType,-")|Decimal|Weight of the goods being sold
[Unit](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L43:~:text=<ComplexType%20Name="-,SalesDocumentWeightType,-")|String|Unit of all weights

<a name="ReturnsOrderWeightType"></a>
## [ReturnsOrderWeightType](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L53:~:text=<ComplexType%20Name="-,ReturnsOrderWeightType,-"): [SalesDocumentWeightType](#SalesDocumentWeightType)


Property|Type|Description
:-------|:---|:----------
[*GoodsWeight*](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L39:~:text=<ComplexType%20Name="-,SalesDocumentWeightType,-")|Decimal|Weight of the goods being sold
[*Unit*](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L43:~:text=<ComplexType%20Name="-,SalesDocumentWeightType,-")|String|Unit of all weights
[PackagingWeight](./Org.OData.Core.V1.IsSignature-vocabsample.xml#L54:~:text=<ComplexType%20Name="-,ReturnsOrderWeightType,-")|Decimal|Weight of the packaging
