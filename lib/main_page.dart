import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'register-page.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  void _loginSave() {
    print(_email + _password);
  }

  Widget _buildLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage("images/image1.png"),
            radius: 60,
          ),
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.lightBlueAccent,
            ),
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.lightBlueAccent),
            )),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Email';
          }
        },
        onSaved: (val) => setState(() => _email = val),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.lightBlueAccent,
          ),
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.lightBlueAccent),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Password';
          }
        },
        onSaved: (val) => setState(() => _password = val),
      ),
    );
  }

  Widget _buildLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _loginSave();
              }
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 40),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegister() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => RegisterPage()));
            },
            child: Text(
              'Register/Create New Account',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildEmail(),
                      _buildPassword(),
                      _buildLogin(),
                    ],
                  ),
                ),
                _buildRegister(),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(70),
                      bottomRight: const Radius.circular(70),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildLogo(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Welcome to My System',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildContainer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
