import 'package:get/get.dart';

import '../../ui/pages/pages.dart';

class GetxSplashPresenter implements SplashPresenter {
  final _navigateTo = Rx<String?>(null);
  Stream<String?> get navigateToStream => _navigateTo.stream;
  Future<void> checkAccount({int? durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds!));
    _navigateTo.value = '/home';
  }
}
