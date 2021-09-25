import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  AnaEkran createState() => AnaEkran();
}


class AnaEkran extends State<HomeScreen> {
  static List<String> mainDataList = [
    "Alien",
    "Arya",
    "Atilla",
    "BigPapa",
    "Coconut",
    "aLoNeAnqeL",
    "GameKinq ",
    "Angelofdeath",
    "DefendYourSeLf ",
    "Fearless",
    "Okeanos",
    "LiveYourLife",
    "MassiveStroke",
    "Papaya",
    "NightWish",
    "Nemesis",
    "Pomegranate",
    "SaviorAngel"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Best Cool NickNames'),
            backgroundColor: Colors.deepPurple,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.article_rounded)),
               // Tab(icon: Icon(Icons.favorite)),
              ],
            ),
          ),
          body: ListView.builder(
            itemCount: mainDataList.length,
            itemBuilder: (context, index) {
           return Card (
             child: Padding(
             padding: const EdgeInsets.all(20.0),
                child: Text(mainDataList[index],style: TextStyle(fontSize: 19.0),),

             ),

        );
       },
      ),
    ),
    );
  }
}


