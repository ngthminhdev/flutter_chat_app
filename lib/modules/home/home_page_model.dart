import 'package:mc_application/core/bases/base_page_model.dart';
import 'package:mc_application/core/models/user_model.dart';
import 'package:mc_application/services/local_storage_service.dart';
import 'package:mc_application/services/socket_service.dart';

class HomePageModel extends BasePageModel {
  final LocalStorageService localStorage = LocalStorageService();
  late SocketService socket;

  Future<void> initializeSocketService() async {
    // UserModel? user = await localStorage.getUserInfo();
    // print(user!.accessToken);
    
    socket = SocketService(authorizationToken: '');
    socket.onEvent('connect', (data) => print('Socket is connected!, $data'));

    socket.emitEvent('test', '(data) => print(data)');
  }
}
