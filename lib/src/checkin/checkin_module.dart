import 'package:flutter_bloc/flutter_bloc.dart';

import 'presenter/bloc/checkin_bloc.dart';

final checkinModule = [
  BlocProvider(
    create: (context) => CheckinBloc(
      context.read(),
      context.read(),
      context.read(),
    ),
  ),
];
