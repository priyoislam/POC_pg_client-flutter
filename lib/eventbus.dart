import 'package:get_it/get_it.dart';
import 'package:event_bus/event_bus.dart';

final getIt = GetIt.instance;
final hub = getIt<MessageHub>();

class MessageHub {
  EventBus mailBoxes;

  MessageHub() {
    this.mailBoxes = EventBus();
  }

  void send(msg) {
    mailBoxes.fire(msg);
  }

  Stream<T> on<T>() {
    return mailBoxes.on<T>();
  }
}
