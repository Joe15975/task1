import 'package:flutter/material.dart';
import 'package:test1/app/utils.dart';

class ResponsiveFieldsRow extends StatelessWidget {

  final List<Widget> children;

  const ResponsiveFieldsRow({
    super.key,
    required this.children,
  }) : assert(children.length == 2, 'ResponsiveFieldsRow must have exactly 2 children');

  @override
  Widget build(BuildContext context) {

    if (Utils.isPortrait(context)){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    }else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: children[0],
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: children[1],
            ),
          ],
        ),
      );
    }
  }
}
