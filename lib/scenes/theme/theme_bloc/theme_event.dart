part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeStartupEvent extends ThemeEvent{}

class ThemeCityEvent extends ThemeEvent{
  final String city;

  ThemeCityEvent({required this.city});
}