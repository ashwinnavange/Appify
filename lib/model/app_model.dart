// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class App {
  String logo;
  String appName;
  String userId;
  String packageName;
  String appFile;
  num rating;
  String developerName;
  String type;
  String shortDescription;
  String description;
  String whatsNew;
  List<String> categories;
  List<String> photos;
  num totalDownloads;
  App({
    required this.logo,
    required this.appName,
    required this.userId,
    required this.packageName,
    required this.appFile,
    required this.rating,
    required this.developerName,
    required this.type,
    required this.shortDescription,
    required this.description,
    required this.whatsNew,
    required this.categories,
    required this.photos,
    required this.totalDownloads,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'logo': logo,
      'appName': appName,
      'userId': userId,
      'packageName': packageName,
      'appFile': appFile,
      'rating': rating,
      'developerName': developerName,
      'type': type,
      'shortDescription': shortDescription,
      'description': description,
      'whatsNew': whatsNew,
      'categories': categories,
      'photos': photos,
      'totalDownloads': totalDownloads,
    };
  }

  factory App.fromMap(Map<String, dynamic> map) {
    return App(
      logo: map['logo'] as String,
      appName: map['appName'] as String,
      userId: map['userId'] as String,
      packageName: map['packageName'] as String,
      appFile: map['appFile'] as String,
      rating: map['rating'] as num,
      developerName: map['developerName'] as String,
      type: map['type'] as String,
      shortDescription: map['shortDescription'] as String,
      description: map['description'] as String,
      whatsNew: map['whatsNew'] as String,
      categories: List<String>.from((map['categories'] as List<String>)),
      photos: List<String>.from((map['photos'] as List<String>)),
      totalDownloads: map['totalDownloads'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory App.fromJson(String source) => App.fromMap(json.decode(source) as Map<String, dynamic>);
}
