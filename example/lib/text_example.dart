import 'package:flutter/material.dart';
import 'package:extensions_kit/extensions_kit.dart';

class TextExample extends StatelessWidget {
  const TextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Example'),
      ),
      body: Center(
        child: Column(
          children: [
            //Text Extensions
            Text(
              'Hello World',
              style: context.textStyles.displayLarge.bold,
            ),
            Text(
              'Hello World',
              style: context.textStyles.headlineLarge.semiBold,
            ),
            Text(
              'Hello World',
              style: context.textStyles.bodyLarge.regular,
            ),
            Text('Hello World', style: context.textStyles.bodyLarge),
            Text(
              'Hello World',
              style: context.textStyles.bodySmall.thin,
            ),

            /// Text Widget
            Text('Hello World').bold().fontSize(25).italic(),
          ],
        ),
      ),
    );
  }
}