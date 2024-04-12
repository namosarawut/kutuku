
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutuku/bloc/register_bloc/register_cubit.dart';

final List<BlocProvider> blocs = [
  BlocProvider(create: (_) => RegisterFormBloc()),
];
