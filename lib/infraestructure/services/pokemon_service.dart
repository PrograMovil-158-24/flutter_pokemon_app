import 'package:dio/dio.dart';
import 'package:flutter_pokemon_app/domain/pokedex.dart';
import 'package:flutter_pokemon_app/domain/pokemon.dart';

final dio = Dio();
const urlBase = "https://pokeapi.co/api/v2/pokemon";
const itemsPage = 20;

//CRUD operations
//List of pokemons
Future<Pokdex> getPokemons(int numberPage) async {
  Response response = await dio.get(
    urlBase,
    queryParameters: {'offset': (numberPage - 1) * itemsPage, 'limit': itemsPage},
  );

  if(response.statusCode == 200) {
    return Pokdex.fromJson(response.data);
  } else {
    throw Exception('Failed to load pokemons');
  }
}

//Pokemon by id
Future<Pokemon> getPokemon(int id) async {
  Response response = await dio.get(
    "$urlBase/$id", 
  );
  if(response.statusCode == 200) {
    return Pokemon.fromJson(response.data);
  } else {
    throw Exception('Failed to load pokemon');
  }
}

//Add a new pokemon
Future<Pokemon> addPokemon(Pokemon pokemon) async {
  Response response = await dio.post(
    urlBase,
    data: pokemon.toJson(),
  );

  if(response.statusCode == 201) {
    return Pokemon.fromJson(response.data);
  } else {
    throw Exception('Failed to add pokemon');
  }
}

//Update a pokemon
Future updatePokemon(Pokemon pokemon) async {
  Response response = await dio.put(
    urlBase,
    data: pokemon.toJson(),
  );

  if(response.statusCode != 200) {
    throw Exception('Failed to update pokemon');
  }
}

//Delete a pokemon
Future deletePokemon(int id) async {
  Response response = await dio.delete(
    urlBase,
    queryParameters: {'id': id},
  );

  if(response.statusCode != 204) {
    throw Exception('Failed to delete pokemon');
  }
}