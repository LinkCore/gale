import 'dart:convert';

WeatherForecast weatherForecastFromJson(String str) =>
    WeatherForecast.fromJson(json.decode(str));

String weatherForecastToJson(WeatherForecast data) =>
    json.encode(data.toJson());

class WeatherForecast {
  WeatherForecast({
    String? cod,
    int? message,
    int? cnt,
    List<Forecast>? forecast,
    City? city}) {
    _cod = cod;
    _message = message;
    _cnt = cnt;
    _forecast = forecast;
    _city = city;
  }

  @override
  String toString() {
    return 'WeatherForecast{_cod: $_cod, _message: $_message, _cnt: $_cnt, _forecast: $_forecast, _city: $_city}';
  }

  WeatherForecast.fromJson(dynamic json) {
    _cod = json['cod'];
    _message = json['message'];
    _cnt = json['cnt'];
    if (json['list'] != null) {
      _forecast = [];
      json['list'].forEach((v) {
        _forecast?.add(Forecast.fromJson(v));
      });
    }
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  String? _cod;
  int? _message;
  int? _cnt;
  List<Forecast>? _forecast;
  City? _city;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${forecast!.map((e) => e.weather!.map((q) => q.icon))}@2x.png';
  }

  String get forecastIconUrl {
    return 'https://openweathermap.org/img/wn/${forecast!.map((e) => e.weather!.first).toList()}@2x.png';
  }

  String? get cod => _cod;
  int? get message => _message;
  int? get cnt => _cnt;
  List<Forecast>? get forecast => _forecast;
  City? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = _cod;
    map['message'] = _message;
    map['cnt'] = _cnt;
    if (_forecast != null) {
      map['list'] = _forecast?.map((v) => v.toJson()).toList();
    }
    if (_city != null) {
      map['city'] = _city?.toJson();
    }
    return map;
  }
}

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? timezone,
    int? sunrise,
    int? sunset}) {
    _id = id;
    _name = name;
    _coord = coord;
    _country = country;
    _timezone = timezone;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  @override
  String toString() {
    return 'City{_id: $_id, _name: $_name, _coord: $_coord, _country: $_country, _timezone: $_timezone, _sunrise: $_sunrise, _sunset: $_sunset}';
  }

  City.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    _country = json['country'];
    _timezone = json['timezone'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  int? _id;
  String? _name;
  Coord? _coord;
  String? _country;
  int? _timezone;
  int? _sunrise;
  int? _sunset;

  int? get id => _id;
  String? get name => _name;
  Coord? get coord => _coord;
  String? get country => _country;
  int? get timezone => _timezone;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    map['country'] = _country;
    map['timezone'] = _timezone;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }
}

Coord coordFromJson(String str) => Coord.fromJson(json.decode(str));

String coordToJson(Coord data) => json.encode(data.toJson());

class Coord {
  Coord({
    double? lat,
    double? lon,
  }) {
    _lat = lat;
    _lon = lon;
  }

  @override
  String toString() {
    return 'Coord{_lat: $_lat, _lon: $_lon}';
  }

  Coord.fromJson(dynamic json) {
    _lat = double.parse(json['lat'].toString()).toDouble();
    _lon = double.parse(json['lon'].toString()).toDouble();
  }

  double? _lat;
  double? _lon;

  double? get lat => _lat;
  double? get lon => _lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    return map;
  }
}

Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));

String forecastToJson(Forecast data) => json.encode(data.toJson());

class Forecast {
  Forecast({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    int? pop,
    Sys? sys,
    String? dtTxt}) {
    _dt = dt;
    _main = main;
    _weather = weather;
    _clouds = clouds;
    _wind = wind;
    _visibility = visibility;
    _pop = pop;
    _sys = sys;
    _dtTxt = dtTxt;
  }

  @override
  String toString() {
    return 'Forecast{_dt: $_dt, _main: $_main, _weather: $_weather, _clouds: $_clouds, _wind: $_wind, _visibility: $_visibility, _pop: $_pop, _sys: $_sys, _dtTxt: $_dtTxt}';
  }

  Forecast.fromJson(dynamic json) {
    _dt = json['dt'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _visibility = json['visibility'];
    _pop = double.parse(json['pop'].toString()).toInt();
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _dtTxt = json['dt_txt'];
  }

  int? _dt;
  Main? _main;
  List<Weather>? _weather;
  Clouds? _clouds;
  Wind? _wind;
  int? _visibility;
  int? _pop;
  Sys? _sys;
  String? _dtTxt;

  int? get dt => _dt;
  Main? get main => _main;
  List<Weather>? get weather => _weather;
  Clouds? get clouds => _clouds;
  Wind? get wind => _wind;
  int? get visibility => _visibility;
  int? get pop => _pop;
  Sys? get sys => _sys;
  String? get dtTxt => _dtTxt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    map['visibility'] = _visibility;
    map['pop'] = _pop;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['dt_txt'] = _dtTxt;
    return map;
  }
}

Sys sysFromJson(String str) => Sys.fromJson(json.decode(str));

String sysToJson(Sys data) => json.encode(data.toJson());

class Sys {
  Sys({
    String? pod,
  }) {
    _pod = pod;
  }

  @override
  String toString() {
    return 'Sys{_pod: $_pod}';
  }

  Sys.fromJson(dynamic json) {
    _pod = json['pod'];
  }

  String? _pod;
  String? get pod => _pod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pod'] = _pod;
    return map;
  }
}

Wind windFromJson(String str) => Wind.fromJson(json.decode(str));

String windToJson(Wind data) => json.encode(data.toJson());

class Wind {
  Wind({
    double? speed,
    int? deg,
    double? gust}) {
    _speed = speed;
    _deg = deg;
    _gust = gust;
  }

  @override
  String toString() {
    return 'Wind{_speed: $_speed, _deg: $_deg, _gust: $_gust}';
  }

  Wind.fromJson(dynamic json) {
    _speed = double.parse(json['speed'].toString());
    _deg = json['deg'];
    _gust = double.parse(json['gust'].toString());
  }

  double? _speed;
  int? _deg;
  double? _gust;

  double? get speed => _speed;
  int? get deg => _deg;
  double? get gust => _gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    map['gust'] = _gust;
    return map;
  }
}

Clouds cloudsFromJson(String str) => Clouds.fromJson(json.decode(str));

String cloudsToJson(Clouds data) => json.encode(data.toJson());

class Clouds {
  Clouds({
    int? all,
  }) {
    _all = all;
  }

  @override
  String toString() {
    return 'Clouds{_all: $_all}';
  }

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }

  int? _all;

  int? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }
}

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    int? id,
    String? main,
    String? description,
    String? icon}) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  @override
  String toString() {
    return 'Weather{_id: $_id, _main: $_main, _description: $_description, _icon: $_icon}';
  }

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }
}

Main mainFromJson(String str) => Main.fromJson(json.decode(str));

String mainToJson(Main data) => json.encode(data.toJson());

class Main {
  Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? seaLevel,
    int? grndLevel,
    int? humidity,
    double? tempKf}) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
    _humidity = humidity;
    _tempKf = tempKf;
  }

  @override
  String toString() {
    return 'Main{_temp: $_temp, _feelsLike: $_feelsLike, _tempMin: $_tempMin, _tempMax: $_tempMax, _pressure: $_pressure, _seaLevel: $_seaLevel, _grndLevel: $_grndLevel, _humidity: $_humidity, _tempKf: $_tempKf}';
  }

  Main.fromJson(dynamic json) {
    _temp = double.parse(json['temp'].toString());
    _feelsLike = double.parse(json['feels_like'].toString());
    _tempMin = double.parse(json['temp_min'].toString());
    _tempMax = double.parse(json['temp_max'].toString());
    _pressure = json['pressure'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
    _humidity = json['humidity'];
    _tempKf = double.parse(json['temp_kf'].toString());
  }

  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _seaLevel;
  int? _grndLevel;
  int? _humidity;
  double? _tempKf;

  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get seaLevel => _seaLevel;
  int? get grndLevel => _grndLevel;
  int? get humidity => _humidity;
  double? get tempKf => _tempKf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    map['humidity'] = _humidity;
    map['temp_kf'] = _tempKf;
    return map;
  }
}