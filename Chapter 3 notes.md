# Chapter 3 / Swift for Object-Oriented App Development

- Classes contain _properties_ and _methods_
- Properties = variables that are part of a class
- Methods = functions that are part of a class
- "Object" = instance of a class

- Initializers (aka `init`)
 - "designated initializers": sets up everything needed to use object
 - "convenience initializers": exists to make setting up instances easy (aka "convenient"), and calls a designated initializer as part of its setup
- Deinitializer (aka `deinit`)
 - run code when object is going away

- classes store data in _properties_
- Swift allows inheritance from a single parent class

- Computed Properties

- Observers

- Lazy Properties

- Protocols
 - look like a Class, but no actual code provided (just define what kind of properties and functions exist, how they're accessed)

- Extensions _extend_ existing types (add additional methods and computed properties)
 - can be own classes, or _any_ type (ex: Int, String)

- Access Control
 - Public / Internal / Private
 - ex: visible (can be accessed) within only its source file, or entire app

- Operator Overloading

- Generics: see Playground 🎉

- Subscripts

- Structures: related to classes, but not the same
  - no inheritance
  - when passed around via code, a structure is _copied_
