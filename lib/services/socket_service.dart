import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  io.Socket? _socket;
  String? authorizationToken;

  //init
  SocketService({required this.authorizationToken}) {
    print('Connecting to socket');
    Map<String, dynamic> query = {
      'authorization': authorizationToken,
    };
    _socket = io.io(
        // 'http://13.228.119.159:8000/socket',
        // 'http://172.16.3.224:8000/socket',
        'http://192.168.150.111:3000',
        io.OptionBuilder()
            .setTransports(['websocket', 'polling'])
            .disableAutoConnect()
            .setAuth({'authorization': authorizationToken})
            .setExtraHeaders({'authorization': authorizationToken})
            .build());
    _socket?.connect();
  }

  void onEvent(String eventName, Function(dynamic data) callback) {
    _socket?.on(eventName, (data) {
      callback(data);
    });
  }

  void emitEvent(String eventName, dynamic data) {
    _socket?.emit(eventName, data);
  }

  void closeConnection() {
    _socket?.disconnect();
  }
}