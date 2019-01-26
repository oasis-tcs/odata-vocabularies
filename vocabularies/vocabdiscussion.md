# OData Permission term (Jira issue:1273)

- Design: Create a new term that will be applied as Restriction on Insert, Update, Read and Delete operations. Thought process is to represent user by defining scopes on that resource with available properties using that scope.

## key subsrate scenarios?

1. given a property, identify all the scopes that provide access to it.

2. given a scope, identify the resources and properties that can be accessed.  



## use cases:

- **case #1:** how does an app get access to a resource?
  
  Defined via the use of the restrictions.

- **case #2:** how does an app get access to a resource and all its properties?
  
  access restrictions defined on each operation (READ, INSERT, UPDATE, DEL) and navigation properties.
- **case #3:** how does an app get access to a resource and some of its properties?
  
  restrictions are computed based on scopes listed in the 
- **case #4:** how does CSDL define restrictions on a resource?
- **case #5:** how does CSDL define restrictions on a resource's properties?
  additional scopes needed, (still does it. mailbox settings is listed at the same depth as user.readwrite)

- **case #6:** non-accessible properties
- **case #7:** how does a CSDL provide description of the scopes used in the restrictions?
- **case #8:** how do we solve the issue of "least to move priv" permissions for graph?
  Maybe put in a number that signifies the position
- what if we make scheme name to be Enums?

```xml
<Record>
 <PropertyValue Property="Scope" String="Directory.ReadWrite.All" />
 <PropertyValue Property="Scheme" String="DelegatedWork Application" />
</Record>
```

## rules for tooling

- a permission that gives access to some properties vs a perm that gives access to more.
- number of entities that the permission can get access. More entities means a more powerful permission.
- does a permission gives access to more methods (read/write)

## roles?

- Question is if roles actually belong to a metadata?
  - how do we define roles? Maybe use a property that has roles defined at the container level.
  - if Roles are defined then they need to be nullable

  ```xml
  <PropertyValue Property="Role" String="Admin" />
  ```

## What about nullable scope name?

descriptions Define operation restrictions here..collection(operationRestrictions)

- name (action or function name) or the path.
- restrictions
- NP restrictions would also have op restrictions

## Navigation restrictions

- We do not need any additional properties defined on navigation restriction type because the CRUD restrictions should be enough to impose scope restrictions o the navigation property on a type.

## Open questions:

- would we ever call a same operation from two different paths resulting in the same type, with different permissions? can we call a method on users returned from /users, but not on users returned from /groups/1/members.
- Do we need to solve for allof/anyof type scenarios?

```device commands navigation property needs more investigation.
devicemanagement applies to resetpasscode.
sendmail -> Mail.Send
/invitations -> exists an action
/exportpersonaldata  
```