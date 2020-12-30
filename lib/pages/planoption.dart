import 'package:flutter/material.dart';
import 'package:runcloud_assessment/model/user.dart';
import 'package:runcloud_assessment/pages/subscribePlan.dart';

class PlanOption extends StatefulWidget {
  final User u;
  PlanOption(this.u);

  @override
  _PlanState createState() => _PlanState(u);
}

class _PlanState extends State<PlanOption> {
  User u;
  String subscription = '';
  _PlanState(User u) {
    this.u = u;
  }
  String username, connectedServer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ' + u.username,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Please choose your desired plan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.store_mall_directory, size: 70),
                          title: Text(
                            'Basic Plan',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Server 1: 192.168.33.11',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Subscribe',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  subscription = 'Basic';
                                  User user = new User(
                                      username: u.getUserName,
                                      ipAddress: '192.168.33.11');
                                  subscription = 'Basic Plan';
                                  if (subscription == 'Basic Plan') {
                                    String server = u.connectServer(user);
                                    connectedServer = server;
                                  }
                                  bool plan = u.subscribe(new BasicPlan());
                                  if (plan == true &&
                                      connectedServer == 'server1') {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SubscribedPlan(
                                              user, subscription)),
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle, size: 70),
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
                                Text(
                                  'Server 1: 192.168.33.11',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Server 2: 192.168.33.12',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Subscribe',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  subscription = 'Pro';
                                  User user = new User(
                                      username: u.getUserName,
                                      ipAddress: '192.168.33.11',
                                      ipAddress1: '192.168.33.12');

                                  if (subscription == 'Pro') {
                                    String server = u.connectServer(user);
                                    connectedServer = server;
                                  }
                                  bool plan = u.subscribe(new ProPlan());
                                  if (plan == true &&
                                      connectedServer == 'server1&2') {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SubscribedPlan(
                                              user, subscription)),
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
