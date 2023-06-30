import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constant/app_colors.dart';
import 'package:pokemon_app/constant/app_images.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_event.dart';
import 'package:pokemon_app/presentation/bloc/pokemon/pokemon_state.dart';
import 'package:pokemon_app/presentation/view/character_detail_page.dart';
import 'package:pokemon_app/presentation/view/widget/character_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context).add(GetPokemonNameEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.h,
          backgroundColor: blue,
          title: Center(
            child: Image.asset('assets/images/logo/pokemon_logo.png',
                height: 180.h, alignment: Alignment.center),
          ),
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is GetPokemonNameState) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: state.pokemonList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterDetailPage(
                                    name: state.pokemonList[index].name
                                        .toString(),
                                    pokemon:
                                        images[state.pokemonList[index].name]!,
                                    url: state.pokemonList[index].url
                                        .toString())));
                      },
                      child: CharacterCard(state, index));
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
