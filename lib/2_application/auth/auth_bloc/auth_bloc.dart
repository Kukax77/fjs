import 'package:bloc/bloc.dart';
import 'package:clean_rlg/3_domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignOutPressedEvent>((event, emit) async {
      await authRepository.signOut();
      emit(AuthStateUnAuthenticated());
    });

    on<AuthCheckRequestedEvent>((evenr, emit) async {
      final userOption = authRepository.getSignedInUser();
      userOption.fold(() => emit(AuthStateUnAuthenticated()),
          (a) => emit(AuthStateAuthenticated()));
    });
  }
}
