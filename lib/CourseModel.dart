import 'dart:convert';

CourseModel CourseModelJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String CourseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  // int id;
  String Name;
  String img;

  CourseModel({this.Name, this.img});

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      CourseModel(Name: json["Name"], img: json["img"]);

  Map<String, dynamic> toJson() => {
        "Name": Name,
        "img": img,
      };

  String get name => Name;

  String get Img => img;
}
