# Measures Vocabulary
**Namespace: [Org.OData.Measures.V1](Org.OData.Measures.V1.xml)**

Terms describing monetary amounts and measured quantities


## Terms

Term|Type|Description
:---|:---|:----------
[ISOCurrency](Org.OData.Measures.V1.xml#L73)|String!|<a name="ISOCurrency"></a>The currency for this monetary amount as an ISO 4217 currency code
[Scale](Org.OData.Measures.V1.xml#L77)|Byte!|<a name="Scale"></a>The number of significant decimal places in the scale part (less than or equal to the number declared in the Scale facet)
[Unit](Org.OData.Measures.V1.xml#L83)|String!|<a name="Unit"></a>The unit of measure for this measured quantity, e.g. cm for centimeters or % for percentages
[DurationGranularity](Org.OData.Measures.V1.xml#L88)|[DurationGranularityType](#DurationGranularityType)!|<a name="DurationGranularity"></a>The minimum granularity of duration values.<p>Absence of this annotation means a granularity of seconds with sub-seconds according to the Precision facet.</p>

## <a name="DurationGranularityType"></a>[DurationGranularityType](Org.OData.Measures.V1.xml#L94)
**Type:** String



Allowed Value|Description
:------------|:----------
[days](Org.OData.Measures.V1.xml#L97)|Duration in days, e.g. `P1D`
[hours](Org.OData.Measures.V1.xml#L101)|Duration in days and hours, e.g. `P1DT23H`
[minutes](Org.OData.Measures.V1.xml#L105)|Duration in days, hours, and minutes, e.g. `P1DT23H59M`
