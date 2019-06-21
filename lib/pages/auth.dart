import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String emailValue;
  String passwordValue;
  bool _acceptTerms = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget _buildEmailTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }
      },
      decoration: InputDecoration(
        labelText: 'Email ID',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        setState(() {
          emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: true,
      onSaved: (String value) {
        setState(() {
          passwordValue = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitchTile() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  void _submitForm() {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/food.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Form(
            key: _globalKey,
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    _buildAcceptSwitchTile(),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      child: Text('Login'),
                      onPressed: _submitForm,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
