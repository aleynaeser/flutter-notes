# flutter-notes
This repository contains examples and applications I made while learning Dart and Flutter.

## Effective Dart Style

- DO name types using UpperCamelCase.
```
class NickNames { ... }

class HttpRequest { ... }

typedef Predicate<T> = bool Function(T value);

class Foo {
  const Foo([Object? arg]);
}

Foo(anArg)
class A { ... }
```


- DO name extensions using UpperCamelCase.

```
extension MyFancyList<T> on List<T> { ... }

extension SmartIterable<T> on Iterable<T> { ... }
```

- DO name libraries, packages, directories, and source files using lowercase_with_underscores.

```

library peg_parser.source_scanner;

import 'file_system.dart';
import 'slider_menu.dart';
```

- DO name other identifiers using lowerCamelCase.

```
 
const foo = Foo(); 

var count = 3;

HttpRequest httpRequest;

void align(bool clearItems) {
  // ...
}

const pi = 3.14;
const defaultTimeout = 1000;
final urlScheme = RegExp('^([a-z]+):');

class Dice {
  static final numberGenerator = Random();
}

```

- DO specify exports in a separate section after all imports.
```
import 'src/error.dart';
import 'src/foo_bar.dart';

export 'src/error.dart';
```

- DO use curly braces for all flow control statements.

```
// When you have an if statement with no else clause and the whole if statement fits on one line, you can omit the braces if you prefer:
if (arg == null) return defaultValue;

/****BUT****/

// If the body wraps to the next line, though, use braces!!

if (overflowChars != other.overflowChars) {
  return overflowChars < other.overflowChars;
}
```

- Here is how the various libraries should import each other:
```
import 'src/stuff.dart';
import 'src/utils.dart';

import '../api.dart';
import 'stuff.dart';

import 'package:my_package/api.dart'; // Don't reach into 'lib'.
import 'test_utils.dart'; // Relative within 'test' is fine.

```

##  All Dart Cheatsheet

- ? = null
```
int a = null; // INVALID in null-safe Dart.
```

```
int? a = null; // Valid in null-safe Dart.
```

```
int? a; // The initial value of a is null.
```

- ?? it is used to assign a value only if it is currently empty.

```
int? a; // = null
a ??= 3;
print(a); // <-- Prints 3.

a ??= 5;
print(a); // <-- Still prints 3.
```

- ?? returns the value to the right if there is no null expression to the left of it.

```
print(1 ?? 3); // <-- Prints 1.
print(null ?? 12); // <-- Prints 12.
```

- If it returns null:
```
(myObject != null) ? myObject.someProperty : null

myObject?.someProperty // Üstteki ifadenin kısaltılmış hali eğer my.Object null değilse myObject.someProperty döndürür

myObject?.someProperty?.someMethod() // 2 nesne de null değilse someMeyhod döndürülür

```

- Basic Widget Architecture

 ![image](https://user-images.githubusercontent.com/45822686/138070253-4ac1432c-8242-4d97-9aed-ea1ab715e7f3.png)

- List Usage

```
final aListOfStrings = ['a', 'b', 'c'];
final aSetOfInts = {3, 4, 5};
final aMapOfStringsToInts = {
  'one': 1,
  'two': 2,
  'three': 3,
}
```
```
final aListOfInts = <int>[];
final aSetOfInts = <int>{};
final aMapOfIntToDouble = <int, double>{};
```
```
// Assign this a map of String to int so that aMapOfStringsToInts['myKey'] returns 12:
final aMapOfStringsToInts = {'myKey': 12};

//Writing the list on the screen
for(var product in profucts){
    print(product);
}
```

- Map Usage

```
var dictionary1 = new Map();
dictionary1["book"] = "kitap";

var dictionary1 ={"kitap":"book"};
//kitap=key
//delete
dictionary1.remove("book");

```

- State Usage

#### If there is a change, use the StatefulWidget
#### Else StatelessWidget

- Usesful Widgets
#### Flexible, Expanded, Column, Row, 









