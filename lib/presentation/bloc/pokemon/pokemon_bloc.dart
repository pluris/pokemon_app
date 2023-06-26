import 'package:bloc/bloc.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());
}