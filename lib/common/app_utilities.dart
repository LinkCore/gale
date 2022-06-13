import '../scenes/theme/theme_bloc/theme_bloc.dart';
import 'app_theme.dart';

class AppUtilities {
  static Map<String, ThemeHasDataState> mapStringToTheme = {
    'clear sky': ThemeHasDataState(currentTheme: AppTheme.clearSkyTheme),
    'few clouds': ThemeHasDataState(currentTheme: AppTheme.fewCloudsTheme),
    'scattered clouds':
        ThemeHasDataState(currentTheme: AppTheme.scatteredCloudsTheme),
    'broken clouds':
        ThemeHasDataState(currentTheme: AppTheme.brokenCloudsTheme),
    'shower rain': ThemeHasDataState(currentTheme: AppTheme.showerRainTheme),
    'moderate rain':
        ThemeHasDataState(currentTheme: AppTheme.moderateRainTheme),
    'rain': ThemeHasDataState(currentTheme: AppTheme.rainTheme),
    'light rain': ThemeHasDataState(currentTheme: AppTheme.lightRainTheme),
    'thunderstorm': ThemeHasDataState(currentTheme: AppTheme.thunderstormTheme),
    'snow': ThemeHasDataState(currentTheme: AppTheme.snowTheme),
    'mist': ThemeHasDataState(currentTheme: AppTheme.mistTheme),
    'haze': ThemeHasDataState(currentTheme: AppTheme.hazeTheme)
  };
}