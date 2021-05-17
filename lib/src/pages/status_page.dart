import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names_flutter/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      body: Center(
        child: Text('${socketService.serverStatus}'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.assistant_navigation),
        onPressed: () {
          socketService.socket.emit('mensajealservidor',
              {'nombre': 'edwin', 'mensaje': 'Hola desde flutter'});
        },
      ),
    );
  }
}
