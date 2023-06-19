import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  void onViewInit() {}
  void onViewMount() {}
  void onViewDispose() {}
}
