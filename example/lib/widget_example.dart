import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class WidgetExample extends StatelessWidget {
  const WidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Ext'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
          )
              .withRoundCorners(backgroundColor: Colors.grey)
              .withShadow()
              .center
              .tooltip('just a tooltip')
              .padOnly(left: 10)
              .padAll(20)
              .onTap(() => print('tap'))
              .onLongPress(() => print('long press')),

          /// Text Widget
          Text('Hello World').bold().fontSize(25).italic(),
        ],
      ),
    );
  }
}
