	<!-- Do we need to solve for allof/anyof type scenarios -->
	<!-- Navigation restrictions sample is needed -->
	<!-- Thought process is to represent user by defining scopes on that resource with available properties using that scope.
		Alternatively, we could list the properties and then all the scopes that can get access to that property. 

-->
	<!-- device commands navigation property needs more investigation. -->
	<!-- devicemanagement applies to resetpasscode. -->
	<!--  sendmail -> Mail.Send -->
	<!-- /invitations -> exists an action -->
	<!-- /exportpersonaldata  -->


what does substrate want?
	(a) given a property, identify the scopes required for it.
	(b) given a scope, identify the resources and properties that can be accessed.  -->

	issue: 1273
	use cases:
	case#1: how does an app get access to a resource?
	- Defined via the use of the restrictions.
	case#2: how does an app get access to a resource and all its properties?
	- access restrictions defined on each operation (READ, INSERT, UPDATE, DEL) and navigation properties.
	case#3: how does an app get access to a resource and some of its properties?
	- restrictions are computed based on scopes listed in the 
	how does CSDL define restrictions on a resource?
	how does CSDL define restrictions on a resource's properties?
	- additional scopes needed, (still does it. mailbox settings is listed at the same depth as user.readwrite)
	- non-accesible properties
	how does a CSDL provide description of the scopes used in the restrictions?

	how do we solve the issue of "least to move priv" permissions for graph?
	- Maybe put in a number that signifies the position.

	what if we make scheme name to be enums?
	<Record>
		<PropertyValue Property="Scope" String="Directory.ReadWrite.All" />
		<PropertyValue Property="Scheme" String="DelegatedWork Application" />
	</Record>
	rules for tooling:
	- a permission that gives access to some properties vs a perm that gives access to more.
	- number of entities that the permission can get access. More entities means a more powerful permission.
	- does a permission gives access to more methods (read/write)

	roles?
	<PropertyValue Property="Role" String="Admin" />
	//this shouldn't belong here. maybe not at all.
	<!-- Roles need to be nullable -->
	nullable scope name?
	descriptions