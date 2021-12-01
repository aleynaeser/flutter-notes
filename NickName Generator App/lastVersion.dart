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
  List<String> mainDataList = [
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
  String added=" ";

  var formKey = GlobalKey<FormState>();

  Widget buildNicknameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Write Nickname", hintText: "NickName"),
      validator: (value) {
        if (value == null) {
          added=value!;
          return "Name Required!";
        }
        onSaved(value) {
          mainDataList.add(value);
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          setState(() {
            mainDataList.add(added);
          });
          Navigator.pop(context);
      }
  },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.deepPurple,
        ),
      ),
      child: const Icon(
        Icons.add_box,
        color: Colors.white,
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add New Nickname"),
          ),
          body: Container(
            margin: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[buildNicknameField(), buildSubmitButton()],
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nickname Generator'),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _pushSaved,
              tooltip: 'Add New Nickname',
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.article_rounded)),
              Tab(icon: Icon(Icons.favorite)),
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
                          padding: const EdgeInsets.all(20.0),
                          child: SelectableText(
                            mainDataList[index],
                            cursorColor: Colors.purple,
                            showCursor: false,
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
                            style: const TextStyle(fontSize: 19.0),
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
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple,
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite,
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
                      'There are no favorites yet!',
                      style: TextStyle(color: Colors.black),
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
                                padding: const EdgeInsets.all(20.0),
                                child: SelectableText(
                                  favoriteDataList[index],
                                  cursorColor: Colors.purple,
                                  showCursor: false,
                                  toolbarOptions: ToolbarOptions(
                                      copy: true,
                                      selectAll: true,
                                      cut: false,
                                      paste: false),
                                  style: const TextStyle(fontSize: 19.0),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  favoriteDataList
                                      .remove(favoriteDataList[index]);
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
