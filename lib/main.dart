import 'package:currency_calculator/bloc/ads_cubit.dart';
import 'package:currency_calculator/bloc/app_cubit.dart';
import 'package:currency_calculator/bloc/currency_selection_cubit.dart';
import 'package:currency_calculator/data/repository.dart';
import 'package:currency_calculator/data/types.dart';
import 'package:currency_calculator/firebase_options.dart';
import 'package:currency_calculator/ui/screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/review_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Box box = await Hive.openBox("cache");
  ads.MobileAds.instance.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final CurrencyCalculatorRepository repository = CurrencyCalculatorRepository(box);
  final HydratedStorage storage = await HydratedStorage.build(storageDirectory: await getApplicationSupportDirectory());
  HydratedBlocOverrides.runZoned(() {
    runApp(CurrencyCalculatorApp(repository: repository));
  }, storage: storage);
}

class CurrencyCalculatorApp extends StatelessWidget {
  final CurrencyCalculatorRepository repository;

  const CurrencyCalculatorApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(repository, const AppState(loading: true, error: false))..init()),
        BlocProvider(create: (context) => AdsCubit(false)..init()),
        BlocProvider(create: (context) => ReviewCubit(0)..init()),
        BlocProvider(lazy: false, create: (context) => CurrencySelectionCubit(repository, const CurrencySelectionState(initialized: false))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey
        ),
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(decodeStrategies: [YamlDecodeStrategy()]),
          ),
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
            Locale("de"),
            Locale("en")
          ],
        home: MainScreen(),
      ),
    );
  }
}