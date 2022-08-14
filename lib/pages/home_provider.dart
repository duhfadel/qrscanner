import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/cubit/qrcubit.dart';
import 'package:qr_scanner/pages/home.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrCubit>(
      create: (context) => QrCubit(),
      child:  HomeView()
    );
  }
}