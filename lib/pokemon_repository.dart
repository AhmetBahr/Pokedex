import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = "pokeapi.co";
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {


    final queryParemetres = { 
      'limit' : '200','offset':(pageIndex * 200).toString()

    };

    final uri = Uri.http(baseUrl, '/api/v2/pokemon', queryParemetres);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);


    return PokemonPageResponse.fromJson(json);
  }

}