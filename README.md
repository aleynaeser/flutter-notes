# flutter-notes

This repository contains my notes while learning Dart and Flutter.

## Contents

<ol>
  <li>
    <a href="#Lnk">Build Flutter Appbundle</a>
  </li>
  <li>
    <a href="#Lnk">State Management</a>
  </li>
      <li>
        <a href="#Lnk">Effective Dart Style</a>
      </li>
      <li>
        <a href="#Lnk">All Dart Cheatsheet</a>
      </li>
</ol>

## Build Flutter Appbundle

- Use the following command in terminal for Windows

```
keytool -genkey -v -keystore c:\Users\YOUR_USER_NAME\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

- Create a file named [project]/android/key.properties that contains a reference to your keystore:

```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=upload
storeFile=<location of the key store file, such as /Users/<user name>/upload-keystore.jks>
```

- Add the keystore information before the android block for [project]/android/app/build.gradle

```
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   android {
         ...
   }
```

- Find the buildTypes block and replace it with the following signing configuration info:

```
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }
```

- Finally run the following command

```
flutter build appbundle
```

- Now, your appbundle is ready to upload any store 📲

## State Management

Flutter has several state management approaches that it recommends on its official website. Some of these are approaches like setState, Provider, Bloc, Mobx, Getx, GetIt.

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

## All Dart Cheatsheet

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

//
Student selectedStudent = Student.withId(0,"","",0);

```

- Using Functions

```
Function f1 =(int a, int b){
int toplam =a + b;
print(toplam); }

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

- Useful Widgets

#### Flexible, Expanded, Column, Row,Form, Container,

- techcareer notes

#### https://github.com/aleynaeser/flutter-notes/tree/todo-app

## Implementing Dynamic Theme Switching in Flutter

Flutter offers excellent support for creating customizable and dynamic themes. This article explores a robust implementation of a theme system that allows seamless switching between light and dark modes.

### Theme Architecture

The implementation consists of five key components:

1. **Theme Constants**: Define color constants for different theme modes
2. **Theme Model**: Create extensions for easy theme property access
3. **Theme Configuration**: Establish theme data with custom extensions
4. **Theme Provider**: Manage theme state using Provider pattern
5. **Theme Consumer**: Apply themes in UI components

#### Theme Constants

The foundation starts with `ThemeColors` class defining color palettes:

```dart
import 'package:flutter/material.dart';

class ThemeColors {
  final Color themeColor1;
  final Color themeColor2;

  const ThemeColors._({required this.themeColor1, required this.themeColor2});

  static const light = ThemeColors._(
    themeColor1: Colors.white,
    themeColor2: Color(0xFFF5F5F5),
  );

  static const dark = ThemeColors._(
    themeColor1: Color(0xFF252525),
    themeColor2: Color(0xFF3A3A3A),
  );
}
```

#### Theme Model with Extensions

The `CustomThemeModel` extends Flutter's `ThemeExtension` to enable type-safe theme access:

```dart
import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  CustomThemeModel get themeColors =>
      Theme.of(this).extension<CustomThemeModel>()!;
}

@immutable
class CustomThemeModel extends ThemeExtension<CustomThemeModel> {
  final Color themeColor1;
  final Color themeColor2;

  const CustomThemeModel({
    required this.themeColor1,
    required this.themeColor2,
  });

  @override
  CustomThemeModel copyWith({Color? themeColor1, Color? themeColor2}) {
    return CustomThemeModel(
      themeColor1: themeColor1 ?? this.themeColor1,
      themeColor2: themeColor2 ?? this.themeColor2,
    );
  }

  @override
  CustomThemeModel lerp(ThemeExtension<CustomThemeModel>? other, double t) {
    if (other is! CustomThemeModel) {
      return this;
    }
    return CustomThemeModel(
      themeColor1: Color.lerp(themeColor1, other.themeColor1, t)!,
      themeColor2: Color.lerp(themeColor2, other.themeColor2, t)!,
    );
  }
}
```

#### Theme Configuration

The `ThemeConfig` class generates theme data based on the dark mode flag:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/common/constants/theme_constants.dart';
import 'package:todo_app/common/models/theme_model.dart';

class ThemeConfig {
  static ThemeData getTheme(bool isDarkMode) {
    final (baseTheme, colorScheme, themeColors) = _getThemeData(isDarkMode);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: themeColors.themeColor1,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      colorScheme: colorScheme.copyWith(
        primary: themeColors.themeColor1,
        secondary: themeColors.themeColor2,
      ),
      extensions: [
        CustomThemeModel(
          themeColor1: themeColors.themeColor1,
          themeColor2: themeColors.themeColor2,
        ),
      ],
    );
  }

  static (ThemeData, ColorScheme, ThemeColors) _getThemeData(bool isDarkMode) =>
      isDarkMode
          ? (ThemeData.dark(), ColorScheme.dark(), ThemeColors.dark)
          : (ThemeData.light(), ColorScheme.light(), ThemeColors.light);
}
```

#### Theme Provider

A simple `ThemeProvider` using ChangeNotifier handles theme state:

```dart
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
```

#### Theme Consumer Example

The AppBar demonstrates theme consumption with a toggle action:

```dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/models/theme_model.dart';
import 'package:todo_app/common/providers/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          title: Text(title),
          elevation: 0,
          centerTitle: false,
          backgroundColor: context.themeColors.themeColor2,
          actions: [
            IconButton(
              icon: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () {
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
```

### Benefits of This Approach

1. **Type Safety**: The extension methods provide type-safe access to theme properties
2. **Separation of Concerns**: Each component has a specific responsibility
3. **Maintainability**: Easy to add new theme properties or entire theme variants
4. **Performance**: Efficient theme switching with minimal rebuilds

This implementation offers an elegant solution for dynamic theming in Flutter applications that can be expanded to support multiple theme variations beyond just light and dark modes.
