import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/cubit/qrcubit_state.dart';

class QrCubit extends Cubit<QrCubitState> {
  QrCubit() : super(QrCubitState(loading: false, qrCode: ''));


  Future<void> updateQrCode(qrCode) async {
    if (qrCode != null) {
      emit(QrCubitState(loading: false, qrCode: qrCode));
    }
  }
}
