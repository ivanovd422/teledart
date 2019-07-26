import 'dart:async';
import 'dart:io';

import '../API/Data/UpdateData.dart';
import '../API/TelegramApi/TelegramApiImpl.dart';
import 'package:teledart/custom/Constants.dart';
import 'TelegramService.dart';

class TelegramServiceImpl extends TelegramService {
  TelegramApiImpl telegramApi;
  var lastUpdateId = 0;

  TelegramServiceImpl() {
    final httpClient = HttpClient();
//    httpClient.findProxy = (_) => PROXY_FIL;
    telegramApi = TelegramApiImpl(httpClient);
  }

  final getUpdateQuery = "getUpdates";
  final messageQuery = "sendMessage";
  final mainApi = "api.telegram.org";
  final updateIdKey = "offset";
  final chadIdKey = "chat_id";
  final textKey = "text";

  @override
  Future<GetUpdateData> getUpdates() async {
    final uri = Uri.https(mainApi, "${botId}${getUpdateQuery}",
        getUpdateParameters(lastUpdateId));
    var data = await telegramApi.getUpdates(uri.toString());

    if (data.result.isNotEmpty) {
      var lastMsg = data.result.last;
      lastUpdateId = lastMsg.updateId + 1;
    }

    return data;
  }

  @override
  void sendMessage(String message) {
    final uri = Uri.https(
        mainApi, "${botId}${messageQuery}", getMessageParameters(message));
    telegramApi.sendMessage(uri.toString());
  }

  Map<String, String> getUpdateParameters(int updateId) {
    return {updateIdKey: updateId.toString()};
  }

  Map<String, String> getMessageParameters(String message) {
    return {
      chadIdKey: secretChatId,
      textKey: message,
    };
  }
}
