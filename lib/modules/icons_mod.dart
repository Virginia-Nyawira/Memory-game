import 'package:mayap/data/data_one.dart';

class   TileModel{
  String imageAssetPath;
  bool isSelected;

  TileModel({this.imageAssetPath,this.isSelected});

  //setter methods
  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath=getImageAssetPath;
  }
  void setIsSelected(bool getIsSelected){
    isSelected=getIsSelected;
  }
  //getter methods,returns a value
String getImageAssetPath(){
    return imageAssetPath;
  }
  bool getIsSelected(){
    return isSelected;
  }
}