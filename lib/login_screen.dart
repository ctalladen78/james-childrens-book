import 'package:flutter/material.dart';
import 'package:james_childrens_app/services/login_service.dart' ;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:james_childrens_app/services/db_service.dart';
import 'package:james_childrens_app/services/model_builder.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  LoginService _login;
  ModelBuilder _modelBuilder;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    _login = new LoginService(context);
        _modelBuilder = new ModelBuilder();

  }

  _initLogin(){
    _login.googleLogin().then((data) async { if(data){
      print("USER is verified: $data");
      // TODO save user information 
      // TODO use user information and pass into profile screen
      Map<String, dynamic> user = await _login.getUserProfile();
      _modelBuilder.saveProfile(user);
      Navigator.pushReplacementNamed(context, "/home_screen");
    }});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.blueGrey, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(
                  size: _iconAnimation.value * 140.0,
                ),
                new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Form(
                    autovalidate: true,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new MaterialButton(
                          height: 50.0,
                          minWidth: 150.0,
                          color: Colors.blueAccent,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Icon(FontAwesomeIcons.google),
                              new Text("Login with Google"),
                            ],
                          ),
                          onPressed: (){_initLogin();},
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Enter Email", fillColor: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                      ],
                  ),
                ),
              )
            ],
            ),
          ),
        ),
      ]),
    );
  }
}