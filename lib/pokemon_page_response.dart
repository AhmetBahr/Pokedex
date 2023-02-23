/* 
count:1118
next:"https://pokeapi.co/api/v2/pokemon?offset=300&limit=100"
previous:"https://pokeapi.co/api/v2/pokemon?offset=100&limit=100"
result: [  {name:"unown"
  url:"https://pokeapi.co/api/v2/pokemon/201/"}
  {name:"wobbuffet"
  url:"https://pokeapi.co/api/v2/pokemon/202/"}
]

*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PokemonListing{
  final int id;
  final String name;
  
  PokemonListing({required this.id, required this.name});
  
factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class  PokemonPageResponse {
  final List<PokemonListing> PokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse({
      required this.PokemonListings, required this.canLoadNextPage
    });
 
  factory PokemonPageResponse.fromJson(Map<String, dynamic> json){
    final canLoadNextPage = json['next'] != null;
    final PokemonListings = (json['result'] as List).map((listingJson) => PokemonListing.fromJson(listingJson)).toList();

      return PokemonPageResponse(PokemonListings: PokemonListings, canLoadNextPage: canLoadNextPage);
        
  }

}

