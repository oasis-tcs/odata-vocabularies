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

The item level has no named entity set. It is annotated using `NavigationRestrictions` on header level and `UpdateRestrictions` on item level. The `NonUpdatableProperties` in the `UpdateRestrictions` annotations is favored over their commented-out counterpart in `NavigationRestrictions`, and the commented-out `Updatable` is even invalid, because the instance path to `canUpdate` is collection-valued.

```
"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items",
      "InsertRestrictions": {
        "Insertable": {"$Path": "canInsertItems"},
        "NonInsertableProperties": ["Items/uuid"]
      },
      "UpdateRestrictions": {
     // "Updatable": {"$Path": "Items/canUpdate"},
     // "NonUpdatableProperties": ["Items/uuid"],
        "FilterSegmentSupported": {"$Path": "canUpdateSubsetOfItems"}
      }
    }]
  },
},
"self.Container/Headers/Items": {
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}
```

If insertability was a boolean literal, the `InsertRestrictions` term on item level would also be favored over the `InsertRestrictions` property in `NavigationRestrictions` on header level.

```
"self.Container/Headers/Items": {
  "@Capabilities.InsertRestrictions": {
    "Insertable": true,
    "NonInsertableProperties": ["uuid"]
  }
}
```

The subitem level is annotated using `NavigationRestrictions` on item level and `UpdateRestrictions` on subitem level.

```
"self.Container/Headers/Items": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Subitems",
      "InsertRestrictions": {
        "Insertable": {"$Path": "canInsertSubitems"},
        "NonInsertableProperties": ["Subitems/uuid"]
      }
    }]
  }
},
"self.Container/Headers/Items/Subitems": {
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}
```
