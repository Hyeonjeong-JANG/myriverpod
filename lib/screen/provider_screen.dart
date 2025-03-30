import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/provider.dart';
import 'package:myriverpod/riverpod/state_notifier.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    // filterShoppingListProvider를 watch하면 그 안에 있는 두 가지(filterProvider(filterState), shoppingListProvider(shoppingListState))를 listen하게 된다.
    // filterProvider, shoppingListProvider의 값이 update 될 때마다 그것들을 watch를 하고 있는 filterShoppingListProvider가 실행된다.

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (_) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(
                    e.name,
                  ),
                ),
              )
              .toList(),
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
        ),
      ],
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                value: e.hasBought,
                title: Text(e.name),
                onChanged: (value) {
                  ref.read(shoppingListProvider.notifier).toggleHasBought(
                        name: e.name,
                        // shoppingListProvider에 있는 값을 변경했는데
                        // filteredShoppingListProvider에 있는 값도 변경되었다.
                        //
                      );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
