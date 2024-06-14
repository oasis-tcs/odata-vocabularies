# Measures Vocabulary
**Namespace: [Org.OData.Measures.V1](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml)**

Terms describing monetary amounts and measured quantities


## Terms

Term|Type|Description
:---|:---|:----------
[ISOCurrency](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L70)|String|<a name="ISOCurrency"></a>The currency for this monetary amount as an ISO 4217 currency code
[Scale](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L74)|Byte|<a name="Scale"></a>The number of significant decimal places in the scale part (less than or equal to the number declared in the Scale facet)
[Unit](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L79)|String|<a name="Unit"></a>The unit of measure for this measured quantity, e.g. cm for centimeters or % for percentages
[UNECEUnit](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L83)|String|<a name="UNECEUnit"></a>The unit of measure for this measured quantity, according to the [UN/CEFACT Recommendation 20](http://tfig.unece.org/contents/recommendation-20.htm)
[DurationGranularity](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L87)|[DurationGranularityType](#DurationGranularityType)|<a name="DurationGranularity"></a>The minimum granularity of duration values.<br>Absence of this annotation means a granularity of seconds with sub-seconds according to the Precision facet.

<a name="DurationGranularityType"></a>
## [DurationGranularityType](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L92)
**Type:** String



Allowed Value|Description
:------------|:----------
[days](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L95)|Duration in days, e.g. `P1D`
[hours](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L99)|Duration in days and hours, e.g. `P1DT23H`
[minutes](https://github.com/oasis-tcs/odata-vocabularies/blob/main/vocabularies/Org.OData.Measures.V1.xml#L103)|Duration in days, hours, and minutes, e.g. `P1DT23H59M`
