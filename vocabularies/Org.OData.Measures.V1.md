# Measures Vocabulary
**Namespace: [Org.OData.Measures.V1](Org.OData.Measures.V1.xml)**

Terms describing monetary amounts and measured quantities


## Terms

Term|Type|Description
:---|:---|:----------
[ISOCurrency](./Org.OData.Measures.V1.xml#L70:~:text=Name="-,ISOCurrency,-")|String|<a name="ISOCurrency"></a>The currency for this monetary amount as an ISO 4217 currency code
[Scale](./Org.OData.Measures.V1.xml#L74:~:text=Name="-,Scale,-")|Byte|<a name="Scale"></a>The number of significant decimal places in the scale part (less than or equal to the number declared in the Scale facet)
[Unit](./Org.OData.Measures.V1.xml#L79:~:text=Name="-,Unit,-")|String|<a name="Unit"></a>The unit of measure for this measured quantity, e.g. cm for centimeters or % for percentages
[UNECEUnit](./Org.OData.Measures.V1.xml#L83:~:text=Name="-,UNECEUnit,-")|String|<a name="UNECEUnit"></a>The unit of measure for this measured quantity, according to the [UN/CEFACT Recommendation 20](http://tfig.unece.org/contents/recommendation-20.htm)
[DurationGranularity](./Org.OData.Measures.V1.xml#L87:~:text=Name="-,DurationGranularity,-")|[DurationGranularityType](#DurationGranularityType)|<a name="DurationGranularity"></a>The minimum granularity of duration values.<br>Absence of this annotation means a granularity of seconds with sub-seconds according to the Precision facet.

## <a name="DurationGranularityType"></a>[DurationGranularityType](./Org.OData.Measures.V1.xml#L92:~:text=Name="-,DurationGranularityType,-")
**Type:** String



Allowed Value|Description
:------------|:----------
[days](./Org.OData.Measures.V1.xml#L95:~:text=Name="-,days,-")|Duration in days, e.g. `P1D`
[hours](./Org.OData.Measures.V1.xml#L99:~:text=Name="-,hours,-")|Duration in days and hours, e.g. `P1DT23H`
[minutes](./Org.OData.Measures.V1.xml#L103:~:text=Name="-,minutes,-")|Duration in days, hours, and minutes, e.g. `P1DT23H59M`
