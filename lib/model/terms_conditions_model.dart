import 'dart:convert';
import 'package:flutter_ex1/common/constant_common.dart';
import 'package:http/http.dart' as http;

class TermsConditions {
  String termsConditions;
  String message;
  bool status;

  TermsConditions({
    required this.termsConditions, 
    required this.message, 
    required this.status
    });

  factory TermsConditions.fromJson(Map<String, dynamic> json) {
    return TermsConditions(
      termsConditions: json['data']['terms_and_conditions'],
      message: json['message'],
      status: json['status']
      );
  }
}

Future<TermsConditions> fetchTermsConditions() async {
    final response = await http.get(
      Uri.parse(urlTermsConditions), headers: headerTermsConditions);

      if (response.statusCode == 200) {
        return TermsConditions.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Terms and Conditions');
      }
  }