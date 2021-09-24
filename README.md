# flutter-notes
Bu repository Dart ve Flutter öğrenirken yaptığım örnekleri ve uygulamaları içermektedir.

## Nullable Variables

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

#### ?? yalnızca o anda boşsa değer atamak için kullanılır

```
int? a; // = null
a ??= 3;
print(a); // <-- Prints 3.

a ??= 5;
print(a); // <-- Still prints 3.
```

#### ?? eğer solunda null bir ifade yoksa solundkai değeri varsa sağındkai değeri döndürür.

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

####


























