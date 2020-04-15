import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _url="https://owlbot.info/api/v4/dictionary/";
  String _token="775a7712db1c952807635876d2fe6aea763908b9";
  StreamController _streamController;
  Stream _stream;

  TextEditingController _textController = TextEditingController();
  _search() async{
   if(_textController.text==null || _textController.text.length==0){
     _streamController.add(null);
   }
   Response response = await get(_url, headers: {"Authorization" : "Token "+ _token});
   _streamController.add(json.decode(response.body));

  }

  @override
  void initState(){

    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(58.0),

          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20,top: 10,bottom: 20 ),

                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    onChanged: (String text){


        },
                    controller: _textController,

                    decoration: InputDecoration(hintText: "Search a word",
                    contentPadding: EdgeInsets.only(left: 28),
                    border: InputBorder.none),
                  ),
                ),
              ),
              

              
              IconButton(onPressed: (){_search();},icon: Icon(Icons.search,color: Colors.white,))
            ],
          ),


        ),

        title: Text("Meanory"),
      ),
      body: StreamBuilder(builder: null)

    );
  }
}
