import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app.dart';
import 'package:pokemon_app/presentation/bloc/details/details_bloc.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => PokemonBloc()),
    BlocProvider(create: (context) => DetailsBloc()),
  ], child: const MyApp()));
}
