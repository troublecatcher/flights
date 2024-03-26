import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChevron extends StatelessWidget {
  const CustomChevron({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right,
      color: CupertinoTheme.of(context).primaryColor,
    );
  }
}
