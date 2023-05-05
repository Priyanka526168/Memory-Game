/*bugs section
* 1. tapping on same tile twice increases points and opens its match.*/
import 'package:classico/hey.dart.dart';
import 'package:flutter/material.dart';

import 'data/data.dart';

var alreadySelected = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: const HomePage(title: 'Flutter Demo Page',),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pairs = getPairs();
    pairs.shuffle();
    points1=0;
    points2=0;
    chance = 1;
    visiblePairs1 = pairs;
    selcted=true;
    selectedImageAssetPath = "";
    Future.delayed(const Duration(seconds: 3), (){
      setState(() {
        visiblePairs1 = getBlanks1();
        selcted=false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: myTheme.backgroundColour,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Memory Game"),
        backgroundColor: myTheme.backgroundColour,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: (points1+points2)!=1500? Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Player 1: ${points1}", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: myTheme.player1Colour,
                ),),
                Text("Player 2: ${points2}", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: myTheme.player2Colour,
                ),),
              ],
            ),
            const SizedBox(height: 40,),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 0.0,
                maxCrossAxisExtent: screenWidth>=screenHeight? screenHeight/5 : screenWidth/5,
              ),
              children: List.generate(visiblePairs1.length, (index){
                return Tile(
                  imageAssetPath: visiblePairs1[index].getImageAssetPath(),
                  selected: visiblePairs1[index].getIsSelected(),
                  parent: this,
                  tileIndex: index,
                );
              }),
            ),
            const SizedBox(height: 40,),
            chance==1? Text("Player 1's Turn", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: myTheme.player1Colour,
            ),) :
            Text("Player 2's Turn", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: myTheme.player2Colour,),),
          ],
        ) :
        AlertDialog(
          title: const Text('CONGRATULATIONS!', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),),
          content: Text(
            points1 > points2 ? 'Player 1 wins!' :
            points1 == points2 ? "It's a tie!" : 'Player 2 wins!', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK', style: TextStyle(
                color: myTheme.backgroundColour,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Tile extends StatefulWidget {

  String imageAssetPath="";
  bool selected;
  int tileIndex;
  _HomePageState parent;
  Tile({required this.imageAssetPath, required this.selected, required this.parent, required this.tileIndex});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (alreadySelected.contains(widget.tileIndex)) {
          return;
        }
        if(!selcted){
          if(selectedImageAssetPath != ""){
            if(selectedImageAssetPath == pairs[widget.tileIndex].getImageAssetPath()){
              //correct
              print("correct");

              selcted=true;
              Future.delayed(const Duration(milliseconds: 300), (){
                selcted=false;
                chance == 1 ? (points1 = points1 + 100) : (points2 = points2 + 100);
                alreadySelected.addAll([widget.tileIndex, selectedTileIndex]);
                setState(() {});
                widget.parent.setState(() {});
              });
              chance = chance ^ 1;

            }
            else{
              //wrong
              print("wrong");
              selcted=true;
              Future.delayed(const Duration(milliseconds: 300), (){
                selcted=false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
              });
            }
            selectedImageAssetPath="";
            chance = chance ^ 1;
          }
          else{
            selectedTileIndex = widget.tileIndex;
            selectedImageAssetPath = pairs[widget.tileIndex].getImageAssetPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(2),
        child:  Image.asset(pairs[widget.tileIndex].getIsSelected()? pairs[widget.tileIndex].getImageAssetPath() :
        chance == 1 ? widget.imageAssetPath : "assets/images/player2.jpeg",
        height: 20,
        width: 20,),
      ),
    );
  }
}
