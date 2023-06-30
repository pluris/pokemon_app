import 'package:bloc/bloc.dart';
import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/types.dart';
import 'package:pokemon_app/presentation/bloc/details/details_event.dart';
import 'package:pokemon_app/presentation/bloc/details/details_state.dart';
import 'package:pokemon_app/service/repository/pokemon_client.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  PokemonClient pokemonClient = PokemonClient();
  Iterable<Abilities> abilities = [];
  Iterable<Types>? types = [];
  List<int> features = [];

  DetailsBloc() : super(DetailsInitialState()) {
    on<DetailsEvent>((event, emit) {});

    on<GetDetailsEvent>((event, emit) async {
      emit(LoadingState(true));
      abilities = await pokemonClient.getAbilities(event.url);
      types = await pokemonClient.getTypes(event.url);
      features = await pokemonClient.getFeatures(event.url);
      emit(LoadingState(false));
      emit(CharacterFeaturesState(
          abilities: abilities, types: types!, features: features));
    });
  }
}
