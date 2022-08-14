import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/cubit/qrcubit.dart';
import 'package:qr_scanner/cubit/qrcubit_state.dart';
import 'package:qr_scanner/pages/camera.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  String code = '';

  @override
  Widget build(BuildContext context) {
    QrCubit qrCubit = context.read<QrCubit>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1)),
                )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Press the button to start scanning',
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1)),
                )),
              ],
            ),
            Material(
              child: InkWell(
                onTap: () async {
                  if (await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraView())) !=
                      null) {
                    code = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CameraView()));
                  } else {
                    code = '';
                  }
                  qrCubit.updateQrCode(code);
                },
                child: Center(
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('lib/assets/qr_buttom.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            BlocBuilder<QrCubit, QrCubitState>(builder: (context, state) {
              return TextButton(
                  onPressed: () async {
                    if (!await launchUrl(
                      Uri.parse(state.qrCode),
                    )) {
                      throw 'Could not launch ${state.qrCode}';
                    }
                  },
                  child: Text(
                    state.qrCode,
                    style: TextStyle(
                        color: Colors.blue[900],
                        decoration: TextDecoration.underline),
                  ));
            }),
            const Text(
              'Please remember: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              ' Don\'t open unknowns QRs, you can be scammed!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
