import '../../../../core/theme/app_colors.dart';
import '../blocs/conversion/conversion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/converter_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12,
              children: [
                const Text(
                  'Currency Converter',
                  style: TextStyle(
                    fontFamily: 'Tinos',
                    fontSize: 24,
                    color: AppColors.textBlue,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Check live rates, set rate alerts, receive notifications and more.',
                    style: TextStyle(
                      fontFamily: 'Tinos',
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                const ConverterBox(),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Indicative Exchange Rate',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 18,
                      fontFamily: 'Tinos',
                    ),
                  ),
                ),
                BlocBuilder<ConversionBloc, ConversionState>(
                  builder: (context, state) {
                    if (state is ConversionLoaded) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                            text: '1',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Tinos',
                            ),
                            children: [
                              TextSpan(text: ' ${state.result.from} = '),
                              TextSpan(
                                text:
                                    '${state.result.rate.toStringAsFixed(4)} ${state.result.to}',
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
