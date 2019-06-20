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

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Email ID'),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      onChanged: (String value) {
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

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: <Widget>[
            _buildEmailTextField(),
            _buildPasswordTextField(),
            _buildAcceptSwitchTile(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            )
          ],
        ),
      ),
    );
  }
}
