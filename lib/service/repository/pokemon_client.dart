import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/results.dart';
import 'package:pokemon_app/service/repository/dio_client.dart';

class PokemonClient extends DioClient {
  Future<List<Results>>? getFetch() async {
    List<Results> pokeList = [];

    final Response response = await dio.get(charUrl);
    List poke = response.data['results'] as List;
    pokeList = poke.map<Results>((e) {
      return Results.fromJson(e);
    }).toList();

    for (var pokeName in pokeList) {
      if (kDebugMode) {
        print(pokeName.name);
      }
    }
    return pokeList;
  }

  Future<Iterable<Abilities>> getAbilities(String url) async {
    Iterable<Abilities> abilities;

    final Response response = await dio.get(url);
    List ability = response.data['abilities'];
    abilities = ability.map<Abilities>((e) {
      return Abilities.fromJson(e);
    }).toList();
    for (var data in abilities) {
      if (kDebugMode) {
        print(data.ability!.name);
      }
    }
    return abilities;
  }

  Future<Iterable<Types>>? getTypes(String url) async {
    Iterable<Types> types = [];

    final Response response = await dio.get(url);
    List type = response.data['types'] ?? [];
    types = type.map<Types>((e) {
      return Types.fromJson(e);
    }).toList();

    for (var typeName in types) {
      print(typeName.type!.name);
    }
    return types;
  }

  Future<List<int>> getFeatures(String url) async {
    final Response response = await dio.get(url);
    int weight = response.data['weight'];
    int height = response.data['height'];
    return [weight, height];
  }

  Future<Iterable<Stats>> getStats(String url) async {
    Iterable<Stats> stats;

    final Response response = await dio.get(url);
    List ability = response.data['stats'];
    stats = ability.map<Stats>((e) {
      return Stats.fromJson(e);
    }).toList();
    for (var data in stats) {
      print(data.stat!.name);
    }
    return stats;
  }
}
