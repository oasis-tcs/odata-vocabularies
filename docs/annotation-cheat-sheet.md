# Annotation Cheat-Sheet

How to construct an annotation from a term definition, or re-engineer a term definition from an annotation example?

Here's how:

<style type="text/css">
th { background-color: white; text-align: left; }
td { background-color: white; vertical-align: top; }
</style>

<table>
<tr><th>Term Definition</th><th>Annotation Example</th></tr>

<tr>
<td>
Terms are defined within a "vocabulary", which is just an EDMX document:

```xml
<edmx:Edmx Version="4.0" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx">
  <edmx:DataServices>
    <Schema Namespace="Vocab" 
      xmlns="http://docs.oasis-open.org/odata/ns/edm">
```

</td>
<td>
To use a term in an annotation, the vocabulary of the term needs to be referenced:

```xml
<edmx:Edmx Version="4.0" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx">
  <edmx:Reference Uri="https://somewhere.org/vocab.xml">
    <edmx:Include Namespace="Vocab" />
  </edmx:Reference>
```

</td>
</tr>

<tr>
<td>
If the term has a primitive type,

```xml
<Term Name="StringTerm" Type="Edm.String" />
```

</td>
<td>
the annotation value is provided in a <a href="https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_ConstantExpression">corresponding attribute</a>:

```xml
<Annotation Term="Vocab.StringTerm" String="annotation value" />
```

</td>
</tr>

<tr>
<td>
If the term has a collection type,

```xml
<Term Name="CollectionTerm" Type="Collection(Edm.Decimal)" />
```

</td>
<td>
the annotation value is provided as a <a href="https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_Collection">collection expression</a>:

```xml
<Annotation Term="Vocab.CollectionTerm">
  <Collection>
    <Decimal>2.78</Decimal>
    <Decimal>3.14</Decimal>
  </Collection>
</Annotation>
```

</td>
</tr>

<tr>
<td>
If the term has a structured type,

```xml
<Term Name="StructuredTerm" Type="Vocab.Complex" />
<ComplexType Name="Complex">
  <Property Name="IntegerField" Type="Edm.Int32" />
</ComplexType>
```

</td>
<td>
the annotation value is provided as a <a href="https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_Record">record expression</a>:

```xml
<Annotation Term="Vocab.StructuredTerm">
  <Record>
    <PropertyValue Property="IntegerField" Int="42" />
  </Record>
</Annotation>
```

</td>
</tr>

<tr>
<td>
Terms can also have a collection of structured type,

```xml
<Term Name="StructuredCollectionTerm" Type="Collection(Vocab.AnotherComplex)" />

<ComplexType Name="AnotherComplex">
  <Property Name="DateField" Type="Edm.Date" />
  <Property Name="TimeField" Type="Edm.TimeOfDay" DefaultValue="00:00:00" />
</ComplexType>
```

</td>
<td>
and the annotation value is provided as a collection of records:

```xml
<Annotation Term="Vocab.StructuredCollectionTerm">
  <Collection>
    <Record>
      <PropertyValue Property="DateField" Date="2020-06-30" />
      <PropertyValue Property="TimeField" TimeOfDay="16:55:03" />
    </Record>
    <Record>
      <PropertyValue Property="DateField" Date="2020-07-01" />
    </Record>
    <Record>
      <PropertyValue Property="TimeField" TimeOfDay="23:59:59" />
    </Record>
  </Collection>
</Annotation>
```

Properties that are nullable or have a default value can be omitted.
</td>
</tr>

<tr>
<td>
Properties of a structured type can themselves be structured or collections,

```xml
<Term Name="NestedTerm" Type="Collection(Vocab.YetAnotherComplex)" />
<ComplexType Name="YetAnotherComplex">
  <Property Name="StructuredField" Type="Vocab.Complex" />




  <Property Name="CollectionField" Type="Collection(Vocab.AnotherComplex)" />
</ComplexType>
```

</td>
<td>
and the property value is provided as a record or collection:

```xml
<Annotation Term="Vocab.NestedTerm">
  <Record>
    <PropertyValue Property="StructuredField">
      <Record>
        <PropertyValue Property="IntegerField" Int="42" />
      </Record>
    </PropertyValue>
    <PropertyValue Property="CollectionField">
      <Collection>
        <Record>
          <PropertyValue Property="DateField" Date="2020-06-30" />
          <PropertyValue Property="TimeField" TimeOfDay="16:55:03" />
        </Record>
      </Collection>
    </PropertyValue>
  </Record>
</Annotation>
```

</td>
</tr>

</table>
