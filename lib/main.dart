import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_hunter/src/application/presentation/pages/no_internet_page.dart';
import 'package:recipe_hunter/src/application/presentation/pages/onboardingpage.dart';
import 'package:recipe_hunter/src/data/services/no_internet_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NoInternetService().intialize();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: NoInternetService.streamconection,
        initialData: true,
        builder: (context, snapshot) {
          final x = snapshot.data ?? true;
          if (!x) {
            return const NoInternetPage();
          }
          return const Onboardingpage();
        },
      ),
    );
  }
}
