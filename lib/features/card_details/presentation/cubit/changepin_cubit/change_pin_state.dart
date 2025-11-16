

import 'package:equatable/equatable.dart';
import 'package:fintechapp/features/card_details/data/models/change_pin_model.dart';

abstract class ChangePinState extends Equatable {
  const ChangePinState();

  @override
  List<Object?> get props => [];
}

class ChangePinInitial extends ChangePinState {
  const ChangePinInitial();
}

class ChangePinStep1Loaded extends ChangePinState {

  const ChangePinStep1Loaded(this.data);
  final ChangePinModel data;

  @override
  List<Object?> get props => [data];
}

class ChangePinStep2Loaded extends ChangePinState {

  const ChangePinStep2Loaded(this.data);
  final ChangePinModel data;

  @override
  List<Object?> get props => [data];
}

class ChangePinShowNewPinSheet extends ChangePinState {

  const ChangePinShowNewPinSheet(this.data);
  final ChangePinModel data;

  @override
  List<Object?> get props => [data];
}

class ChangePinLoading extends ChangePinState {
  const ChangePinLoading();
}

class ChangePinError extends ChangePinState {

  const ChangePinError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class ChangePinSuccess extends ChangePinState {
  const ChangePinSuccess();
}