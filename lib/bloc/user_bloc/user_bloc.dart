import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:popo_app/models/user_model.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<ActivateUserEvent>((event, emit) {
      emit(UserSetState(event.user));
    });

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser || state.user!.edad == event.newAge) return;
      final newUser = state.user!.copyWith(edad: event.newAge);
      emit(UserSetState(newUser));
    });

    on<AddUserProfessionEvent>((event, emit) {
      if (!state.existUser ) return;
      final count = state.user!.profesiones.length +1;
      final newProf = '${event.newProf} $count';
      final addProfesion = state.user!.copyWith(profesiones: [newProf, ...state.user!.profesiones]);
      emit(UserSetState(addProfesion));
    });

    on<ResetUserEvent>((event, emit) {
      emit(UserInitialState());
    });
  }
}
