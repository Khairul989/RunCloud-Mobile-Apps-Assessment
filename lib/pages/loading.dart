import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:runcloud_assessment/model/user.dart';
import 'package:runcloud_assessment/pages/subscribePlan.dart';

class LoadingUpgrade extends StatefulWidget {
  User u;
  String subscription = '';
  LoadingUpgrade(user, String subscription) {
    this.u = user;
    this.subscription = subscription;
  }

  @override
  _LoadingUpgradeState createState() => _LoadingUpgradeState(u, subscription);
}

class _LoadingUpgradeState extends State<LoadingUpgrade> {
  User u;
  String subscription = '';
  bool loading = true;

  _LoadingUpgradeState(user, subscription) {
    this.u = user;
    this.subscription = subscription;
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

  @override
  Widget build(BuildContext context) {
    _asyncMethod();
    return loading
        ? Container(
            color: Colors.blue,
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 70,
            ),
          )
        : SubscribedPlan(u, subscription);
  }
}
