class CountryDto {
  final int id;
  final String title;

  CountryDto({required this.id, required this.title});

  factory CountryDto.fromJson(Map<String, dynamic> json) {
    return CountryDto(
      id: json['id'],
      title: json['title'],
    );
  }
}