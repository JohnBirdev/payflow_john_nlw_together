
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow_john_nlw6/modules/home/home_page.dart';
import 'package:payflow_john_nlw6/modules/login/login_page.dart';
import 'package:payflow_john_nlw6/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthController{
  //var _isAuthenticated = false;
 UserModel? _user;
 UserModel get user => _user!;
  void setUser(BuildContext context,UserModel? user){
    if(user != null){
      savedUser(user);
      _user = user;
     // _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, "/home",arguments: user);
    }
    else{
   //   _isAuthenticated = false;
            Navigator.pushReplacementNamed(context,"/login");
    }

  
  }
  Future<void> savedUser(UserModel user) async{
    final instance = await SharedPreferences.getInstance();
  await instance.setString("user", user.toJson());
  return;
  }
    Future<void> currentUser(BuildContext context) async{
    final instance = await SharedPreferences.getInstance(); 
await Future.delayed(Duration(seconds: 2));
if(instance.containsKey("user")){
   final json = instance.get("user") as String;
 setUser(context, UserModel.fromJson(json));
  return;
}else{
  setUser(context, null);
}
  }
}