import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

launchurl() async {
  const url = 'https://www.youtube.com/channel/UCS3brcF49FE3japE2xM-8gg';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}

launchUrl() async {
  const String uri = 'https://www.youtube.com';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw '$uri unaqa narsani birinchi marta ko\'rishim!';
  }
}

Future<void> telCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'unaqa nomer yoqku';
  }
}

smsLaunch(String sms) async {
  if (await canLaunch(sms)) {
    await launch(sms);
  } else {
    throw 'Shunaqa nomer borakanmi?';
  }
}

mailTo(String mail) async {
  if (await canLaunch(mail)) {
    await launch(mail);
  } else {
    throw 'tog\'ri';
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Url Launcher'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            // reverse: true,
            children: [
              const ElevatedButton(
                  onPressed: launchUrl, child: Text('Launch in Browser')),
              const ElevatedButton(
                  onPressed: launchurl, child: Text('Launch in Browser')),
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.phone,
                onChanged: (text) {
                  text = textEditingController.text;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    telCall('tel:${textEditingController.text}');
                  },
                  child: const Text('Launch in Call')),
              TextField(
                controller: textEditingController2,
                keyboardType: TextInputType.phone,
                onChanged: (text2) {
                  text2 = textEditingController2.text;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    smsLaunch('sms:${textEditingController2.text}');
                  },
                  child: const Text('Launch in Sms')),
              TextField(
                controller: textEditingController3,
                keyboardType: TextInputType.emailAddress,
                onChanged: (text3) {
                  text3 = textEditingController3.text;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    mailTo('mailto:${textEditingController3.text}');
                  },
                  child: const Text('Launch in Email')),
            ],
          ),
        ),
      ),
    );
  }
}
