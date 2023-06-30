import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constant/app_colors.dart';
import 'package:pokemon_app/constant/app_images.dart';

class CharacterCard extends StatelessWidget {
  CharacterCard(
    this.state,
    this.index, {
    Key? key,
  }) : super(key: key);

  dynamic state;
  int index;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Padding(
        padding: EdgeInsets.all(4.h),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          child: Stack(
            children: [
              Positioned(
                top: -30,
                right: -30,
                child: Image.asset('assets/images/logo/pokeball_dark.png',
                    color: gray, height: 100.h, width: 100.w),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset('${images[state.pokemonList[index].name]}',
                        height: 135.h),
                    Text('${state.pokemonList[index].name}',
                        style: TextStyle(fontSize: 20.sp, color: blue))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
