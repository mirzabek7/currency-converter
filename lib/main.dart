import 'package:currency_converter/features/converter/presentation/blocs/current_currencies/current_currencies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart' as di;
import 'core/theme/app_colors.dart';
import 'features/converter/presentation/blocs/conversion/conversion_bloc.dart';
import 'features/converter/presentation/blocs/currencies/currencies_bloc.dart';
import 'features/converter/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init dependencies
  await di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<CurrenciesBloc>()),
        BlocProvider(create: (_) => di.sl<ConversionBloc>()),
        BlocProvider(
          create: (_) =>
              di.sl<CurrentCurrenciesBloc>()..add(SetCurrentCurrencies()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.background,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
