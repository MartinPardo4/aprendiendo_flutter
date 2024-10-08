import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerStatefulWidget {
  const PlacesList({super.key});

  @override
  ConsumerState<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends ConsumerState<PlacesList> {
  void _addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddPlaceScreen(),
      ),
    );
  }

  void _removeItem(Place item) {
    setState(() {
      ref.read(favoritePlacesProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Place> favoritePlaces = ref.watch(favoritePlacesProvider);

    Widget content = Center(
      child: Text(
        "No places added yet.",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );

    if (favoritePlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(favoritePlaces[index]),
          onDismissed: (direction) => _removeItem,
          child: ListTile(
            title: Text(
              favoritePlaces[index].name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>
                      PlaceDetailScreen(place: favoritePlaces[index]),
                ),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
