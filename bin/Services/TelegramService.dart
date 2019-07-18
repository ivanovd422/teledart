import '../API/Data/UpdateData.dart';

abstract class TelegramService {
  Future<GetUpdateData> getUpdates();

  void sendMessage(String message);
}
