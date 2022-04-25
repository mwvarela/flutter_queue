import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/configuration_bloc.dart';

final configurationModule = [
  BlocProvider(
    create: (context) => ConfigurationBloc(
      context.read(),
      context.read(),
      context.read(),
    ),
  ),
];
