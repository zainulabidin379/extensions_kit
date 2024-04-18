<img src="https://raw.githubusercontent.com/zainulabidin379/extensions_kit/main/assets/images/header.png" alt="Logo" width="100%">

<p align="center">
<a href="https://pub.dev/packages/extensions_kit"><img alt="Pub Version" src="https://img.shields.io/pub/v/extensions_kit"></a>
<a href="https://pub.dev/packages/extensions_kit/score"><img alt="Pub Points" src="https://img.shields.io/pub/points/extensions_kit"></a>
<a href="https://pub.dev/packages/extensions_kit/score"><img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/extensions_kit"></a>
<a href="https://extensionskitdocs.vercel.app/"><img alt="Documentation Link" src="https://img.shields.io/badge/extensions_kit-Documentation-blue"></a>
</p>


<p align="center">An essential and powerful library of dart extensions to remove the boilerplate and speed up the development process.</p>
<br>

# <a href="https://extensionskitdocs.vercel.app/" target="_blank">📋 Full Documentation & Usage Examples ➲</a>

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
  - [Colors](#colors)
  - [Gap Widget](#gap-widget)
  - [Text Style Extensions](#text-style-extensions)
  - [Url Strategy](#url-strategy)
  - [Avatar Image](#avatar-image)
  - [Distance Between Coordinates](#distance-between-coordinates)
  - [Snackbar](#snackbar)
  - [Support](#support)
  - [Acknowledgments and References](#acknowledgments-and-references)
  - [Bugs or Feature Requests](#bugs-or-feature-requests)



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

// Copy a string to Clipboard
Ext.copy("Hello World"); // `Hello World` copied to clipboard
```

## Media Query Extensions
From the `MediaQuery` Access properties right in the `context` instance.

```dart

// Before
 Container(
     width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
        ),

// Now
Container(
     width: context.screenWidth, // 100% of screen width
     height: context.screenHeight, // 100% of screen height
        ),
Container(
     width: context.w(50), // 50% of screen width
     height: context.h(40.5), // 40.5% of screen height
        ),
```

## Theme Extensions

```dart

// Returns boolean 
context.isDarkMode; // true/false
context.isLightMode; // true/false

```

## Date Extensions

To format `DateTime` 
```dart
// Formats `DateTime` into readable form according to the given format
DateTime.now().format("dd/MM/yyyy - hh:mm a") // 20/12/2023 - 08:00 PM
```



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

/// The day After this [DateTime]
DateTime(2017, 3, 5).nextDay; // DateTime(2017, 3, 6)

/// The day previous this [DateTime]
DateTime(2017, 3, 5).previousDay; // DateTime(2017, 3, 4)

// First day of the month
DateTime(2018, 9, 30).firstDayOfMonth; // DateTime(2018, 9, 1)

// Last day of the month
DateTime(2017, 3).lastDayOfMonth; // DateTime(2017, 3, 31)

// All days in a month, [DateTime] Array
DateTime(2017, 3).daysInMonth; // [DateTime(2017, 3, 1), DateTime(2017, 3, 2), ...]

// Whether or not two times are on the same day.
DateTime.now().isSameDay(DateTime.now()); // true

// Whether or not two times are on the same week.
DateTime(2017, 3, 5).isSameWeek(DateTime(2017, 3, 6)); // true

```

#### DateTime Difference

```dart
// Difference between two `DateTime` in years, month and days
DateTime(2015, 1, 1).diffYearsMonthsDays(DateTime.now()) // 8 years 11 months 24 days
DateTime(2015, 1, 1).diffYearsMonthsDays(DateTime.now(), abbr: true) // 8 y 11 m 24 d

// Difference in Days
DateTime(2017, 3, 5).diffDays(DateTime(2017, 3, 6)); // 1

// Difference in Days
DateTime(2017, 3, 5).diffHours(DateTime(2017, 3, 6)); // 24
```

Similar other available DateTime difference extensions are:
* `diffDays()` Difference in Days.
* `diffHours()` Difference in Hours.
* `diffMinutes()` Difference in Minutes.
* `diffSeconds()` Difference in Seconds.


## Navigation Extensions
From the `Navigator` Access properties right in the `context` instance.

```dart
// Before
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondScreen()),
  );

// Now

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


## Number Extensions

```dart
// Get number into its English ordinal representation
1.ordinal; // 1st
3.ordinal; // 3rd
234.ordinal; // 234th

// Get string representation of the number abbreviated to a compact form
999.abbreviated; // "999"
1000.abbreviated; // "1k"
1100.abbreviated; // "1.1k"

// Check if the number is between the given numbers
45.between(40,60); // true
23.between(10,20); // false

// Check if the number is outside the given numbers
60.outside(40,65); // false
23.outside(10,20); // true
```

An easy way to specify a border radius 
```dart
// Before
Container(
   height: 100,
   width: 100,
   decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
   ),
)

// Now
Container(
   height: 100,
   width: 100,
   decoration: BoxDecoration(
      borderRadius: 25.circular(),
   ),
)
```

An easy way to specify padding to a `Padding` widget
```dart
// Before
Padding(
   padding: EdgetInsets.all(15),
   child: Text("Text"),
)

// Now
Padding(
   padding: 15.padAll(),
   child: Text("Text"),
)
```
Similar available padding extensions to numbers are:
* `padAll()` Creates insets from offsets from all sides.
* `padHrz()` Creates insets from offsets from horizontal sides.
* `padVert()` Creates insets from offsets from vertical sides.
* `padTop()` Creates insets from offsets from the top side.
* `padBottom()` Creates insets from offsets from the bottom side.
* `padLeft()` Creates insets from offsets from the left side.
* `padRight()` Creates insets from offsets from the right side.
* `padOnly()` Creates insets from offsets from the given sides only.

## Widget Extensions
These widget extensions will help you to reduce boilerplate code and increase your productivity

#### SizeBox
```dart
// Before
SizedBox(
    height : 20
   )

// Now
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

// Now
Text("text").padAll(8.0),
```


Similar available padding extensions to widgets are:
* `padAll()` Creates insets from offsets from all sides.
* `padHrz()` Creates insets from offsets from horizontal sides.
* `padVert()` Creates insets from offsets from vertical sides.
* `padTop()` Creates insets from offsets from the top side.
* `padBottom()` Creates insets from offsets from the bottom side.
* `padLeft()` Creates insets from offsets from the left side.
* `padRight()` Creates insets from offsets from the right side.
* `padOnly()` Creates insets from offsets from the given sides only.

#### Alignment

```dart
// Before
Align(
  alignment: Alignment.centerLeft,
  child: Text("text"),
);

// Now
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

// Now
Text("text").flexible
```

Similar available widget extensions are:
* `unfocus` Will [Unfocus] focused text field, It's better to use it on the main parent widget of the screen e.g. `Scaffold`
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


#### Container Extensions
Now we can just add round corners, shadows, align, and add gestures to our Widgets.
```dart
Container(
      height: 100,
       width: 100,)
         .withRoundCorners(backgroundColor: Colors.grey)
         .withShadow()
```


#### Shimmer Effect
![OYCE3](https://user-images.githubusercontent.com/31765271/177955655-66a856a6-108a-429f-bbad-64b1c3f114aa.gif)
```dart
Container(height: 50,width: 50,).applyShimmer();
```
You can also change the color of the shimmer using `baseColor` & `highlightColor`.


#### Alert Dialog Box

Automatically detect Platform and show Material and Cupertino dialog
```dart
context.showAlertDialog(title: 'title', message: 'message',)
```

#### Nil Widget
Sometimes, according to a condition, we need to display nothing. Usually, when we can't return null, we would return something like `const SizedBox()`.

This is good, but it has some performance impacts since `SizedBox` creates a `RenderObject`. The `RenderObject` lives in the render tree and some computations are performed on it, even if it paints nothing on the screen.

We can do better, we can have a widget that does not create a `RenderObject` while being still valid. The `Nil` widget is the minimal implementation for this use case. It only creates an `Element` and does nothing while it's building. Because the optimal way to use it, is to call `const Nil()`, it also comes with a `nil` constant that you can use everywhere (which is a `const Nil()`).

```dart
// Before
text != null ? Text(text) : const SizedBox()

// Now
text != null ? Text(text) : nil
or
text != null ? Text(text) : const Nil()
```


## Colors
This package includes a comprehensive collection of predefined colors and methods, empowering you to effortlessly enhance the visual appeal of your Flutter applications.

```dart
Ext.black; // Color(0xFF000000)
Ext.transparent; // Colors.transparent;

Ext.red500; // Color(0xFFEF4444);
Ext.redHex500; // #EF4444

// Convert a hex color string to a [Color]
Ext.hexToColor("EF4444"); // Color(0xFFEF4444)

// Get [MaterialColor] from [Color]
Ext.getMaterialColor(Ext.red800); // Red Material Color

// Get Random Colors
Ext.randomOpaqueColor; // Random Opaque Color
Ext.randomPrimaryColor; // Random Primary Color
Ext.randomColor; // Random Color
```



## Gap Widget

When it comes to add empty space between widgets inside a `Column` or a `Row`, we have multiple options:
- We can either add a `Padding` around these widgets but it's very verbose
- Or we can add `SizedBox` widgets between them.

`Gap` is another option. It's like `SizedBox` but you don't have to know if it's inside a `Row` or a `Column`. So that it's less verbose than using a `SizedBox`.

You just have to add a `Gap` inside a `Column` or a `Row` with the specified extent. The `Gap` widget also works inside `Scrollable` widgets such as `ListViews`. In these cases, it will occupy the space in the same direction as the `Scrollable`.

```dart
return Column(
  children: <Widget>[
    Container(color: Colors.red, height: 20),
    const Gap(20), // Adds an empty space of 20 pixels.
    Container(color: Colors.red, height: 20),
  ],
);
```


## Text Style Extensions

From the `TextStyle` Access properties right in the `context` instance.

```dart
// Before
Text('Hello World',style: Theme.of(context).textTheme.labelSmall),

Text('Hello World', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 40))

// After
Text('Hello World',style: context.textStyles.labelSmall),
// OR
Text('Hello World',style: context.textStyles.displaySmall),
// If you want to bold text then 
Text('Hello World',style: context.textStyles.labelSmall.bold),   
```
Similar fontWeights are:
* `thick` The most thick - FontWeight.w900
* `extraBold` Extra-bold - FontWeight.w800
* `bold` Bold - FontWeight.bold - FontWeight.w700
* `semiBold` Semi-bold - FontWeight.w600
* `medium` Medium - FontWeight.w500
* `regular` Regular - FontWeight.w400
* `light` Light - FontWeight.w300
* `extraLight` Extra-light - FontWeight.w200
* `thin` Thin, the least thick - FontWeight.w100


Similar TextStyles are:
* `context.textStyles.displayLarge`
* `context.textStyles.displayMedium`
* `context.textStyles.displaySmall`
* `context.textStyles.headlineLarge`
* `context.textStyles.headlineMedium`
* `context.textStyles.headlineSmall`
* `context.textStyles.titleLarge`
* `context.textStyles.titleMedium`
* `context.textStyles.titleSmall`
* `context.textStyles.bodyLarge`
* `context.textStyles.bodyMedium`
* `context.textStyles.bodySmall`
* `context.textStyles.labelLarge`
* `context.textStyles.labelMedium`
* `context.textStyles.labelSmall`

#### Text
If you do not want use theme textsyles, then there are methods that you can use on a `Text` widget

```dart
Text('Hello World')
    .bold()
    .fontSize(25)
    .italic();
```

Similar methods are:
* `textScale()`  TextScale
* `bold()`  Bold Text
* `italic()`  Italic Text
* `fontWeight()`  Specific FontWeight
* `fontSize()`  Specific FontSize
* `letterSpacing()`  Specific LetterSpacing
* `wordSpacing()`  Specific WordSpacing
* `fontFamily()`  Specific FontFamily
* `textShadow()`  Specific TextShadow
* `textColor()`   TextColor
* `textAlignment()`  Specific TextAlignment
* `withUnderLine()`  TextUnderLine



## Url Strategy

With a simple call of `setPathUrlStrategy`, your Flutter web app does not have a leading `#`
in the URL anymore 🚀
```dart
void main() {
// Here we set the URL strategy for our web app.
// It is safe to call this function when running on mobile or desktop as well.
setPathUrlStrategy();
runApp(MyApp());
}
```


## Avatar Image
```dart
AvatarImage(
   backgroundImage: NetworkImage(
    'https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg'),
     shape: AvatarImageShape.standard,
     size: ImageSize.LARGE,
     child: Text('Lucky'),
          backgroundColor: Colors.red,
      ),

AvatarImage(
    shape: AvatarImageShape.circle,
    child: Text('JP'),
    backgroundColor: Colors.red,
      ),
```
![avatar-image](https://user-images.githubusercontent.com/31765271/205228265-a30afe80-1f12-4874-808f-177aafb25b4a.jpeg)
![avatar-name](https://user-images.githubusercontent.com/31765271/205228285-e5a52b8e-0675-4796-858b-7257d1925a5b.jpeg)

| Properties      | Description                                                                                                |
| --------------- | ---------------------------------------------------------------------------------------------------------- |
| child           | type of [Widget], which can have text , icon etc                                                           |
| backgroundColor | Color to fill the background of avatar                                                                     |
| foregroundColor | Color to change the textColor inside the avatar                                                            |
| radius          | size of the avatar                                                                                         |
| minRadius       | minimum size of the avatar                                                                                 |
| maxRadius       | maximun size of the avatar                                                                                 |
| size            | size of the avatar i.e `ImageSize.large`, `ImageSize.medium`, `ImageSize.small`                            |
| shape           | shape of the avatar i.e, `AvatarImageShape.standard`, `AvatarImageShape.circle`, `AvatarImageShape.square` |
| borderRadius    | extra radius to avatar shapes, not applicable to circular avatar                                           |


## Distance Between Coordinates

Calculates the great-circle distance in Kilometers between two geographic coordinates using the Haversine formula.
```dart
double distance = Ext.getDistanceFromCoordinates(37.7749, -122.4194, 34.0522, -118.2437);
```


## Snackbar

Utility methods for showing a Snackbar with customizable options.
```dart
Ext.showMessageSnackbar("This is a message Snackbar", context); // Message Snackbar

Ext.showErrorSnackbar("This is an Error Snackbar", context); // Error Snackbar

Ext.showInfoSnackbar("This is an info Snackbar", context); // Info Snackbar
```


## Support
If this package helped you please leave a like and share it with your friends.


## Acknowledgments and References
- A lot of extension from [Awesome Extensions](https://pub.dev/packages/awesome_extensions) By [Jayesh Pansheriya](https://github.com/jayeshpansheriya/awesome_extensions)
- [Gap](https://pub.dev/packages/gap) By [Romain Rastel](https://github.com/letsar/gap)
- [top_snackbar_flutter](https://pub.dev/packages/top_snackbar_flutter) by [Lanars](https://lanars.com/)

## Bugs or Feature Requests
If you encounter any problems feel free to open an [issue](https://github.com/zainulabidin379/extensions_kit/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/zainulabidin379/extensions_kit/issues/new?template=feature_request.md). Pull requests are also welcomed.


