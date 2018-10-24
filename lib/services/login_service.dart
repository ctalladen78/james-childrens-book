
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import "package:simple_auth/simple_auth.dart" as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
import 'package:james_childrens_app/keys.dart';

class LoginService {
  simpleAuth.GoogleApi googleApi;
  simpleAuth.FacebookApi facebookApi;
  
  LoginService(BuildContext context){
    _init();
    SimpleAuthFlutter.init(context);
  }

// https://developers.google.com/identity/protocols/googlescopes
// https://developers.google.com/people/
// https://developers.google.com/+/web/api/rest/oauth#authorization-scopes
// https://developers.google.com/identity/sign-in/android/backend-auth
// https://developers.google.com/identity/protocols/OAuth2UserAgent#validate-access-token
  void _init() {
    googleApi = new simpleAuth.GoogleApi("google",
        CLIENT_ID,
        clientSecret: "",
        scopes: [
          "https://www.googleapis.com/auth/userinfo.email",
          "https://www.googleapis.com/auth/userinfo.profile",
        ]);

// https://pub.dartlang.org/packages/simple_auth/versions/1.0.1#-example-tab-
/*
    facebookApi =
      new simpleAuth.FacebookApi("facebook", "clientId", "clientSecret");
      */
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    return googleApi.getUserProfile().then((data){
      // print(data.toJson());
      var jsonData = data.toJson();
      // print(jsonData);
      return jsonData;
    });
    // googleApi.authenticate().then((data){
    //   var json = data.toJson();
    //   // print("Oauth data: $json");
    // });
  }
  
  Future<bool> googleLogin() async {
    var isValid = await googleApi.verifyCredentials();  
    if(!isValid) {return false;}
    return true;
  }

  Future<bool> googleLogout() async {
    var logout = await googleApi.logOut();
    return logout;
  }
}