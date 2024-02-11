part of 'appbar_fade_logic_bloc.dart';

abstract class AppbarFadeLogicEvent extends Equatable {
  const AppbarFadeLogicEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class InitEventScrollingAppBar extends AppbarFadeLogicEvent {
  double appbarColorOffSet;
  InitEventScrollingAppBar({required this.appbarColorOffSet});
}
