import 'package:flutter/cupertino.dart';

abstract class BaseVM extends ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

}