import '../scenes/theme/theme_bloc/theme_bloc.dart';
import 'app_theme.dart';

class AppUtilities {
  static Map<String, ThemeHasDataState> mapStringToTheme = {

//clear
    'clear sky': ThemeHasDataState(currentTheme: AppTheme.clearSkyTheme),

//clouds
    'few clouds': ThemeHasDataState(currentTheme: AppTheme.fewCloudsTheme),
    'broken clouds': ThemeHasDataState(currentTheme: AppTheme.brokenCloudsTheme),
    'overcast clouds': ThemeHasDataState(currentTheme: AppTheme.overcastCloudsTheme),
    'scattered clouds': ThemeHasDataState(currentTheme: AppTheme.scatteredCloudsTheme),

//thunderstorm
    'thunderstorm': ThemeHasDataState(currentTheme: AppTheme.thunderstormTheme),
    'light thunderstorm': ThemeHasDataState(currentTheme: AppTheme.lightThunderstormTheme),
    'heavy thunderstorm': ThemeHasDataState(currentTheme: AppTheme.heavyThunderstormTheme),
    'ragged thunderstorm': ThemeHasDataState(currentTheme: AppTheme.thunderstormTheme),
    'thunderstorm with rain': ThemeHasDataState(currentTheme: AppTheme.thunderstormTheme),
    'thunderstorm with light rain': ThemeHasDataState(currentTheme: AppTheme.lightThunderstormTheme),
    'thunderstorm with heavy rain': ThemeHasDataState(currentTheme: AppTheme.heavyThunderstormTheme),
    'thunderstorm with drizzle': ThemeHasDataState(currentTheme: AppTheme.thunderstormTheme),
    'thunderstorm with light drizzle': ThemeHasDataState(currentTheme: AppTheme.lightThunderstormTheme),
    'thunderstorm with heavy drizzle': ThemeHasDataState(currentTheme: AppTheme.heavyThunderstormTheme),

//drizzle
    'drizzle': ThemeHasDataState(currentTheme: AppTheme.drizzleTheme),
    'drizzle rain': ThemeHasDataState(currentTheme: AppTheme.drizzleTheme),
    'shower drizzle': ThemeHasDataState(currentTheme: AppTheme.drizzleTheme),
    'light intensity drizzle': ThemeHasDataState(currentTheme: AppTheme.lightDrizzleTheme),
    'heavy intensity drizzle': ThemeHasDataState(currentTheme: AppTheme.heavyDrizzleTheme),
    'shower rain and drizzle': ThemeHasDataState(currentTheme: AppTheme.heavyDrizzleTheme),
    'light intensity drizzle rain': ThemeHasDataState(currentTheme: AppTheme.lightDrizzleTheme),
    'heavy intensity drizzle rain': ThemeHasDataState(currentTheme: AppTheme.heavyDrizzleTheme),
    'heavy shower rain and drizzle': ThemeHasDataState(currentTheme: AppTheme.heavyDrizzleTheme),

//rain
    'light rain': ThemeHasDataState(currentTheme: AppTheme.lightRainTheme),
    'shower rain': ThemeHasDataState(currentTheme: AppTheme.heavyRainTheme),
    'extreme rain': ThemeHasDataState(currentTheme: AppTheme.heavyRainTheme),
    'moderate rain': ThemeHasDataState(currentTheme: AppTheme.rainTheme),
    'freezing rain': ThemeHasDataState(currentTheme: AppTheme.rainTheme),
    'very heavy rain': ThemeHasDataState(currentTheme: AppTheme.heavyRainTheme),
    'ragged shower rain': ThemeHasDataState(currentTheme: AppTheme.rainTheme),
    'heavy intensity rain': ThemeHasDataState(currentTheme: AppTheme.heavyRainTheme),
    'light intensity shower rain': ThemeHasDataState(currentTheme: AppTheme.lightRainTheme),
    'heavy intensity shower rain': ThemeHasDataState(currentTheme: AppTheme.heavyRainTheme),

//snow
    'snow': ThemeHasDataState(currentTheme: AppTheme.snowTheme),
    'sleet': ThemeHasDataState(currentTheme: AppTheme.snowTheme),
    'light snow': ThemeHasDataState(currentTheme: AppTheme.lightSnowTheme),
    'heavy snow': ThemeHasDataState(currentTheme: AppTheme.heavySnowTheme),
    'shower snow': ThemeHasDataState(currentTheme: AppTheme.snowTheme),
    'shower sleet': ThemeHasDataState(currentTheme: AppTheme.snowTheme),
    'rain and snow': ThemeHasDataState(currentTheme: AppTheme.heavySnowTheme),
    'light shower snow': ThemeHasDataState(currentTheme: AppTheme.lightSnowTheme),
    'heavy shower snow': ThemeHasDataState(currentTheme: AppTheme.heavySnowTheme),
    'light shower sleet': ThemeHasDataState(currentTheme: AppTheme.lightSnowTheme),
    'light rain and snow': ThemeHasDataState(currentTheme: AppTheme.lightSnowTheme),

//atmosphere
    'fog': ThemeHasDataState(currentTheme: AppTheme.fogTheme),
    'dust': ThemeHasDataState(currentTheme: AppTheme.dustTheme),
    'mist': ThemeHasDataState(currentTheme: AppTheme.mistTheme),
    'sand': ThemeHasDataState(currentTheme: AppTheme.sandTheme),
    'haze': ThemeHasDataState(currentTheme: AppTheme.hazeTheme),
    'smoke': ThemeHasDataState(currentTheme: AppTheme.smokeTheme),
    'squalls': ThemeHasDataState(currentTheme: AppTheme.squallsTheme),
    'tornado': ThemeHasDataState(currentTheme: AppTheme.tornadoTheme),
    'volcanic ash': ThemeHasDataState(currentTheme: AppTheme.volcanicAshTheme),
    'sand/ dust whirls': ThemeHasDataState(currentTheme: AppTheme.sandAndDustWhirlsTheme),
  };
}