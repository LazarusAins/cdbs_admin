import 'package:flutter_bloc/flutter_bloc.dart';

part 'admission_event.dart';
part 'admission_state.dart';

class AdmissionBloc extends Bloc<AdmissionEvent, AdmissionState> {
  AdmissionBloc() : super(AdmissionInitial()) {
    // Registering the event handler
    on<MarkAsCompleteClicked>(_onMarkAsCompleteClicked);
  }

  // Event handler for MarkAsCompleteClicked
  void _onMarkAsCompleteClicked(
      MarkAsCompleteClicked event, Emitter<AdmissionState> emit) {
    try {
      // Emit the updated state based on the value of isComplete
      emit(AdmissionStatusUpdated(event.isComplete));
    } catch (e) {
      // In case of an error, emit a failure state
      emit(AdmissionFailure('Failed to update admission status'));
    }
  }
}