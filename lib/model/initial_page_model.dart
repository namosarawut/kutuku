import 'package:equatable/equatable.dart';

class InitialPageModel extends Equatable {
  final int? id;
  final String? imgPath;
  final String? title;
  final String? subTitle;

  // List<dynamic> decodedData = jsonDecode('[{"id": 1, "imgPath": "assets/initialScreen/image1.png","title": "Various Collections Of The Latest Products","subTitle":"Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum."},'
  //     '{"id": 2, "imgPath": "assets/initialScreen/image2.png","title": "Complete Collection Of Colors And Sizes","subTitle":"Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum."},'
  //     '{"id": 3, "imgPath": "assets/initialScreen/image3.png","title": "Find The Most Suitable Outfit For You","subTitle":"Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum."},]');

  const InitialPageModel({this.id, this.imgPath, this.title, this.subTitle});

  static const empty = InitialPageModel(id: 0, imgPath: "", title: "", subTitle: "");

  factory InitialPageModel.fromJson(Map<String, dynamic> json) {
    return InitialPageModel(
        id: json['id'],
        imgPath: json['imgPath'],
        title: json['title'],
        subTitle: json['subTitle'],);
  }

  InitialPageModel copyWith(
      {int? id, String? imgPath, String? title, String? subTitle}) {
    return InitialPageModel(
        id: id ?? this.id,
        imgPath: imgPath ?? this.imgPath,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,);
  }

  @override
  List<Object?> get props => [id,imgPath,title,subTitle];
}