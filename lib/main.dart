import 'package:flutter/material.dart';
import 'dart:async';
import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Most amazing dogs around!',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orange[800],
      ),
      home: MyHomePage(
        title: 'Most amazing dogs around!',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dogs> initialDogs = []
    ..add(Dogs('akita'))
    ..add(Dogs('appenzeller'))
    ..add(Dogs('boxer'))
    ..add(Dogs('dingo'))
    ..add(Dogs('beagle'))
    ..add(Dogs('husky'));

  Future _showNewDigimonForm() async {
    Dogs newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDigimonFormPage();
    }));
    //print(newDigimon);
    if (newDog != null) {
      initialDogs.add(newDog);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent[700],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDigimonForm,
          ),
        ],
      ),
      body: new Container(
          color: Colors.orange[600],
          child: new Center(
            child: new DogList(initialDogs),
          )),
    );
  }
}
