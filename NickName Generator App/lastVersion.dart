import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> mainDataList = [
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
    "SaviorAngel",
    "Arissa",
  ];

  List<String> favoriteDataList = [];

  _saveList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("key", list);
    return true;
  }

  _getSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("key") != null) {
      favoriteDataList = prefs.getStringList("key")!;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getSavedList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "StarName",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                Text(
                  "Startup Name Generator",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ]),
          backgroundColor: Colors.deepPurple,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.article_rounded)),
              Tab(icon: Icon(Icons.star)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: mainDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: SelectableText(
                            mainDataList[index],
                            cursorColor: Colors.purple,
                            showCursor: false,
                            toolbarOptions: const ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
                            style: const TextStyle(fontSize: 17.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (!favoriteDataList
                                .contains(mainDataList[index])) {
                              favoriteDataList.add(mainDataList[index]);
                            }
                            _saveList(favoriteDataList);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple,
                          ),
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            favoriteDataList.isEmpty
                ? const Center(
                    child: Text(
                      "You don't have a star name yet!",
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteDataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: SelectableText(
                                  favoriteDataList[index],
                                  cursorColor: Colors.purple,
                                  showCursor: false,
                                  toolbarOptions: const ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
                                  style: const TextStyle(fontSize: 17.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  favoriteDataList
                                      .remove(favoriteDataList[index]);
                                  _saveList(favoriteDataList);
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.deepPurple,
                                ),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
