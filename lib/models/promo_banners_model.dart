import 'package:cloud_firestore/cloud_firestore.dart';

class PromoBannersModel {
  final String title;
  final String image;
  final String category;
  final String id;

PromoBannersModel({
  required this.title,
  required this.id,
  required this.image,
  required this.category
});

//convert to json to object model
 factory PromoBannersModel.fromJson(Map<String,dynamic>json,String id){
  return PromoBannersModel(
   title: json["title"]??"",
   id: id, 
   image: json["image"]??"", 
   category: json["category"]??"",

  );

 }


//convert list<querydocumentsnapshot to list<productmodel>
static List<PromoBannersModel> fromJsonList(
  List<QueryDocumentSnapshot>list){
    return list
    .map((e)=>
      PromoBannersModel.fromJson(e.data() as Map<String, dynamic>, e.id)
    ).toList();
  }

}