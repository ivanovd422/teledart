import 'Сontrollers/MainController.dart';

class ClientStarter {
  final MainController controller = MainController();

  void startLoop() async {
    controller.main();

  }
}
