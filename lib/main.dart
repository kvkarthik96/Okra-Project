import 'package:flutter/material.dart';
import 'package:okra_widget/models/okra_handler.dart';
import 'package:okra_widget/okra.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var banks = [
              "first-bank-of-nigeria",
              "united-bank-for-africa",
              "guaranty-trust-bank",
              "access-bank",
              "zenith-bank",
              "kuda-bank",
              "stanbic-ibtc-bank",
              "first-city-monument-bank"
            ];
            var okraOptions = {
              "key": "", //  add your key
              "token": "",  // add your token
              "products": ["auth", "balance", "identity", "transactions"],
              "env": "production-sandbox",
              "clientName": "PeerPay",
              "color": "#9013FE",
              "limit": "3",
              "isWebview": true,
              "isCorporate": false,
              "connectMessage": "Which account do you want to connect with?",
              "callback_url": "",
              "redirect_url": "",
              "short_url": "",
              "logo": "",
              "widget_success": "Your account was successfully linked",
              "widget_failed": "An unknown error occurred, please try again.",
              "currency": "NGN",
              "noPeriodic": true,
              "exp": "",
              "success_title": "null",
              "success_message": "null",
              "guarantors": {
                "status": false,
                "message": "Okra requires you to add guarantors",
                "number": 3,
              },
              "filter": {"industry_type": "all", "banks": banks},
              // "debitLater": true,
              // "debitAmount": 10000,
              // "debitType": 'one-time',
              // "debitStartDate": '2021-10-10',
              // "debitEndDate": '2022-10-10',
              // "debitInterval": 'monthly',
            };

            OkraHandler reply = await Okra.create(context, okraOptions);
            print("++++++++++++++++");
            print(reply.toString());

            print("reply.data:${reply.data}");

            print(reply.hasError);
            print(reply.runtimeType);

            print("reply.onClose:${reply.onClose}");
            print("reply.isSuccessful:${reply.isSuccessful}");
            print("++++++++++++++++");
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
