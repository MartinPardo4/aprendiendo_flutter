import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget{

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{

  var _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleMealFavoriteStatus(Meal meal){

    setState(() {
      if(_favoriteMeals.contains(meal)){
        _favoriteMeals.remove(meal);
      }
      else{
        _favoriteMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget currentPage = CategoriesScreen(onToggledfavorite: _toggleMealFavoriteStatus,);
    String currentPageTitle = "Categories";

    if(_selectedPageIndex == 1){
      currentPage = MealsScreen(meals: _favoriteMeals, onToggledFavorite: _toggleMealFavoriteStatus,);
      currentPageTitle = "Your Favorites";
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPageTitle),
      ),
      drawer: const MainDrawer(),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories",),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites",),
        ],
      ),
    );
    
  }

}