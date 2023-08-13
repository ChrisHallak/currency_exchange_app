import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/converter/converter_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/pages/logo_page.dart';
import 'package:my_exchange/my_observer.dart';
import 'dependencies_injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrenciesBloc>(
          create: (context) => di.sl<CurrenciesBloc>(),
        ),
        BlocProvider<ConverterBloc>(
          create: (context) => di.sl<ConverterBloc>(),
        )
      ],
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: MaterialApp(debugShowCheckedModeBanner: false, home: LogoPage()),
      ),
    );
  }
}
