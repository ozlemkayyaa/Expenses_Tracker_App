import 'dart:developer'; // loglama işlevini kullanmak için gerekli
import 'package:bloc/bloc.dart';

// Bu dosya, bir Bloc'un durumunu izlemek ve hata ayıklamak için kullanılan bir "Bloc Observer" sınıfını tanımlar.

class SimpleBlocObserver extends BlocObserver {
  // Bloc oluşturulduğunda çağrılır. Oluşturulan Bloc'un türünü ve durumunu loglar.
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- bloc: ${bloc.runtimeType}');
  }

  // Bloc'a bir olay gönderildiğinde çağrılır. Bloc türünü ve gönderilen olayı loglar.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  // Bloc'un durumu değiştiğinde çağrılır. Bloc türünü ve değişikliği loglar.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  // Bloc'ta bir geçiş oluştuğunda çağrılır. Bloc türünü ve geçişi loglar.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  // Bloc'ta bir hata oluştuğunda çağrılır. Hata türünü ve yığın izini(stack trace) loglar.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  // Bloc kapatıldığında çağrılır. Kapatılan Bloc'un türünü loglar.
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- bloc: ${bloc.runtimeType}');
  }
}
