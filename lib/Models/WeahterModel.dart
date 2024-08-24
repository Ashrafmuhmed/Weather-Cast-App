class Weahter {
  final String? coun_name, city_name, condition, icon;
  final DateTime lastUpated;
  final double maxtemp, mintemp, temp;
  const Weahter(
      {required this.city_name,
      required this.coun_name,
      required this.condition,
      required this.icon,
      required this.lastUpated,
      required this.maxtemp,
      required this.temp,
      required this.mintemp});
  factory Weahter.fromJson(json) {
    return Weahter(
        city_name: json['location']['name'],
        coun_name: json['location']['country'],
        condition: json['current']['condition']['text'],
        icon: json['current']['condition']['icon'],
        lastUpated: DateTime.parse(json['current']['last_updated']),
        temp: json['current']['temp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c']);
  }
}
