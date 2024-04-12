import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kutuku/bloc/appbar_fade_logic_bloc/appbar_fade_logic_bloc.dart';
import 'package:kutuku/bloc/register_bloc/register_cubit.dart';
import 'package:kutuku/core/app_core.dart';
import 'package:kutuku/routing/map_routing.dart';
import 'package:kutuku/user/data_store.dart';

main() {
  runApp(KuTuKuApp());
}

class KuTuKuApp extends StatelessWidget {
  final _routes = evShopRoutes;

  _setUserAgent() async {
    var platform = Platform.isAndroid ? "Android" : "iOS";
    var version = Platform.version;
    var operatingSystemVersion = Platform.operatingSystemVersion;
    String agent = "Mozilla/5.0 (Linux; U; $platform $version) Build/$operatingSystemVersion)";

    DataStore().setArgs({"USER_AGENT": agent});
  }

  Future<bool> _loadEnv() async {
    try {
      const setEnv = String.fromEnvironment('SET_ENV', defaultValue: 'dev');
      String? env = setEnv;
      bool isForE2E = false;
      if (isForE2E) {
        env = 'mock';
      } else {
        env = await rootBundle.loadString('env-local');
      }
      env = env.trim().replaceAll('\n', '');
      await dotenv.load(fileName: 'env/$env');
      DataStore().setEnv(dotenv.env);
      await _setUserAgent();
    } catch (e) {
      log(e.toString());
    }

    return true;
  }

  KuTuKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadEnv(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<AppbarFadeLogicBloc>(create: (BuildContext context) => AppbarFadeLogicBloc()),
                BlocProvider<RegisterFormBloc>(create: (BuildContext context) => RegisterFormBloc()),
              ],
              child: MaterialApp(
                title: 'Kutuku',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                routes: _routes,
                initialRoute: '/',
                navigatorKey: KutukuCore.navigatorState,
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator()
            );
          }
        });
  }
}

