import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/blocs/blocs.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/favorites_provider.dart';
//import 'package:meals_app/providers/filters_provider.dart';


class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => 
          BlocProvider.value(
            value: BlocProvider.of<FiltersBloc>(context),
            child: const FiltersScreen(),
          ),  
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    // final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    

    Widget currentPage = BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
      final meals = filteredMeals(state);

      return CategoriesScreen(
        availableMeals: meals,
      );
    }); 

    String currentPageTitle = "Categories";

    if (_selectedPageIndex == 1) {
    //  final favoriteMeals = ref.watch(favoriteMealsProvider);
    
      currentPage = BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state){
          final favoriteMeals = context.read<FavoritesBloc>();
          return MealsScreen(
            meals: favoriteMeals.state.favoriteMeals,
          );
        }
      );
      currentPageTitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
