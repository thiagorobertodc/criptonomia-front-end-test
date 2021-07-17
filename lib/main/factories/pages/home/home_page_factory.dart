import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeHomePage() {
  return HomePage(makeGetxHomePresenter());
}
