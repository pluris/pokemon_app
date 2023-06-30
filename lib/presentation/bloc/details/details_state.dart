import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/types.dart';

abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class CharacterFeaturesState extends DetailsState {
  Iterable<Abilities> abilities;
  Iterable<Types> types;
  List<int> features;

  CharacterFeaturesState(
      {required this.abilities, required this.types, required this.features});
}

class LoadingState extends DetailsState {
  final bool isLoading;
  LoadingState(this.isLoading);
}
