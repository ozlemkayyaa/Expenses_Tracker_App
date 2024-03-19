import 'package:bloc/bloc.dart';
import 'package:expenses_tracker/app.dart';
import 'package:expenses_tracker/firebase_options.dart';
import 'package:expenses_tracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'in başlatılmasını sağlar
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //uygulamanın genelinde Bloc durumunu izlemek için bir Bloc gözlemcisini ayarlar
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
