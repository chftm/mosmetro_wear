import 'package:bloc/bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_event.dart';
import 'package:mosmetro_wear/bloc/route/route_state.dart';

final class RouteBloc extends Bloc<RouteEvent, RouteState> {
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

    if (state.isLastStation) {
      emit(const RouteState(route: null));
    } else if (state.isTransfer) {
      emit(
        state.copyWith(
          currentSegmentIndex: state.currentSegmentIndex + 1,
          currentStationIndex: 0,
        ),
      );
    }
    emit(
      state.copyWith(
        currentStationIndex: state.currentStationIndex + 1,
      ),
    );
  }
}
