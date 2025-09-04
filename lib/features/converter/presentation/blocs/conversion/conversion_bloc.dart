import 'package:bloc/bloc.dart';
import 'package:currency_converter/features/converter/domain/entities/conversion_result_entity.dart';
import 'package:currency_converter/features/converter/domain/usecases/convert_currency_usecase.dart';
import 'package:equatable/equatable.dart';

part 'conversion_event.dart';
part 'conversion_state.dart';

class ConversionBloc extends Bloc<ConversionEvent, ConversionState> {
  final ConvertCurrencyUsecase usecase;

  ConversionBloc(this.usecase) : super(ConversionInitial()) {
    on<ConvertEvent>(convertCurrency);
  }

  Future<void> convertCurrency(ConvertEvent event, Emitter emit) async {
    emit(ConversionLoading());
    final result = await usecase.call(
      from: event.from,
      to: event.to,
      amount: event.amount,
    );

    result.fold(
      (failure) => emit(ConversionError(failure.message)),
      (result) => emit(ConversionLoaded(result)),
    );
  }
}
