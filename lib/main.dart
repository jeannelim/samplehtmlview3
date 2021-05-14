@JS()
library main;

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:pointer_interceptor/pointer_interceptor.dart';

@JS('setLicenseKey')
external void setLicenseKey(String key);

@JS('loadPdf')
external void loadPdf();

void main() {
  setLicenseKey("XwOUG_sN2zXcnlg-iTrQKenBfRXgvpAmFUKc4JX2c8QgXt4mnBcwUC9spJ71l-0a8ktpuTN7T8eMf_P092dB4pq3zcboVIfwEP_ICi9FvOwSezOtuszCZkEhsTp_gXClwPKO-E-edSyaTO9BffCZ9XrZkZbQOhOu_GmX2O3sv7o--ktEKRvddW3k8BRSg1Fca9Y3gwvLVXalIK3U3FQsWlfnrK6KklL-deyXtycrporCVnVlWb7wTvqirngJFZ9Og7OZF5A4TvsjGEPYnNvI2f4KWI7p0OHefThh5rIH6fg86n_Oj0A2wCWIv7tf-LZQj1rjdw7PvkOvZI0O1KDgYHvM9RgaArJ46qJqkizHRV09YgweeUzLBouJXjalhCkOYy0dFOv_Bhf2oW7aLEgxpqODRuHCZue1SwU6QQMk2vSnfxbiPyWyrIwBck6hKCtlYNfcpxUE_M_L_XRrlpNPKw==");  
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
      floatingActionButton: PointerInterceptor(
              child: FloatingActionButton(
          onPressed: () {
            load();
          },
          child: Icon(Icons.add),
        ),
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
        ..style.height = '100%';
        //..style.position = 'fixed'
        //..style.top = '0px';
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
