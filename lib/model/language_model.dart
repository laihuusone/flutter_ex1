import 'package:flutter_ex1/common/assets_common.dart';

class LanguageModel {
  String id;
  String image;
  String title;
  String areaCode;

  LanguageModel({
    required this.id, 
    required this.image, 
    required this.title, 
    required this.areaCode,
  });

  static List<LanguageModel> getLanguage() {
    return <LanguageModel>[
      LanguageModel(
        id: '1', 
        image: englandFlagImange, 
        title: 'English',
        areaCode: '+44',
      ),
      LanguageModel(
        id: '2', 
        image: hongkongFlagImange, 
        title: 'HongKong',
        areaCode: '+852',
      ),
      LanguageModel(
        id: '3', 
        image: chinaFlagImange, 
        title: 'China',
        areaCode: '+86',
      ),
    ];
  }
}
