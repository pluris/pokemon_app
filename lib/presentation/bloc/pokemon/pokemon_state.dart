import 'package:flutter/material.dart';
import 'package:pokemon_app/model/results.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class GetPokemonNameState extends PokemonState {
  List<Results> pokemonList = [];

  GetPokemonNameState({required this.pokemonList});
}
