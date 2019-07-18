import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import '../Data/UpdateData.dart';
import 'TelegramApi.dart';

class TelegramApiImpl extends TelegramApi {

  HttpClient client;

  TelegramApiImpl(HttpClient client) {
    this.client = client;
  }
  @override
  Future<GetUpdateData> getUpdates(String uri) async {
    final request = await client.getUrl(Uri.parse(uri));
    final response = await request.close();
    GetUpdateData result;

    await for (var contents in response.transform(Utf8Decoder())) {
      print(contents);
      result = GetUpdateData.fromRawJson(contents);
      print(result.result);
    }

    return result;
  }

  @override
  Future<Void> sendMessage(String uri) async {
    final request = await client.getUrl(Uri.parse(uri));
    final response = await request.close();
  }
}
