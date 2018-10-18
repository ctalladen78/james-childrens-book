
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import "package:simple_auth/simple_auth.dart" as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';


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
        "597309653078-8u2gpe69auor8fa6ao8e4bpg730las7m.apps.googleusercontent.com",
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

  Future<bool> getUserProfile() async {
    googleApi.getUserProfile().then((data){
      // print(data.toJson());
      // var jsonData = data.toJson();
      // print(jsonData["id"]);
    });
    googleApi.authenticate().then((data){
      var json = data.toJson();
      // print("Oauth data: $json");
    });
    var isValid = await googleApi.verifyCredentials();  
    if(!isValid) {return false;}
    return true;
  }
}