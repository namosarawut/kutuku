import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbar_fade_logic_event.dart';

part 'appbar_fade_logic_state.dart';

class AppbarFadeLogicBloc extends Bloc<AppbarFadeLogicEvent, double> {
  AppbarFadeLogicBloc() : super(0.0) {
    on<InitEventScrollingAppBar>((event, emit) {
      emit(event.appbarColorOffSet);
    });
  }
}
