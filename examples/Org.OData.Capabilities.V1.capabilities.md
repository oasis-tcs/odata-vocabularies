# Annotating capabilities

Consider a `Headers` entity set with contained entity sets `Headers(...)/Items` and `Headers(...)/Items(...)/Subitems`. Each entity type has a server-generated `uuid` and a `canUpdate` property. The header has an additional `canInsertItems` and the item has `canInsertSubitems` which govern insertability. Insertability of headers depends on the permissions contained in a `Permissions` singleton. The header also has a `canUpdateSubsetOfItems` which governs updatability with `/$filter(...)/$each` (the analogous thing on item level is omitted from this example).

The following annotations express insertability and updatability in terms of these properties. Deletability is analogous to updatability but omitted from this example.

For the header level, the entity set is annotated directly.

```jsonc
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

The item level has no named entity set. It is annotated using `NavigationRestrictions` on header level and `InsertRestrictions` and `UpdateRestrictions` on item level. When a property could be expressed either on the deeper item level or on the higher-up header level, the deeper level is generally preferred: For example, annotating the `Headers/Items` target with `UpdateRestrictions/NonUpdatableProperties` is favored over the commented-out annotation `NavigationRestrictions/UpdateRestrictions/NonUpdatableProperties` on the `Headers` target, and the commented-out `Updatable` is even invalid, because the instance path to `canUpdate` is collection-valued. But annotating `NavigationRestrictions/InsertRestrictions/Insertable` and `NavigationRestrictions/UpdateRestrictions/FilterSegmentSupported` on the `Headers` target cannot be avoided, because the instance paths to `canInsertItems` and `canUpdateSubsetOfItems` must be evaluated on header level.

```jsonc
"self.Container/Headers": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Items",
      "InsertRestrictions": {
        // DISCOURAGED: "NonInsertableProperties": ["Items/uuid"],
        "Insertable": {"$Path": "canInsertItems"}
      },
      "UpdateRestrictions": {
        // INVALID: "Updatable": {"$Path": "Items/canUpdate"},
        // DISCOURAGED: "NonUpdatableProperties": ["Items/uuid"],
        "FilterSegmentSupported": {"$Path": "canUpdateSubsetOfItems"}
      }
    }]
  }
},
"self.Container/Headers/Items": {
  "@Capabilities.InsertRestrictions": {
    "NonInsertableProperties": ["uuid"]
  },
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}
```

However, if insertability was static, the value would be a boolean literal and no path expressions would be required. In that case directly annotating the `Headers/Items` target with `InsertRestrictions/Insertable` would be favored over annotating the `Headers` target with `NavigationRestrictions/InsertRestrictions/Insertable`.

```jsonc
"self.Container/Headers/Items": {
  "@Capabilities.InsertRestrictions": {
    "Insertable": true,
    "NonInsertableProperties": ["uuid"]
  }
}
```

If limitations, such as tool restrictions, prevent annotation targets with navigation properties in them, like the `Headers/Items` target, then non-insertable and non-updatable properties on item and subitem level would be annotated on the `Headers` target:

```jsonc
"self.Container/Headers": {
  "@Capabilities.InsertRestrictions": {
    "NonInsertableProperties": ["uuid", "Items/uuid", "Items/Subitems/uuid"],
    "NonUpdatableProperties": ["uuid", "Items/uuid", "Items/Subitems/uuid"]
  }
}
```

If there are no such limitations, the subitem level is annotated using `NavigationRestrictions` on item level and `InsertRestrictions` and `UpdateRestrictions` on subitem level.

```jsonc
"self.Container/Headers/Items": {
  "@Capabilities.NavigationRestrictions": {
    "RestrictedProperties": [{
      "NavigationProperty": "Subitems",
      "InsertRestrictions": {
        "Insertable": {"$Path": "canInsertSubitems"}
      }
    }]
  }
},
"self.Container/Headers/Items/Subitems": {
  "@Capabilities.InsertRestrictions": {
    "NonInsertableProperties": ["uuid"]
  },
  "@Capabilities.UpdateRestrictions": {
    "Updatable": {"$Path": "canUpdate"},
    "NonUpdatableProperties": ["uuid"]
  }
}
```
