import 'package:bloc/bloc.dart';
import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/results.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_state.dart';
import 'package:pokemon_app/service/repository/pokemon_client.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonClient pokemonClient = PokemonClient();
  List<Results>? pokemonNameList = [];
  Iterable<Abilities>? abilities = [];

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {});

    on<GetPokemonNameEvent>((event, emit) async {
      pokemonNameList = await pokemonClient.getFetch();
      emit(GetPokemonNameState(pokemonList: pokemonNameList!));
    });

    on<CharacterFeaturesEvent>((event, emit) async {
      abilities = await pokemonClient.getAbilities(event.url);
    });
  }
}
