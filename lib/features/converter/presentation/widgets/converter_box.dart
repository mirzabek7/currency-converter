import 'package:currency_converter/core/theme/app_colors.dart';
import 'package:currency_converter/features/converter/presentation/blocs/conversion/conversion_bloc.dart';
import 'package:currency_converter/features/converter/presentation/blocs/current_currencies/current_currencies_bloc.dart';
import 'package:currency_converter/features/converter/presentation/widgets/currencies_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'currency_input_decoration.dart';

class ConverterBox extends StatelessWidget {
  const ConverterBox({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    void openCurrencies(bool isFrom) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CurrenciesBottomSheet(isFirst: isFrom);
        },
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: BlocBuilder<CurrentCurrenciesBloc, CurrentCurrenciesState>(
        builder: (context, state) {
          if (state is CurrentCurrenciesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Amount',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontFamily: 'Tinos',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => openCurrencies(true),
                      label: Text(
                        state.from!.code,
                        style: const TextStyle(
                          color: AppColors.mainBlue,
                          fontSize: 20,
                          fontFamily: 'Tinos',
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                        color: Colors.black,
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                    SizedBox(
                      width: width * 0.32,
                      child: TextFormField(
                        decoration: CurrencyInputDecoration(),
                        cursorHeight: 24,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Tinos',
                        ),
                        onFieldSubmitted: (value) {
                          context.read<ConversionBloc>().add(
                            ConvertEvent(
                              from: state.from!.code,
                              to: state.to!.code,
                              amount: double.parse(value),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.background,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: AppColors.textSecondary,
                      padding: const EdgeInsets.all(16),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.background,
                        ),
                      ),
                      icon: const Icon(
                        Icons.published_with_changes_rounded,
                        size: 28,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => openCurrencies(false),
                      label: Text(
                        state.to!.code,
                        style: const TextStyle(
                          color: AppColors.mainBlue,
                          fontSize: 20,
                          fontFamily: 'Tinos',
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                        color: Colors.black,
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                    BlocBuilder<ConversionBloc, ConversionState>(
                      builder: (context, state) {
                        if (state is ConversionLoaded) {
                          return Container(
                            width: width * 0.32,
                            height: 42,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: AppColors.inputColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              state.result.result.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Tinos',
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: width * 0.32,
                            height: 42,
                            decoration: BoxDecoration(
                              color: AppColors.inputColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
