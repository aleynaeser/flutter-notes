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
    "Poseidon",
    "Charmander",
    "Benita",
    "Back2theFuture",
    "Thorongil",
    "GaripKont",
    "MadKing",
    "YoungWolf",
    "OculusReyna",
    "Xecutioner",
    "DefendYourself",
    "ShowTeam",
    "MrSpy",
    "Nameless",
    "MagicSword",
    "Try2KillMe",
    "4Justice",
    "Laine",
    "PuzzleLink",
    "Philler",
    "Palaz",
    "FlexBrand",
    "GhostLine",
    "PalmPal",
    "GoldRiver",
    "ClearMode",
    "Ryver",
    "Shapez",
    "Rea1m",
    "FallenAngel",
    "Phoenix",
    "LikeABoss",
    "ByIceberg",
    "EasygameEasylife",
    "Cuckoo",
    "FunnyVoice",
    "BabyYoda",
    "Colorax",
    "IronJaw",
    "SharpBlunt",
    "Angelito",
    "Creativity",
    "Quacker",
    "LizardWizard",
    "CoClown",
    "YourBoss",
    "BlinkEye",
    "EcoFriendly",
    "RedF0rester",
    "Technomaniac",
    "Reynarok",
    "Arya",
    "Atilla",
    "Alonedark",
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
    "Arissa"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Nickname Generator'),
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
             child: SelectableText(mainDataList[index],
                              cursorColor: Colors.purple,
                              showCursor: true,
                              toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              cut: false,
                              paste: false
                               ),
                              style: TextStyle(fontSize: 19.0),),

             ),

        );
       },
      ),
    ),
    );
  }
}


