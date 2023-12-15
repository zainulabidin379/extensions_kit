<img src="https://raw.githubusercontent.com/zainulabidin379/extensions_kit/main/assets/images/header.png" alt="Logo" width="100%">
<p align="center">A powerful yet lightweight library of dart extensions to remove the boilerplate and speed up the development process</p>
<br>

## Installation

1. Go to `pubspec.yaml`
2. Add  extensions_kit and replace `[version]` with the latest version:
   
```dart
dependencies:
 extensions_kit: ^[version]
 ```

3. Click on get packages button or run *flutter pub get*
4. Import
```dart
import 'package:extensions_kit/extensions_kit.dart';
```


Available Extensions & Methods💪

  - [String Extensions](#string-extensions)
  - [Context Extensions](#context-extensions)
  - [Date Extensions](#date-extensions)
  - [Number Extensions](#number-extensions)
  - [Widget Extensions](#widget-extensions)
  - [Padding Extensions](#padding-extensions)
  - [Text Style Extensions](#text-style-extensions)
  - [Support](#support)



## String Extensions

```dart
// Validate an email
"example@mail.com".isEmail; // true

// Capitalizes each word in the string
"hello world".capitalize; // Hello World

// Capitalizes the first word in the string
"hello world".capitalizeFirst; // Hello world

// Mocks a string that needs to be translated or changed later
"Hello world".mock; //Hello world 🧨

// Check if a string is boolean
// If `caseSensitive` is `true`, which is the default,
//The only accepted inputs are the strings `"true"` and `"false"`,
"true".isBool(); // true
"TRUE".isBool(); // false 
"TRUE".isBool(caseSensitive: false); // true 

// Convert a string into a boolean
// Throws error if the string is not a Boolean.
// If `caseSensitive` is `true`, which is the default,
//The only accepted inputs are the strings `"true"` and `"false"`,
"true".toBool(); // true
"TRUE".toBool(); // throws error 
"TRUE".toBool(caseSensitive: false); // true

// Check if the string is a number
"123".isNum; // true
"12fh".isNum; // false

// Convert a string into a number
"123".toNum; // 123

// Check if a string is a double number
"123.45".isDouble; // true

// Convert a string into a double
"123.12".toDouble; // 123.12

// Check if a string is an integer
"123".isInt; // true

// Convert a string into an integer
"123".toInt; // 123


// Remove all the whitespace from the string
"This is a test string".removeAllWhitespace; // Thisisateststring

// Check if the String matches the Regular expression
"username_10".hasMatch("r'[abcdefghijklmnopqrstuvwxyz1234567890._]"); // true
```