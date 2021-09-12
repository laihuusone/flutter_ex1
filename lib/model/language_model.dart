import 'package:flutter_ex1/common/assets_common.dart';

class LanguageModel {
  int id;
  String image;
  String title;

  LanguageModel({required this.id, required this.image, required this.title});

  static List<LanguageModel> getLanguage() {
    return <LanguageModel>[
      LanguageModel(id: 1, image: englandFlagImange, title: 'English'),
      LanguageModel(id: 2, image: hongkongFlagImange, title: 'HongKong'),
      LanguageModel(id: 3, image: chinaFlagImange, title: 'China'),
    ];
  }
}
