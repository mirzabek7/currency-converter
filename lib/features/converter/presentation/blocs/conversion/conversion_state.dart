part of 'conversion_bloc.dart';

sealed class ConversionState extends Equatable {
  const ConversionState();

  @override
  List<Object> get props => [];
}

final class ConversionInitial extends ConversionState {}

final class ConversionLoading extends ConversionState {}

final class ConversionLoaded extends ConversionState {
  final ConversionResultEntity result;

  const ConversionLoaded(this.result);
}

final class ConversionError extends ConversionState {
  final String message;

  const ConversionError(this.message);
}
