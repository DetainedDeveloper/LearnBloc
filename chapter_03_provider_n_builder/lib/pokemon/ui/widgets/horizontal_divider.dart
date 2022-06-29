import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(1.0),
      child: ColoredBox(
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
