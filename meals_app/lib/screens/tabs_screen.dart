import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/blocs/blocs.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/widgets/current_page.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  void _setScreen(String identifier, BuildContext context) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    
    // final List<Meal> availableMeals = ref.watch(filteredMealsProvider);

    // Moved currentPage to a stless Widget
    // Widget currentPage =
    //     BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
    //   final meals = filteredMeals(state);

    //   return CategoriesScreen(
    //     availableMeals: meals,
    //   );
    // });

    // String currentPageTitle = "Categories";

    // if (_selectedPageIndex == 1) {
    //   //  final favoriteMeals = ref.watch(favoriteMealsProvider);

    //   currentPage =
    //       BlocBuilder<FavoritesBloc, FavoritesState>(builder: (context, state) {
    //     final favoriteMeals = context.read<FavoritesBloc>();

    //     return MealsScreen(
    //       meals: favoriteMeals.state.favoriteMeals,
    //     );
    //   });
    //   currentPageTitle = "Your Favorites";
    // }

    return BlocBuilder<PageIndexBloc, PageIndexState>(
      builder: (ctx, state) { 

        var selectedPageIndex = state.pageIndex;

        print('indiceee: $selectedPageIndex');
        String currentPageTitle =
      selectedPageIndex == 1 ? "Your Favorites" : "Categories";


        return Scaffold(
          appBar: AppBar(
            title: Text(currentPageTitle),
          ),
          drawer: MainDrawer(
            onSelectScreen: (identifier) {
              _setScreen(identifier, context);
            },
          ),
          body: CurrentPage(selectedPageIndex: selectedPageIndex),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              ctx.read<PageIndexBloc>().add(SetPageIndexEvent(index));
            },
            currentIndex: selectedPageIndex,
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
    );
  }
}
