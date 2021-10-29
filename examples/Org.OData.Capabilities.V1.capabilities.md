# Annotating capabilities

Consider a `Headers` entity set with contained entity sets `Headers(...)/Items` and `Headers(...)/Items(...)/Subitems`. Each entity type has a server-generated `uuid` and a `canUpdate` property. The header has an additional `canInsertItems` and the item has `canInsertSubitems` which govern insertability. Insertability of headers depends on the permissions contained in a `Permissions` singleton. The header also has a `canUpdateSubsetOfItems` which governs updatability with `/$filter(...)/$each` (the analogous thing on item level is omitted from this example).

The following annotations express insertability and updatability in terms of these properties. Deletability is analogous to updatability but omitted from this example.

For the header level, the entity set is annotated directly.

```
"self.Container/Headers": {
  "@Capabilities.InsertRestrictions": {
    "Insertable": {"$Path": "/self.Container/Permissions/canInsertHeaders"},
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
  <td>using <code>NavigationRestrictions</code> on header level, if updatability is a boolean literal. (The commented-out instance paths are invalid.)</td>
  <td>using <code>NavigationRestrictions</code> on header level and <code>UpdateRestrictions</code> on item level</td>
</tr>
<tr>
  <td>Path evaluation starts at the header</td>
  <td><em>same as left column</em></td>
</tr>
<tr><td><pre>"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items",
      "InsertRestrictions": {
        "Insertable": {"$Path": "canInsertItems"},
        "NonInsertableProperties": ["Items/uuid"]
      },
      "UpdateRestrictions": {
        "FilterSegmentSupported":
          {"$Path": "canUpdateSubsetOfItems"}
      }
    }]
  }</pre></td>
<td><em>same as left column</em></td></tr>
<tr>
  <td>Path evaluation starts at the header. The commented-out instance path to the <code>canUpdate</code> property is collection-valued and therefore invalid.</td>
  <td>Path evaluation starts at the item. The instance path to the <code>canUpdate</code> property is valid.</td>
</tr>
<tr><td><pre>"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items",
      "UpdateRestrictions": {
        "Updatable": true,
     // "Invalid-Updatable":
     //   {"$Path": "Items/canUpdate"},
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
  <td>using <code>NavigationRestrictions</code> on header level, if boolean values are given as literals. (Again, the commented-out instance paths are invalid.)</td>
  <td>using <code>NavigationRestrictions</code> on item level and <code>UpdateRestrictions</code> on subitem level</td>
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
        "Insertable": true,
     // "Invalid-Insertable":
     //   {"$Path": "Items/canInsertSubitems"},
        "NonInsertableProperties": ["Items/Subitems/uuid"]
      }
    }]
  }
}</pre></td>
<td><pre>"self.Container/Headers/Items": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Subitems",
      "Insertable": {"$Path": "canInsertSubitems"},
      "NonInsertableProperties": ["Subitems/uuid"]
    }]
  }
}</pre></td></tr>
<tr>
  <td>Path evaluation starts at the header</td>
  <td>Path evaluation starts at the subitem</td>
</tr>
<tr><td><pre>"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items/Subitems",
      "UpdateRestrictions": {
        "Updatable": true,
     // "Invalid-Updatable":
     //   {"$Path": "Items/Subitems/canUpdate"},
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
