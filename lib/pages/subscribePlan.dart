import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:runcloud_assessment/model/user.dart';
import 'package:runcloud_assessment/pages/homepage.dart';
import 'package:runcloud_assessment/pages/loading.dart';

class SubscribedPlan extends StatefulWidget {
  User u;
  String subscription = '';
  SubscribedPlan(user, String subscription) {
    this.u = user;
    this.subscription = subscription;
  }
  @override
  _SubscribedPlanState createState() => _SubscribedPlanState(u, subscription);
}

class _SubscribedPlanState extends State<SubscribedPlan> {
  User u;
  String subscription = '';
  bool loading = true;
  bool basic = true;

  bool checkSubscription(String sub) {
    if (sub == 'Pro') {
      basic = false;
    }
    return basic;
  }

  void _asyncMethod() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  _SubscribedPlanState(user, subscription) {
    this.u = user;
    this.subscription = subscription;
  }

  @override
  Widget build(BuildContext context) {
    _asyncMethod();
    checkSubscription(subscription);
    return loading
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[700],
              title: Text('Subscribed Plan'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Congratulations !',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'You have subscribed to ' + subscription,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                    ),
                    basic
                        ? Text(
                            'Connecting to Server 1 ',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        : Text(
                            'Connecting to Server 1 and server 2',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.blue,
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[700],
              title: Text('Subscribed Plan'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Congratulations !',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'You have subscribed to ' + subscription,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Connected',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Plan Details',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    basic
                        ? Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.supervised_user_circle,
                                      size: 70),
                                  title: Text(
                                    'Basic Plan',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Server 1: ${u.ipAddress}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Server 2: Not supported',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ButtonTheme(
                                  minWidth: 150,
                                  height: 50,
                                  child: RaisedButton(
                                    child: Text(
                                      'Upgrade to Pro',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      subscription = "Pro";
                                      User user = new User(
                                          username: u.username,
                                          ipAddress: u.ipAddress,
                                          ipAddress1: '192.168.33.12');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  LoadingUpgrade(
                                                      user, subscription)));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        : Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.supervised_user_circle,
                                        size: 70),
                                    title: Text(
                                      'Pro Plan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Server 1: ${u.ipAddress}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            'Server 2: ${u.ipAddress1}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: 150,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          'Unsubscribe',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.blue,
          );
  }
}
