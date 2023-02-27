import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_info_response.dart';
import 'package:pokedex/data/pokemon_repository.dart';
import 'package:pokedex/data/pokemon_species_info.dart';
import '../data/pokemon_details.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails>{
  final _pokemonRespository = PokemonRepository();
  PokemonDetailsCubit() : super(null);


  void getPokemonDetails(int pokemonId) async{
    final responses = await Future.wait([
      _pokemonRespository.getPokemonInfo(pokemonId),
      _pokemonRespository.getPokemoSpeciesInfo(pokemonId)
    ]);
    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id, 
      name: pokemonInfo.name, 
      imageUrl: pokemonInfo.imageUrl, 
      types: pokemonInfo.types, 
      height: pokemonInfo.height, 
      weight: pokemonInfo.weight,
    /*  description: speciesInfo.description */));

  }

   void clearPokemonDetails() => emit(null);

}