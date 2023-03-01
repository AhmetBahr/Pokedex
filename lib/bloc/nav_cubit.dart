import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cube.dart';
import 'package:pokedex/data/pokemon_details.dart';

class NavCubit extends Cubit<int>{
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDeatails (int pokemonId){
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex(){
    emit(null);
        pokemonDetailsCubit.clearPokemonDetails();

  }

}