import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/domain/index.dart';
import 'package:flutter_pokemon_app/infraestructure/services/pokemon_service.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: FutureBuilder<Pokedex>(
            future: getPokemons(1), // Add parentheses here
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: 
                  (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.results[index].name.toString().toUpperCase(),),
                      onTap: () => {
                        context.go('/details')
                      },
                    );
                  },
                  itemCount: snapshot.data?.results.length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
      ));
  }
}

