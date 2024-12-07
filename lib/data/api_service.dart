import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_dto.dart';
import '../service_key.dart';

class CountryApiService {
  final String _apiUrl = service_key;
  final String _accessToken = '5ecf6d1c5ecf6d1c5ecf6d1c355dea80dc55ecf5ecf6d1c399c1aead5bb6eb3a836584b';
  final String _v = '5.199';

  Future<List<CountryDto>> getCountriesById(List<int> countryIds) async {
    var response = await http.get(Uri.parse('$_apiUrl?access_token=$_accessToken&v=$_v&country_ids=${countryIds.join(',')}'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['response'];
      return data.map((json) => CountryDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}