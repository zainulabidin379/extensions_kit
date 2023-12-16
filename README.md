<img src="https://raw.githubusercontent.com/zainulabidin379/extensions_kit/main/assets/images/header.png" alt="Logo" width="100%">
<p align="center">An essential and powerful library of dart extensions to remove the boilerplate and speed up the development process.</p>
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


Available Extensions & Methods 🔥

  - [String Extensions](#string-extensions)
  - [Media Query Extensions](#media-query-extensions)
  - [Theme Extensions](#theme-extensions)
  - [Date Extensions](#date-extensions)
  - [Navigation Extensions](#navigation-extensions)
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

## Media Query Extensions
From the `MediaQuery` Access properties right in the `context` instance.

```dart

// Before
 Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
        ),

// After
Container(
     width: context.w(), // 100% of screen width
     height: context.h(), // 100% of screen height
        ),
Container(
     width: context.w(w: 50), // 50% of screen width
     height: context.h(h: 40.5), // 40.5% of screen height
        ),
```

## Theme Extensions

```dart

// Returns boolean 
context.isDarkMode; // true/false
context.isLightMode; // true/false

```

## Date Extensions

```dart
// Get Date only
DateTime(2023,12,16,11,40,00,0,0).dateOnly; // DateTime(2023,12,16) *time set to midnight

// Check if [DateTime] is on the same day as today
DateTime.now().isToday; // true

// Check if [DateTime] was on the same day as yesterday
DateTime.now().isYesterday; // false

// Check if [DateTime] will be on the same day as tomorrow
DateTime.now().isTomorrow; // false

// Add a certain number of DAYS to [DateTime] 
DateTime(2023,12,16).addDays(5); // DateTime(2023,12,21)

// Add a certain number of HOURS to [DateTime]
DateTime(2023,12,16,11,50,0).addHours(10); // DateTime(2023,12,16,21,50,0)

/// The day after this [DateTime]
DateTime(2017, 3, 5).nextDay; // return DateTime(2017, 3, 6)

/// The day previous this [DateTime]
DateTime(2017, 3, 5).previousDay; // return DateTime(2017, 3, 4)

// First day of the month
DateTime(2018, 9, 30).firstDayOfMonth; // returns DateTime(2018, 9, 1)

// Last day of the month
DateTime(2017, 3).lastDayOfMonth; // DateTime(2017, 3, 31)

// All days in a month, [DateTime] Array
DateTime(2017, 3).daysInMonth; // [DateTime(2017, 3, 1), DateTime(2017, 3, 2), ...]

// Whether or not two times are on the same day.
DateTime.now().isSameDay(DateTime.now()); // returns true

// Whether or not two times are on the same week.
DateTime(2017, 3, 5).isSameWeek(DateTime(2017, 3, 6));

```

## Navigation Extensions
From the `Navigator` Access properties right in the `context` instance.

```dart
// Before
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondScreen()),
  );

// After

// for push
context.push(SecondScreen());
context.pushNamed('/home');

// For back, you can also add back result data
context.pop();

// for push replacement
context.pushReplacement(SecondScreen());
context.pushReplacementNamed('/home');

// popUntil
context.popUntil('/login');

// with rootNavigator
context.push(SecondScreen(), rootNavigator: true);
context.pushReplacement(SecondScreen(), rootNavigator: true);
context.popUntil('/login', rootNavigator: true);
```


## Widget Extensions
These widget extensions will help you to reduce boilerplate code and increase your productivity

#### SizeBox
```dart
// Before
SizedBox(
    height : 20
   )

// After
// makes space of 20 height
20.heightBox; 

// for width
20.widthBox
```

#### Padding

```dart
// Before
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text("text"),
);

// After
Text("text").padAll(8.0),
```

Similar available padding extensions are:
* `padAll` Creates insets from offsets from all sides.
* `padHrz` Creates insets from offsets from horizontal sides.
* `padVert` Creates insets from offsets from vertical sides.
* `padTop` Creates insets from offsets from the top side.
* `padBottom` Creates insets from offsets from the bottom side.
* `padLeft` Creates insets from offsets from the left side.
* `padRight` Creates insets from offsets from the right side.

#### Alignment

```dart
// Before
Align(
  alignment: Alignment.centerLeft,
  child: Text("text"),
);

// After
Text("text").leftAlign,
```

Similar available Alignment extensions are:
* `center` Aligns the widget to the center.
* `leftAlign` Aligns the widget to the center left.
* `rightAlign` Aligns the widget to the center right.
* `topAlign` Aligns the widget to the top center.
* `topLeftAlign` Aligns the widget to the top left.
* `topRightAlign` Aligns the widget to the top right.
* `bottomAlign` Aligns the widget to the bottom center.
* `bottomLeftAlign` Aligns the widget to the bottom left.
* `bottomRightAlign` Aligns the widget to the bottom right.


### Flexible

```dart
/// Before
Flexible(
  child: Text("text"),
)

// After
Text("text").flexible
```

Similar available widget extensions are:
* `unfocus` Will [Unfocus] focused text field, It's better to use it on the main parent widget of the screen e.g. [Scaffold]
* `tooltip()` Will wrap the widget with a Tooltip widget
* `flexible()` Will wrap the widget with a Flexible widget
* `expanded()` Will wrap the widget with an Expanded widget
* `withOpacity()` Will wrap the widget with an Opacity widget
* `onDoubleTap()` Will wrap the widget with a GestureDetector and accept an onDoubleTap function
* `onTap()` Will wrap the widget with a GestureDetector and accept an onTap function
* `onLongPress()` Will wrap the widget with a GestureDetector and accept an onLongPress function
* `positionTop()` Will wrap the widget with a Positioned widget and accept top position
* `positionBottom()` Will wrap the widget with a Positioned widget and accept bottom position
* `positionTB()` Will wrap the widget with a Positioned widget and accept top & bottom position
* `positionLT()` Will wrap the widget with a Positioned widget and accept left & right position
* `positionLRTB()` Will wrap the widget with a Positioned widget and accept left,right,top & bottom position
* `sizedBox(width,height)` Will wrap the widget with a SizedBox of given height and width
* `heightBox(height)` Will wrap the widget with a SizedBox of a given height
* `widthBox(height)` Will wrap the widget with a SizedBox of a given width


#### Shimmer Effect
![OYCE3](https://user-images.githubusercontent.com/31765271/177955655-66a856a6-108a-429f-bbad-64b1c3f114aa.gif)
```dart
Container(height: 50,width: 50,).applyShimmer();
```
You can also change the color of the shimmer using `baseColor` & `highlightColor`.

  
