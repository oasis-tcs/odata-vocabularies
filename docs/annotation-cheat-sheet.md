# Annotation Cheat-Sheet

How to construct an annotation from a term definition, or re-engineer a term definition from an annotation example?

Here's how.

## Vocabularies

Terms are defined within a "vocabulary", which is just an EDMX document.

```xml
<edmx:Edmx Version="4.0" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx">
  <edmx:DataServices>

    <Schema Namespace="Vocab"

      xmlns="http://docs.oasis-open.org/odata/ns/edm">
```

To use a term in an annotation, the vocabulary of the term needs to be referenced and included.

```xml
<edmx:Edmx Version="4.0" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx">
  <edmx:Reference Uri="https://somewhere.org/vocab.xml">

    <edmx:Include Namespace="Vocab" />

  </edmx:Reference>
```

## Primitive Terms

If the term has a primitive type

```xml
<Term Name="StringTerm" Type="Edm.String" />
```

A constant annotation value is provided in a [corresponding attribute](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_ConstantExpression).

```xml
<Annotation Term="Vocab.StringTerm" String="annotation value" />
```

A dynamic annotation value can be provided for the same term using a [value path expression](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_ValuePath).

```xml
<Annotation Term="Vocab.StringTerm" Path="SomeStringProperty" />
```

The property referenced via the value path expression needs to have the same type as the term. A value path expression can always be used instead of a constant value, also in the more complicated cases below.

## Collections

If the term has a collection type

```xml
<Term Name="CollectionTerm" Type="Collection(Edm.Decimal)" />
```

the annotation value is provided as a [collection expression](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_Collection)

```xml
<Annotation Term="Vocab.CollectionTerm">
  <Collection>
    <Decimal>2.78</Decimal>
    <Decimal>3.14</Decimal>
  </Collection>
</Annotation>
```

## Structures

If the term has a structured type

```xml
<Term Name="StructuredTerm" Type="Vocab.Complex" />

<ComplexType Name="Complex">
  <Property Name="IntegerField" Type="Edm.Int32" />
</ComplexType>
```

the annotation value is provided as a [record expression](https://docs.oasis-open.org/odata/odata-csdl-xml/v4.01/odata-csdl-xml-v4.01.html#sec_Record)

```xml
<Annotation Term="Vocab.StructuredTerm">
  <Record>
    <PropertyValue Property="IntegerField" Int="42" />
  </Record>
</Annotation>
```

## Collection of Structures

Terms can also be typed as a collection of a structured type.

```xml
<Term Name="StructuredCollectionTerm" Type="Collection(Vocab.AnotherComplex)" />

<ComplexType Name="AnotherComplex">
  <Property Name="DateField" Type="Edm.Date" />
  <Property Name="TimeField" Type="Edm.TimeOfDay" DefaultValue="00:00:00" />
</ComplexType>
```

The annotation value is provided as a collection of records.

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

## Nested Structures and Collections

Properties of a structured type can themselves be structured or collections.

```xml
<Term Name="NestedTerm" Type="Collection(Vocab.YetAnotherComplex)" />

<ComplexType Name="YetAnotherComplex">
  <Property Name="StructuredField" Type="Vocab.Complex" />
  <Property Name="CollectionField" Type="Collection(Vocab.AnotherComplex)" />
</ComplexType>
```

The property value is provided as a record or collection.

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
