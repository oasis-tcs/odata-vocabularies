# Annotating capabilities

Consider a `Headers` entity set with contained entity sets `Headers(...)/Items` and `Headers(...)/Items(...)/Subitems`. Each entity type has a server-generated `uuid` and a `canUpdate` property. The header has an additional `canInsertItems` and the item has `canInsertSubitems` which govern insertability. Headers can always be inserted. The following annotations express insertability and updatability in terms of these properties.

For the header level, the entity set is annotated directly.

```
"self.Container/Headers": {
  "@Capabilities.InsertRestrictions": {
    "Insertable": true,
    "NonInsertableProperties": ["uuid"]
  },
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}
```

The item level has no named entity set. It can be annotated

<table><tr>
  <td>using <code>NavigationRestrictions</code> on header level</td>
  <td>using <code>NavigationInsertRestrictions</code> on header level and <code>UpdateRestrictions</code> on item level</td>
</tr>
<tr>
  <td>Path evaluation starts at the header</td>
  <td>Path evaluation starts at the header</td>
</tr>
<tr><td><pre>"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items",
      "InsertRestrictions": {
        "Insertable": {"$Path": "canInsertItems"},
        "NonInsertableProperties": ["Items/uuid"]
      },</pre></td>
<td><pre>"self.Container/Headers": {
  "@Capabilities.NavigationInsertRestrictions": [{
    "NavigationProperty": "Items",
    "Insertable": {"$Path": "canInsertItems"},
    "NonInsertableProperties": ["Items/uuid"]
  }]
},</pre></td></tr>
<tr>
  <td>Path evaluation starts at the header</td>
  <td>Path evaluation starts at the item. The instance path to the <code>canUpdate</code> property is collection-valued and therefore invalid.</td>
</tr>
<tr><td><pre>      "UpdateRestrictions": {
        "Updatable": {"$Path": "Items/canUpdate"},
        "NonUpdatableProperties": ["Items/uuid"]
      }
    }
  }
}</pre></td>
<td><pre>"self.Container/Headers/Items": {
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}</pre></td></tr>
</table>

Likewise, the subitem level can be annotated

<table><tr>
  <td>using <code>NavigationRestrictions</code> on header level. Again, the instance paths are invalid.</td>
  <td>using <code>NavigationInsertRestrictions</code> on item level and <code>UpdateRestrictions</code> on subitem level</td>
</tr>
<tr>
  <td>Path evaluation starts at the header</td>
  <td>Path evaluation starts at the item</td>
</tr>
<tr><td><pre>"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items/Subitems",
      "InsertRestrictions": {
        "Insertable": {"$Path": "Items/canInsertSubitems"},
        "NonInsertableProperties": ["Items/Subitems/uuid"]
      },</pre></td>
<td><pre>"self.Container/Headers/Items": {
  "@Capabilities.NavigationInsertRestrictions": [{
    "NavigationProperty": "Subitems",
    "Insertable": {"$Path": "canInsertSubitems"},
    "NonInsertableProperties": ["Subitems/uuid"]
  }]
},</pre></td></tr>
<tr>
  <td>Path evaluation starts at the header</td>
  <td>Path evaluation starts at the subitem</td>
</tr>
<tr><td><pre>      "UpdateRestrictions": {
        "Updatable": {"$Path": "Items/Subitems/canUpdate"},
        "NonUpdatableProperties": ["Items/Subitems/uuid"]
      }
    }]
  }
}</pre></td>
<td><pre>"self.Container/Headers/Items/Subitems": {
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}</pre></td></tr>
</table>
