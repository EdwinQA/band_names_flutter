import 'package:flutter/cupertino.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService() {
    _initConfig();
  }

  late IO.Socket _socket;

  IO.Socket get socket => this._socket;

  ServerStatus get serverStatus => this._serverStatus;

  void _initConfig() {
//Dart IO Client
    this._socket = IO.io('https://flutter-socket-server-p5.herokuapp.com/', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    this._socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
      //socket.emit('mensajealservidor', {'nombre': 'fernando'});
    });
    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on('respuestaalcliente', (data) {
    //   print('mensaje del servidor');
    //   print('nombre: ' + data['nombre']);
    //   print(data.containsKey('nombre2')?data['nombre2']:'no hay');
    // });
  }
}
