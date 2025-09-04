import 'package:currency_converter/core/theme/app_colors.dart';
import 'package:currency_converter/features/converter/presentation/blocs/currencies/currencies_bloc.dart';
import 'package:currency_converter/features/converter/presentation/blocs/current_currencies/current_currencies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrenciesBottomSheet extends StatefulWidget {
  final bool isFirst;
  const CurrenciesBottomSheet({required this.isFirst, super.key});

  @override
  State<CurrenciesBottomSheet> createState() => _CurrenciesBottomSheetState();
}

class _CurrenciesBottomSheetState extends State<CurrenciesBottomSheet> {
  @override
  void initState() {
    super.initState();

    context.read<CurrenciesBloc>().add(LoadCurrenciesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 4,
            color: Colors.black.withValues(alpha: 0.5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Container(width: 44),
            BlocBuilder<CurrenciesBloc, CurrenciesState>(
              builder: (context, state) {
                if (state is CurrenciesLoading) {
                  return const Center(
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CurrenciesLoaded) {
                  final currencies = state.currencies;
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (widget.isFirst) {
                                context.read<CurrentCurrenciesBloc>().add(
                                  SetCurrencyFrom(currencies[index]),
                                );
                              } else {
                                context.read<CurrentCurrenciesBloc>().add(
                                  SetCurrencyTo(currencies[index]),
                                );
                              }
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              currencies[index].name,
                              style: const TextStyle(
                                color: AppColors.mainBlue,
                                fontSize: 20,
                                fontFamily: 'Tinos',
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: currencies.length,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
