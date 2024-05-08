# Annotating capabilities

Consider a `Headers` entity set with contained entity sets `Headers(...)/Items` and `Headers(...)/Items(...)/Subitems`. Each entity type has a server-generated `uuid` and a `canUpdate` property. The header has an additional `canInsertItems` and the item has `canInsertSubitems` which govern insertability. Insertability of headers depends on the permissions contained in a `Permissions` singleton. The header also has a `canUpdateSubsetOfItems` which governs updatability with `/$filter(...)/$each` (the analogous thing on item level is omitted from this example).

The following annotations express insertability and updatability in terms of these properties. Deletability is analogous to updatability but omitted from this example.

## Header Level

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

## Item Level

The item level has no named entity set. It is annotated using `NavigationRestrictions` on header level and `InsertRestrictions` and `UpdateRestrictions` on item level. When a property could be expressed either on the deeper item level or on the higher-up header level, the deeper level is generally preferred: For example, the `NonUpdatableProperties` property in the deeper `UpdateRestrictions` is favored over its commented-out namesake in the higher-up `NavigationRestrictions`, and the commented-out `Updatable` is even invalid, because the instance path to `canUpdate` is collection-valued. But the higher-up `InsertRestrictions/Insertable` and `UpdateRestrictions/FilterSegmentSupported` cannot be avoided, because the instance paths to `canInsertItems` and `canUpdateSubsetOfItems` must be evaluated on header level.

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

However, if insertability was static, the value would be a boolean literal and no path expressions would be required. In that case the deeper `InsertRestrictions/Insertable` term would be favored over the higher-up one.

```jsonc
"self.Container/Headers/Items": {
  "@Capabilities.InsertRestrictions": {
    "Insertable": true,
    "NonInsertableProperties": ["uuid"]
  }
}
```

Non-insertable and non-updatable properties on item and subitem level can alternatively be annotated on the header if annotating on the deeper level is not possible, for example due to tool restrictions:

```jsonc
"self.Container/Headers": {
  "@Capabilities.InsertRestrictions": {
    "NonInsertableProperties": ["uuid", "Items/uuid"],
    "NonUpdatableProperties": ["uuid", "Items/uuid"]
  }
}
```

## Subitem Level

The subitem level is annotated using `NavigationRestrictions` on item level and `InsertRestrictions` and `UpdateRestrictions` on subitem level.

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
