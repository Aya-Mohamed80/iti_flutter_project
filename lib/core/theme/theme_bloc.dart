import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/theme/app_theme.dart';
import 'package:iti_project/core/theme/theme_event.dart';
import 'package:iti_project/core/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: AppTheme.lightTheme, isDarkMode: false)) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.isDarkMode) {
        emit(ThemeState(themeData: AppTheme.lightTheme, isDarkMode: false));
      } else {
        emit(ThemeState(themeData: AppTheme.darkTheme, isDarkMode: true));
      }
    });
  }
}
