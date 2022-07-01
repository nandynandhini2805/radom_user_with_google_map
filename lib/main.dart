// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task1/model/radom_users.dart';
import 'package:http/http.dart' as http;
import 'package:task1/screens/gender_map_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(
        title: appTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  RadomUsers radomUsers;

  List<Results> list;

  List filteredGender = [];

  Future getDataFromApi() async {
    final url = Uri.parse('https://randomuser.me/api/?results=10');
    final response = await http.get(url);
    radomUsers = RadomUsers.fromJson(jsonDecode(response.body));
    return radomUsers.results;
  }

  void filterGenderList(value) {
    setState(() {
      if(value == "male"){
           filteredGender =
              list.where((element) => (element.gender == "male")).toList();
      }else{
           filteredGender =
              list.where((element) => element.gender == "female").toList();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    getDataFromApi().then((value) {
      setState(() {
        list = filteredGender = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      body: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: drawerItems(),
          ),
          body: myMainList()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            getDataFromApi().then((value) {
              setState(() {
                list = filteredGender = value;
              });
              widget.title = "Home";
            });
          });
        },
      ),
    );
  }

  Widget drawerItems() {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(
                  "Male",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.title = "Male";
                    Navigator.pop(context);
                    filterGenderList('male');
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(
                  "Female",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.title = "Female";
                    Navigator.pop(context);
                    filterGenderList('female');
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(
                  "Map",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GenderMap()));
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myMainList() {
    return ListView.builder(
        itemCount: filteredGender.length,
        itemBuilder: (context, i) {
          final k = filteredGender[i];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(k.picture.large.toString())),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Name: " +
                              k.name.first.toString() +
                              " " +
                              k.name.last.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("D.o.B: " + k.dob.date.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Email Id: " + k.email.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Address: " +
                                k.location.street.number.toString() +
                                "," +
                                k.location.street.name.toString() +
                                "," +
                                k.location.city.toString() +
                                "," +
                                k.location.state.toString() +
                                "," +
                                k.location.country.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Phone No: " + k.phone.toString()),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
