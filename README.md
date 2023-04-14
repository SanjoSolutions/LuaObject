# Lua Object

This work is devoted to God.

A library of functions for working with objects. It can be used by other add-ons to save some development work.

An object is regarded to be a Lua table with zero or more key-value pairs.

**Functions included:**

* **Object.copy**: a function for copying an object.
* **Object.keys**: a function for extracting the keys of an object.
* **Object.values**: a function for extracting the values of an object.
* **Object.entries**: a function for converting an object to an array.
* **Object.equals**: a function for checking if two objects are equal.
* **Object.assign**: a function for assigning the key-value pairs of one or multiple objects to another object.
* **Object.count**: a function to count the number of key-value pairs on an object.
* **Object.every**: a function for checking if every key-value pair of an object fulfills certain conditions.
* **Object.fromEntries**: a function to convert an array of key-value pairs to an object.
* **Object.isEmpty**: a function for checking if an object has zero key-value pairs.
* **Object.remove**: a function for removing a key-value pair with a specific key from an object.
* **Object.hasKeys** / **Object.hasEntries**: a function to check if an object has any keys.

## Usage

### Embedding

#### Introduction

With this approach, the library is included as part of the add-on. A benefit to the add-on user is, that only
the add-on appears in the add-on list. So it can be easier to enable or disable an add-on and its library dependencies
compared to an approach where the libraries are included as add-ons (in this case each library shows as an add-on in the add-ons list and the user potentially is required to tick multiple checkboxes to enable or disable an add-on and its library dependencies).

#### How to do it

This library registers itself via the library "[Library](https://github.com/SanjoSolutions/LuaLibrary)". With this approach it is avoided to create another global (with its theoretical potential that other add-ons already use the same global). And "Library" also handles when multiple add-ons load the same library, potentially different versions of it.
To embed it, also include "[Library](https://github.com/SanjoSolutions/LuaLibrary)" as a dependency to your add-on.

In our example, we have installed both "Library", "Object" and the dependencies of "Object" ("Boolean" and "Set") inside the "libs" folder inside the add-on folder.

In your add-ons TOC file add (to load "Library" and "Object" and its dependencies):

```
libs/Library/Library.xml
libs/Boolean/Boolean.xml
libs/Set/Set.xml
libs/Object/Object.xml
```

It's recommended to load the library files first, so that the libraries are available in the other Lua files.

In your Lua file(s), you can access the library via:

```lua
local Object = Library.retrieve('Object', '^1.0.0')
```

### As add-on

This library can also just be put directly in the AddOns folder. In this case the library is available via the global `Object`.

If you develop an add-on and do this approach, you can just include this library in your release as a folder next to your add-ons folder.

## Support

You can support me on [Patreon](https://www.patreon.com/addons_by_sanjo).
