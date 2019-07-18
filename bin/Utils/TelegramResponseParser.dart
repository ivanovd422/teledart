import '../API/Data/UpdateData.dart';

class TelegramResponseParser {
  bool isShouldAnswer(GetUpdateData data) {
    const mentionType = "mention";
    const weatherPattern = "погода";

    if (data.result.isEmpty) {
      return false;
    }

    final firstMsg = data.result.first.message;

    if (firstMsg.entities == null || firstMsg.entities.isEmpty) {
      return false;
    }

    final firstEntity = firstMsg.entities.first;

    if (firstEntity.type != mentionType) {
      return false;
    }

    final text = firstMsg.text;

    if (text == null || text.isEmpty) {
      return false;
    } else {
      text.toLowerCase();
    }

    if (!firstMsg.text.contains(weatherPattern)) {
      return false;
    }

    return true;
  }

  dynamic getCityId(GetUpdateData data) {
    var msgText = data.result.first.message.text;



    return null;
  }

}
