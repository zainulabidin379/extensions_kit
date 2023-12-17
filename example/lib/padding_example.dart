import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class PaddingExample extends StatelessWidget {
  const PaddingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding Ext'),
      ),
      body: Column(
        children: [
          Text(
            'Hello World',
          ).padSymmetric(horizontal: 2.0, vertical: 5.0),
          Text(
            'Hello World',
          ).padAll(10.0),
          Padding(
            padding: 15.padVert(),
            child: Text(
              'Hello World',
            ),
          )
        ],
      ),
    );
  }
}