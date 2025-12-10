import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/profile_service.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService _service;

  ProfileBloc(this._service) : super(ProfileInitial()) {
    on<FetchProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await _service.fetchProfile();
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });
  }
}