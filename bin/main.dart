import 'dart:isolate';
import 'package:teledart/teledart.dart';
import 'clientStarter.dart';

Future main() async {
  final app = Application<TeledartChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  startIsolate();
  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}

void startIsolate() async {
  ReceivePort receivePort = ReceivePort();
  Isolate newIsolate =
      await Isolate.spawn(startClientSide, receivePort.sendPort);
}

void startClientSide(SendPort sendPort) {
  final client = ClientStarter();
  client.startLoop();
}
