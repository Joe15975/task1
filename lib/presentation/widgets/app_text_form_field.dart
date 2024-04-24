
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/app/utils.dart';

class AppTextFormField extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;

  const AppTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    if (Utils.isPortrait(context)){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(hint),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            validator: validator,
          ),
        ],
      );
    }else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
              child: Text(hint)
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: controller,
              readOnly: readOnly,
              validator: validator,
            ),
          ),
        ],
      );
    }
  }
}
