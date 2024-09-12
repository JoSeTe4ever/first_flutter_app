class BirthCardRequest {
  final Subject subject;
  final String theme;
  final String language;

  BirthCardRequest({
    required this.subject,
    required this.theme,
    required this.language,
  });

  Map<String, dynamic> toJson() => {
    'subject': subject.toJson(),
    'theme': theme,
    'language': language,
  };
}

class Subject {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final double longitude;
  final double latitude;
  final String city;
  final String nation;
  final String timezone;
  final String name;
  final String zodiacType;
  final String? siderealMode;

  Subject({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.longitude,
    required this.latitude,
    required this.city,
    required this.nation,
    required this.timezone,
    required this.name,
    required this.zodiacType,
    this.siderealMode,
  });

  Map<String, dynamic> toJson() => {
    'year': year,
    'month': month,
    'day': day,
    'hour': hour,
    'minute': minute,
    'longitude': longitude,
    'latitude': latitude,
    'city': city,
    'nation': nation,
    'timezone': timezone,
    'name': name,
    'zodiac_type': zodiacType,
    'sidereal_mode': siderealMode,
  };
}