import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:flutter_firebase_login/bootstrap.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  bootstrap(() => App(authenticationRepository: authenticationRepository));
}
