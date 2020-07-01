import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MovieZone(),
    );
  }
}

class MovieZone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieZoneState();
  }
}

class MovieZoneState extends State<MovieZone> {
 
  final String url = "";
  TextEditingController movieController =
      TextEditingController(text: "ms dhoni");
  var res;
  var conv;
  //movie variables
  String title = "M.S. Dhoni: The Untold Story";
  String year = "30 Sep 2016";
  String poster =
      "https://m.media-amazon.com/images/M/MV5BZjAzZjZiMmQtMDZmOC00NjVmLTkyNTItOGI2Mzg4NTBhZTA1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg";
  String runtime = "184 min";
  String director = "Neeraj Pandey";

  String imdbRating = "7.7";
  String boxoffice = "\$1,782,795";
  String country = "India";
  String actors =
      "Sushant Singh Rajput, Kiara Advani, Anupam Kher, Disha Patani";
  String plot = "The untold story of Mahendra Singh Dhoni's journey from ticket collector to trophy collector - the world-cup-winning captain of the Indian Cricket Team.";


  Future<String> getJsonData() async {
    res = await http.get(
        Uri.encodeFull(
            "http://omdbapi.com/?apikey=<your_API_key>&t=${movieController.text}"),
        headers: {"Accept": "application/json"});

    setState(() {
      conv = json.decode(res.body);
      title = conv['Title'];
      year = conv['Released'];
      poster = conv['Poster'];
      runtime = conv['Runtime'];
      director = conv['Director'];

      imdbRating = conv['imdbRating'];
      boxoffice = conv['BoxOffice'];
      country = conv['Country'];
      actors = conv['Actors'];
      plot= conv['Plot'];

      print(conv['Title']);
    });
    return "Sucess";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Movie Zone"))),
      body: SingleChildScrollView(
        child: Container(
//          padding: EdgeInsets.only(top: 20),
          child: Column(

            children: [
              Padding(
                padding: EdgeInsets.only(top:10),

                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Padding(padding: EdgeInsets.only(left: 50)),
                      TextField(

                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Movie Name ...'),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        controller: movieController,

                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      RaisedButton(
                        elevation: 5,
                        child: Text(
                          "Find",
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),

                        ),
                        onPressed: () =>
                            movieController.text !=null ? getJsonData() : "",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,

                    width: 2),

                ),
//                padding: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),

                height: 500,
                child: SingleChildScrollView(
                  reverse: true,

                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Image.network("$poster", height: 300, width: 300)),
                              Padding(padding: EdgeInsets.only(top: 15)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Title :$title",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Release Year:$year",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Runtime : $runtime",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Director : $director",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Boxoffice : $boxoffice",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Country : $country",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Actors : $actors",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Plot : $plot",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 15  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
