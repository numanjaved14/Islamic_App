// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:islamicapp/authentications/providers/database_services.dart';
import 'package:islamicapp/authentications/providers/usermodel.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;
  final DataBaseMethods _dataBaseMethods = DataBaseMethods();

  UserModel get getUser => _userModel!;

  Future<void> refreshUser() async {
    UserModel userModel = await _dataBaseMethods.getUserDetails();
    _userModel = userModel;
    notifyListeners();
  }
}
