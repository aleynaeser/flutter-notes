# flutter-notes
Bu repository Dart ve Flutter öğrenirken yaptığım örnekleri ve uygulamaları içermektedir.

##  All Dart Cheatsheet

#### ? = null
```
int a = null; // INVALID in null-safe Dart.
```

```
int? a = null; // Valid in null-safe Dart.
```

```
int? a; // The initial value of a is null.
```

#### ?? yalnızca o anda boşsa değer atamak için kullanılır.

```
int? a; // = null
a ??= 3;
print(a); // <-- Prints 3.

a ??= 5;
print(a); // <-- Still prints 3.
```

#### ?? eğer solunda null bir ifade yoksa solundaki değeri varsa sağındaki değeri döndürür.

```
print(1 ?? 3); // <-- Prints 1.
print(null ?? 12); // <-- Prints 12.
```

#### null değer döndürürse:
```
(myObject != null) ? myObject.someProperty : null

myObject?.someProperty // Üstteki ifadenin kısaltılmış hali eğer my.Object null değilse myObject.someProperty döndürür

myObject?.someProperty?.someMethod() // 2 nesne de null değilse someMeyhod döndürülür

```

#### List kullanımı

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





















