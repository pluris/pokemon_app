import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constant/app_colors.dart';
import 'package:pokemon_app/presentation/bloc/details/details_bloc.dart';
import 'package:pokemon_app/presentation/bloc/details/details_event.dart';
import 'package:pokemon_app/presentation/view/widget/features_card.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage(
      {super.key,
      required this.pokemon,
      required this.name,
      required this.url});

  final String pokemon;
  final String name;
  final String url;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    BlocProvider.of<DetailsBloc>(context).add(GetDetailsEvent(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      backgroundColor: blue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Image.asset(widget.pokemon, height: 260.h)),
            FeaturesCard(name: widget.name, pokemon: widget.pokemon),
          ],
        ),
      ),
    );
  }
}
