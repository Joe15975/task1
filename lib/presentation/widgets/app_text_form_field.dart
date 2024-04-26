
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/app/utils.dart';

class AppTextFormField extends StatelessWidget {

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool isBig;
  final bool isArabic;
  final TextInputType? keyboardType;
  final double maxWidth;

  const AppTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.readOnly = false,
    this.isBig = false,
    this.isArabic = false,
    this.maxWidth = 500,
  });

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;

    if (Utils.isPortrait(context)){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(hint),
            TextFormField(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              controller: controller,
              keyboardType: keyboardType,
              readOnly: readOnly,
              enabled: !readOnly,
              validator: validator,
              inputFormatters: [
                if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ],
        ),
      );
    }else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
                      enabled: !readOnly,
                      validator: validator,
                      inputFormatters: [
                        if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
                      ],
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
                        enabled: !readOnly,
                        validator: validator,
                        inputFormatters: [
                          if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    );
                  }
                }
              ),
            ),
          ],
        ),
      );
    }
  }
}
