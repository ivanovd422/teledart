import 'dart:ffi';

import '../Data/UpdateData.dart';

abstract class TelegramApi {
  Future<GetUpdateData> getUpdates(String uri);
  Future<Void> sendMessage(String uri);
}