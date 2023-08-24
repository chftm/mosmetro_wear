import 'package:bloc/bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_event.dart';
import 'package:mosmetro_wear/bloc/route/route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(const RouteState(route: null)) {
    on<RouteEvent>(
      (event, emit) => switch (event) {
        RouteStarted() => _onRouteStarted(event, emit),
        NextStation() => _onNextStation(emit),
      },
    );
  }

  void _onRouteStarted(RouteStarted event, Emitter<RouteState> emit) {
    emit(RouteState(route: event.route));
  }

  void _onNextStation(Emitter<RouteState> emit) {
    if (state.route == null) return;

    if (state.currentStation >= state.route!.length - 1) {
      emit(const RouteState(route: null));
    } else {
      emit(
        state.copyWith(
          currentStation: state.currentStation + 1,
        ),
      );
    }
  }
}
