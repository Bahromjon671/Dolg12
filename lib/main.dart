import 'package:flutter/material.dart';

import 'dart:convert';
import '../models/country_dto.dart';
import '../models/country_domain.dart';
import '../data/api_service.dart';


void main() {
  List<int> countryIds = [1,2,3,4]; // Пример идентификаторов стран
  CountryApiService apiService = CountryApiService();

  apiService.getCountriesById(countryIds).then((countries) {
    runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Countries')),
        body: CountryListWidget(countries),
      ),
    ));
  });
}


///

class CountryListWidget extends StatelessWidget {
  final List<CountryDto> countries;

  CountryListWidget(this.countries);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${countries[index].id}: ${countries[index].title}'),
        );
      },
    );
  }
}