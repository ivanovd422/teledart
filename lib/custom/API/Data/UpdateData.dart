// To parse this JSON data, do
//
//     final getUpdateData = getUpdateDataFromJson(jsonString);

import 'dart:convert';

class GetUpdateData {
  bool ok;
  List<Result> result;

  GetUpdateData({
    this.ok,
    this.result,
  });

  factory GetUpdateData.fromRawJson(String str) =>
      GetUpdateData.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory GetUpdateData.fromJson(Map<String, dynamic> json) => GetUpdateData(
        ok: json["ok"] as bool,
        result: List<Result>.from(json["result"]
                .map((x) => Result.fromJson(x as Map<String, dynamic>))
            as Iterable),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": new List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  int updateId;
  Message message;

  Result({
    this.updateId,
    this.message,
  });

  factory Result.fromRawJson(String str) =>
      Result.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        updateId: json["update_id"] as int,
        message: Message.fromJson(json["message"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "update_id": updateId,
        "message": message.toJson(),
      };
}

class Message {
  int messageId;
  From from;
  Chat chat;
  int date;
  String text;
  List<Entity> entities;

  Message({
    this.messageId,
    this.from,
    this.chat,
    this.date,
    this.text,
    this.entities,
  });

  factory Message.fromRawJson(String str) =>
      Message.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"] as int,
        from: From.fromJson(json["from"] as Map<String, dynamic>),
        chat: Chat.fromJson(json["chat"] as Map<String, dynamic>),
        date: json["date"] as int,
        text: json["text"] as String,
        entities: json["entities"] == null
            ? null
            : List<Entity>.from(json["entities"]
                    .map((x) => Entity.fromJson(x as Map<String, dynamic>))
                as Iterable),
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "from": from.toJson(),
        "chat": chat.toJson(),
        "date": date,
        "text": text,
        "entities": entities == null
            ? null
            : List<dynamic>.from(entities.map((x) => x.toJson())),
      };
}

class Chat {
  int id;
  String title;
  String type;
  bool allMembersAreAdministrators;

  Chat({
    this.id,
    this.title,
    this.type,
    this.allMembersAreAdministrators,
  });

  factory Chat.fromRawJson(String str) =>
      Chat.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"] as int,
        title: json["title"] as String,
        type: json["type"] as String,
        allMembersAreAdministrators:
            json["all_members_are_administrators"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "all_members_are_administrators": allMembersAreAdministrators,
      };
}

class From {
  int id;
  bool isBot;
  String firstName;
  String username;
  String languageCode;

  From({
    this.id,
    this.isBot,
    this.firstName,
    this.username,
    this.languageCode,
  });

  factory From.fromRawJson(String str) =>
      From.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory From.fromJson(Map<String, dynamic> json) => From(
        id: json["id"] as int,
        isBot: json["is_bot"] as bool,
        firstName: json["first_name"] as String,
        username: json["username"] as String,
        languageCode: json["language_code"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_bot": isBot,
        "first_name": firstName,
        "username": username,
        "language_code": languageCode,
      };
}

class Entity {
  Entity({
    this.offset,
    this.length,
    this.type,
  });

  int offset;
  int length;
  String type;

  factory Entity.fromRawJson(String str) =>
      Entity.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        offset: json["offset"] as int,
        length: json["length"] as int,
        type: json["type"] as String,
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "length": length,
        "type": type,
      };
}
