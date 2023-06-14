import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/artModel.dart';
import 'base.dart';

class ArtApi {
  Future<List<Arts>> getAllArts() async {
    final url = Uri.parse('${Base.baseUrl}/store/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var data = result['products'];

        return List<Arts>.from(data.map((x) => Arts.fromJson(x)));
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
        return Future.error(e);
    }
  }
}