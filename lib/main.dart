@JS()
library main;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

@JS('setLicenseKey')
external void setLicenseKey(String key);

@JS('loadPdf')
external void loadPdf();

void main() {
  setLicenseKey("Aa5ctxMMwxipLkMtAO1-lW6YSanOyjKhfK2qglok1btZmDbFTqvnXbh8FvAN9U06n7iTj7KVRnqMCkkFoZGJv04_p36gSTktxJijPYu4vTXGfIKMZA_Sm3kb5zONLCQK-zKRpY6WcDZ79ui6OkH6m2tIPHilB_fQ2mJPyGJWLloXpp0JKniMxKLAdOuhsspgf6PYj8mtzlSbl5CXpdu8W7mLMo6UJSBdGFMzf6AKfCkjUpt36AJI6YhapKko0J1Ql87gKXgWjFimgoUZCkOi37DucU6qDWWGzq-vuiMAYZO232zHn4Bu3mt773FWb86uUsOErY43fveIYek8IQaTa2e6pe4YNTvpfe42OnvRx72a5-1fNQYOonwLcGDUFuFheIX_tMUGuPgwXhpjkD0pNi0I-5bGuG63mKGUEPUY35akiefyLVwW7saN-Ss7jH1WUMOiuWsxtB7qxuX0Gf73Pw==");

  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  void load() {
    loadPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            tooltip: 'Next',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SecondRoute()));
            },
          ),
        ],
      ),
      body: Stack(children: <Widget>[
        MyHtmlView(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          load();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
    );
  }
}

class MyHtmlView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHtmlViewState();
  }
}

class MyHtmlViewState extends State<MyHtmlView>{
  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('viewType', (int viewId) {
      final div = html.DivElement()
        ..id = 'myPdfDiv'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.position = 'fixed'
        ..style.top = '0px';
      return div;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
          viewType: 'viewType',
        );
  }
}
