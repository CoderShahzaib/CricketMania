import 'package:cricketmania/firebase_options.dart';
import 'package:cricketmania/utils/routes/routes_name.dart';
import 'package:cricketmania/view_model/account_services/account_services.dart';
import 'package:cricketmania/view_model/home_services/home_services.dart';
import 'package:cricketmania/view_model/home_services/home_view_model2.dart';
import 'package:cricketmania/view_model/home_view_model.dart';
import 'package:cricketmania/view_model/scorecard_services/scorecard_view_model.dart';
import 'package:cricketmania/view_model/splash_services/animation_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cricketmania/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimationProvider()),
        ChangeNotifierProvider(create: (context) => HomeServices()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel2()),
        ChangeNotifierProvider(create: (context) => ScorecardViewModel()),
        ChangeNotifierProvider(
          create: (context) => AccountServices(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CricketMania',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
