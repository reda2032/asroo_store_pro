import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../service/shared_pref/pref_keys.dart';
import '../../service/shared_pref/shared_pref.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  //Theme Mode
  bool isDark = true;
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }
}
