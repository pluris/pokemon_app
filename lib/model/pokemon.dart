import 'package:pokemon_app/model/abilities.dart';
import 'package:pokemon_app/model/ability.dart';
import 'package:pokemon_app/model/stats.dart';
import 'package:pokemon_app/model/types.dart';

class Pokemon {
  List<Abilities>? abilities;
  int? height;
  Ability? species;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  Pokemon(
      {this.abilities,
      this.height,
      this.species,
      this.stats,
      this.types,
      this.weight});

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    height = json['height'];
    species =
        json['species'] != null ? Ability.fromJson(json['species']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }

    data['height'] = height;

    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}
