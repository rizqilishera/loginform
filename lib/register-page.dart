import 'package:flutter/material.dart';

void main() => runApp(RegisterPage());

class RegisterPage extends StatefulWidget {
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  void _registerSave() {
    print(_email + _password);
  }
  Widget _buildEmail() {
    return TextFormField(
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
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter Email';
        }
      },
      onSaved: (val) => setState(() => _email = val),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
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
    );
  }

  Widget _buildSave() {
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
                _registerSave();
              }
              ;
            },
            child: Text(
              'Register Here',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Create a New Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildEmail(),
              SizedBox(
                height: 15.0,
              ),
              _buildPassword(),
              SizedBox(
                height: 15.0,
              ),
              _buildSave(),
            ],
          ),
        ),
      ),
    );
  }
}