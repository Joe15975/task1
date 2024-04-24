
import 'package:flutter/material.dart';
import 'package:test1/app/utils.dart';

class AppTextFormField extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool isBig;
  final bool isArabic;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.readOnly = false,
    this.isBig = false,
    this.isArabic = false,
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
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly,
            validator: validator,
          ),
        ],
      );
    }else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
              child: Text(hint)
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 5,
            child: Builder(
              builder: (context) {
                if (!isBig){
                  return TextFormField(
                    controller: controller,
                    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                    keyboardType: keyboardType,
                    readOnly: readOnly,
                    validator: validator,
                  );
                }else {
                  return SizedBox(
                    height: 75,
                    child: TextFormField(
                      controller: controller,
                      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                      keyboardType: keyboardType,
                      textAlignVertical: TextAlignVertical.top,
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      readOnly: readOnly,
                      validator: validator,
                    ),
                  );
                }
              }
            ),
          ),
        ],
      );
    }
  }
}
