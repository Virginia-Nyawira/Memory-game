import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mayap/data/data_one.dart';
import 'data/data_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Game trial',
      theme: ThemeData(
        // primarySwatch:Colors.black26,
        primaryColor: Colors.cyan,
        backgroundColor: Colors.black12,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<TileModel> pairs = new List<TileModel>();

  @override
  void initState() {
    super.initState();
    //cast added
    pairs = getPairs();
    pairs.shuffle();
    visiblePairs = pairs;
    selected = true;

    //images changing to question marks after given secs
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 17.0, right: 5.0),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.lock_outline, color: Colors.white, size: 25.0),
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Level 1",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down,
                          color: Colors.blue, size: 25.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey),
          child: Column(
            children: <Widget>[
              points != 220
                  ? Container(
                      width: double.infinity,
                      //height: 50.0,
                      /* */ decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(20.0, 20.0),
                            bottomRight: Radius.elliptical(20.0, 20.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "My Score",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0),
                            ),
                            Text(
                              "$points/220",
                              style: TextStyle(
                                  fontSize: 20.0, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              Divider(
                color: Colors.blue,
              ),
              points != 220
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                      child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 0.0, maxCrossAxisExtent: 60),
                          children: List.generate(visiblePairs.length, (index) {
                            return Tiles(
                              imageAssetPath:
                                  visiblePairs[index].getImageAssetPath(),
                              //selected: visiblePairs[index].getIsSelected(),
                              parent: this,
                              tileIndex: index,
                            );
                          })),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text("Replay"),
                    )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.cyan,
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  height: 40.0,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_left,
                          color: Colors.blue, size: 25.0),
                      SizedBox(width: 23.0),
                      Text(
                        "Previous",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 50.0),
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 23.0),
                    Icon(Icons.keyboard_arrow_right,
                        color: Colors.blue, size: 25.0),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}

class Tiles extends StatefulWidget {
  String imageAssetPath;

  //bool selected;
  int tileIndex;
  _HomePageState parent;

  Tiles({this.imageAssetPath, this.parent, this.tileIndex});

  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          //If a pair of images is selected,ie not equal to blank
          //calls the else function
          if (selectedImageAssetPath != "") {
            if (selectedImageAssetPath ==
                pairs[widget.tileIndex].getImageAssetPath()) {
              //If the image pairs are alike
              print("Correct");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                points = points + 10;
                setState(() {});
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetPath("");
                  pairs[selectedTileIndex].setImageAssetPath("");
                });
                // ignore: unnecessary_statements
                selectedImageAssetPath != "";
              });
            } else {
              //If the image pairs are not alike
              print("Wrong");
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                selected = false;
                //Set the image to a question mark if the pair does not contain similar images
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                // ignore: unnecessary_statements
                selectedImageAssetPath != "";
              });
            }
          } else {
            selectedTileIndex = widget.tileIndex;
            //Assigning the value of the selected pair to the string var selectedImage
            selectedImageAssetPath =
                pairs[widget.tileIndex].getImageAssetPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          //print("Clicked");
        }
      },
      child: Container(
          margin: EdgeInsets.all(5.0),

          child: pairs[widget.tileIndex].getImageAssetPath() != ""
              ? Image.asset(pairs[widget.tileIndex].getIsSelected()
                  ? pairs[widget.tileIndex].getImageAssetPath()
                  : widget.imageAssetPath)
              : Image.asset("images/tick.png")),
    );
  }
}
