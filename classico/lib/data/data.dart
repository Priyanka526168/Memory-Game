
import '../model/tile_model.dart';

int points1 = 0;
int points2 = 0;
int chance = 1;
bool selcted = false;
String selectedImageAssetPath = "";
int selectedTileIndex=0;

List<TileModel> pairs = <TileModel>[];
List<TileModel> visiblePairs1 = <TileModel>[];

List<TileModel> getPairs(){

  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel(imageAssetPath: 'assets/images/acorn.png', isSelected: false);

  //1
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/bee.png', isSelected: false);

  //2
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/cactus.png', isSelected: false);

  //3
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/cloud.png', isSelected: false);

  //4
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/fish.png', isSelected: false);

  //5
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/ladybug.png', isSelected: false);

  //6
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/leaf.png', isSelected: false);

  //7
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/leaf2.png', isSelected: false);

  //8
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/moon.png', isSelected: false);

  //9
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/mushroom.png', isSelected: false);

  //10
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/rainbow.png', isSelected: false);

  //11
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/tulip.png', isSelected: false);

  //12
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel=TileModel(imageAssetPath: 'assets/images/snow.png', isSelected: false);

  //13
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel=TileModel(imageAssetPath: 'assets/images/sun.png', isSelected: false);

  //14
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel=TileModel(imageAssetPath: 'assets/images/sunflower.png', isSelected: false);

  //15
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel=TileModel(imageAssetPath: 'assets/images/tree.png', isSelected: false);


  return pairs;
}

List<TileModel> getBlanks2(){

  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel(imageAssetPath: 'assets/images/player2.jpeg', isSelected: false);

  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);

  return pairs;
}

List<TileModel> getBlanks1(){

  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel(imageAssetPath: 'assets/images/player1.jpeg', isSelected: false);

  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);

  return pairs;
}