

import 'package:flutter/cupertino.dart';

class Utils{
  static bool isPortrait(BuildContext context){
    return MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;
  }

  static bool isLandscape(BuildContext context){
    return MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
  }
}