import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cube.dart';
import 'package:pokedex/data/pokemon_details.dart';

class PokemonDetailsView extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Deatails'),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
        builder:(context,details){
         return details !=null?
          Center(child: Text(details.name)) 
          : Center(child: CircularProgressIndicator(),);
      }),
    );

  }


}