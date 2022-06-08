part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoadingState extends ThemeState{}

class ThemeHasDataState extends ThemeState{
  final ThemeData currentTheme;

  ThemeHasDataState({required this.currentTheme});
}

class ThemeErrorState extends ThemeState{
  final String errorCode;

  ThemeErrorState({required this.errorCode});
}