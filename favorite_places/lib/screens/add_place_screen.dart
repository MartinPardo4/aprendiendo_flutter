import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/input_image.dart';
import 'package:favorite_places/widgets/input_location.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/providers/favorite_places_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  var _enteredName = "";
  File? _selectedImage;
  final _keyForm = GlobalKey<FormState>();
  

  void _addPlace() {
    if(_keyForm.currentState!.validate()){

      if(_selectedImage == null){
        return;
      }
      _keyForm.currentState!.save();
      ref
      .read(favoritePlacesProvider.notifier)
      .addFavoritePlace(
        Place(name: _enteredName, image: _selectedImage!),
      );
      Navigator.of(context).pop();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 2 and 50 characters";
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 12,),
              InputImage(onPickImage: (image) {
                _selectedImage = image;
              },),
              const SizedBox(height: 12,),
              InputLocation(),
              const SizedBox(height: 36,),
              //const Spacer(),
              ElevatedButton.icon(
                  onPressed: _addPlace,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Place"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
