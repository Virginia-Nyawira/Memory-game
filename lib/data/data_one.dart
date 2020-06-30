//funct returning list tile model
import 'package:mayap/modules/icons_mod.dart';
int points=0;
bool selected=false;
String selectedImageAssetPath="";//variable to check if selected images are similar
int selectedTileIndex;//stores the value of the selected pair of image

List<TileModel> visiblePairs = new List<TileModel>();
List<TileModel> pairs = new List<TileModel>();

List<TileModel> getPairs(){
  List<TileModel> pairs= List<TileModel> ();
  TileModel tiles=TileModel();
  //First image
  tiles.setImageAssetPath("images/profile2.jfif");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
   tiles=TileModel();

  //Second image
  tiles.setImageAssetPath("images/profile3.jpg");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //Third image
  tiles.setImageAssetPath("images/profile5.jfif");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //Fourth image
  tiles.setImageAssetPath("images/profile13.jfif");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //Fifth image
  tiles.setImageAssetPath("images/profile14.jfif");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //Sixth image
  tiles.setImageAssetPath("images/profile15.jpg");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //Seventh image
  tiles.setImageAssetPath("images/profole1.jfif");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //Eighth image
  tiles.setImageAssetPath("images/smile.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();

  //ninth image
  tiles.setImageAssetPath("images/advice.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();
  //10th image
 tiles.setImageAssetPath("images/album.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles=TileModel();


return pairs;
}
List<TileModel> getQuestions() {
  List<TileModel> pairs = List<TileModel>();
  TileModel tiles = TileModel();
  //First image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Second image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Third image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Fourth image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Fifth image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Sixth image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Seventh image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  //Eighth image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();
  //Ninth image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();
  //10th image
  tiles.setImageAssetPath("images/question.png");
  tiles.setIsSelected(false);
  pairs.add(tiles);
  pairs.add(tiles);
  tiles = TileModel();

  return pairs;
}