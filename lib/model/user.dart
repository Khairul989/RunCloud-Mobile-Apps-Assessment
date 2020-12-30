import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  String username;
  String ipAddress;
  String ipAddress1;
  User({this.username, this.ipAddress, this.ipAddress1});

  String get getUserName {
    return username;
  }

  User copyWith({
    String username,
    String ipAddress,
  }) {
    return User(
      username: username ?? this.username,
      ipAddress: ipAddress ?? this.ipAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'ipAddress': ipAddress,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      username: map['username'],
      ipAddress: map['ipAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(username: $username, ipAddress: $ipAddress)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.username == username && o.ipAddress == ipAddress;
  }

  @override
  int get hashCode => username.hashCode ^ ipAddress.hashCode;

  void set setUserName(String username) {
    this.username = username;
  }

  String connectServer(User u) {
    String server = '';
    if (u.ipAddress1 != null) {
      server = 'server1&2';
    } else {
      server = 'server1';
    }
    return server;
  }

  bool subscribe(Object basicPlan) {
    return BasicPlan().subscribe(basicPlan);
  }
}

class BasicPlan extends User {
  bool subscription = false;
  bool subscribe(Object basicPlan) {
    subscription = true;
    return subscription;
  }
}

class ProPlan extends User {
  bool subscription = false;
  bool subscribe(Object proplan) {
    subscription = true;
    return subscription;
  }
}
