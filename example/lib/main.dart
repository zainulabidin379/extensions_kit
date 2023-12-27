import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

import './avatar_example.dart';
import './padding_example.dart';
import './shimmer_example.dart';
import './text_example.dart';
import './widget_example.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extensions Kit Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Ext.green600),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Extensions Kit Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          /// Shimmer Effect
          ElevatedButton(
              onPressed: () {
                context.push(ShimmerEffectExample());
              },
              child: Text('Shimmer Effect')),

          20.heightBox,

          /// Text Theme Extensions
          ElevatedButton(
              onPressed: () {
                context.push(TextExample());
              },
              child: Text('Text Example')),

          ///SizeBox Extensions
          20.heightBox,
          20.widthBox,

          Row(
            children: [
              Text(
                'Hello World',
              ).textColor(Ext.randomPrimaryColor),
              20.widthBox,
              Text(
                'Hello World',
              ).textColor(Ext.randomOpaqueColor)
            ],
          ),

          /// Gap Extension
          const Gap(20), // Adds an empty space of 20 pixels.

          /// Widget Extensions
          ElevatedButton(
              onPressed: () {
                context.push(WidgetExample());
              },
              child: Text('Widget Ext')),

          20.heightBox,

          ///Padding Extensions
          ElevatedButton(
              onPressed: () {
                context.push(PaddingExample());
              },
              child: Text('Padding Example')),

          20.heightBox,

          ///Avatar
          ElevatedButton(
              onPressed: () {
                context.push(AvatarExample());
              },
              child: Text('Avatar')),

          20.heightBox,

          ///Date Extensions
          Text('${dateTime.isToday}'),
          Text('${dateTime.isFirstDayOfMonth}'),
          Text('${dateTime.isSameDay(dateTime)}'),
          Text('${dateTime.format('dd MMM yy - hh:mm a')}'),
          Text(dateTime
                  .diffHours(DateTime.now().add(Duration(days: 5)))
                  .toString())
              .textColor(Ext.red600),
          Text(dateTime
              .diffYearsMonthsDays(DateTime.now().add(Duration(days: 396)))),

          20.heightBox,

          ///Platform Extension
          if (Ext.isWeb)
            Text(
              'This is Web',
            ).padAll(10.0),

          ///Show Platform dialog
          ElevatedButton(
              onPressed: () {
                context.showAlertDialog(
                    title: 'title',
                    message: 'message',
                    cancelButtonTitle: 'ok',
                    cancelTitleColor: Colors.green,
                    fontSize: 20);
              },
              child: Text('Show Dialog')),
        ],
      ).padHrz(20),
    );
  }
}
