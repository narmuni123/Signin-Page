import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isHiddenPassword = true;

  void _togglePasswordView(){
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.only(top: 45),
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: _isHiddenPassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child:  Text('Show',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                              ),
                            ),
                          )
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.only(top: 45),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        print(_emailController.text);
                        print(_passwordController.text);
                      },
                    )
                ),
                FlatButton(child:
                Text('New User? Register',),
                  onPressed: () {
                  // navigate to the registration screen.
                  },
                ),
              ],
            )
        )
    );
  }
}