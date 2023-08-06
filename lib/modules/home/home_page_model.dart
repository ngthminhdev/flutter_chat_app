import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mc_application/app_data.dart';
import 'package:mc_application/core/bases/base_page_model.dart';
import 'package:mc_application/core/models/user_model.dart';
import 'package:mc_application/services/local_storage_service.dart';
import 'package:mc_application/services/socket_service.dart';
import 'package:http/http.dart' as http;

class HomePageModel extends BasePageModel {
  final LocalStorageService localStorage = LocalStorageService();
  late SocketService socket;
  late List<dynamic> conversationList = [];

  Future<void> initializeSocketService() async {
    UserModel? user = await localStorage.getUserInfo();

    socket = SocketService(authorizationToken: user!.accessToken);
    socket.onEvent('connect', (data) => print('Socket is connected!'));
  }

  Future<void> getConversation() async {
    try {
      UserModel? user = await localStorage.getUserInfo();
      final response = await http.get(
          headers: {'authorization': 'Bearer ${user!.accessToken}'},
          // Uri.parse('http://172.16.3.224:8000/api/auth/login'),
          Uri.parse('${appData.apiHost}/api/chat/list'));

      if (response.statusCode == 200) {
        final userJson = jsonDecode(response.body)["data"];
        conversationList =
            userJson.map((user) => UserModel.fromJson(user)).toList();
        print(conversationList);
      } else {
        Fluttertoast.showToast(msg: jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }

  void onConversationClick(String userId) {
    print('click on $userId');
  }
}
