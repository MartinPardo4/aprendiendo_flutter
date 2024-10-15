import 'package:flutter/material.dart';
import 'package:meals_app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltersScreen extends StatelessWidget{
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final currentFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (ctx, state) {
          return Column(
            children: [
              SwitchListTile(
                value: state.filters[Filter.glutenFree]!,
                onChanged: (onSwitch) {
                  ctx.read<FiltersBloc>().add(SetFilterEvent(Filter.glutenFree, onSwitch));
                },
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  "Only include gluten-free meals",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
              SwitchListTile(
                value: state.filters[Filter.lactoseFree]!,
                onChanged: (onSwitch) {
                  context.read<FiltersBloc>().add(SetFilterEvent(Filter.lactoseFree, onSwitch));
                },
                title: Text(
                  "Lactose-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  "Only include lactose-free meals",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
              SwitchListTile(
                value: state.filters[Filter.vegetarian]!,
                onChanged: (onSwitch) {
                  context.read<FiltersBloc>().add(SetFilterEvent(Filter.vegetarian, onSwitch));
                },
                title: Text(
                  "Vegetarian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  "Only include vegetarian meals",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
              SwitchListTile(
                value: state.filters[Filter.vegan]!,
                onChanged: (onSwitch) {
                  context.read<FiltersBloc>().add(SetFilterEvent(Filter.vegan, onSwitch));
                },
                title: Text(
                  "Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: Text(
                  "Only include vegan meals",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          );
        },
      ),
    );
  }
}
