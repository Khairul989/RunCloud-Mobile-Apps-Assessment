import 'package:flutter/material.dart';
import 'package:runcloud_assessment/model/user.dart';
import 'package:runcloud_assessment/pages/planoption.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(
          'Runcloud Subscription',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 250,
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome to RunCloud.io',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Form(
                      key: _formkey,
                      child: TextFormField(
                        validator: Validators.compose([
                          Validators.required('Please Enter your username')
                        ]),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Enter your username',
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[800]),
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() => username = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ButtonTheme(
                      minWidth: 150,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'Plan Subscription',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            User u = new User(username: username);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlanOption(u)),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
