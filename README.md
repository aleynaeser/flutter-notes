# flutter-notes
Bu repository Dart ve Flutter öğrenirken yaptığım örnekleri ve uygulamaları içermektedir.

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

- DO use curly braces for all flow control statements.



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

- ?? yalnızca o anda boşsa değer atamak için kullanılır.

```
int? a; // = null
a ??= 3;
print(a); // <-- Prints 3.

a ??= 5;
print(a); // <-- Still prints 3.
```

- ?? eğer solunda null bir ifade yoksa solundaki değeri varsa sağındaki değeri döndürür.

```
print(1 ?? 3); // <-- Prints 1.
print(null ?? 12); // <-- Prints 12.
```

- null değer döndürürse:
```
(myObject != null) ? myObject.someProperty : null

myObject?.someProperty // Üstteki ifadenin kısaltılmış hali eğer my.Object null değilse myObject.someProperty döndürür

myObject?.someProperty?.someMethod() // 2 nesne de null değilse someMeyhod döndürülür

```

- List kullanımı

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

```





















