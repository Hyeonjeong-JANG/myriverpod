import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/model/shopping_item_model.dart';
import 'package:myriverpod/riverpod/state_notifier.dart';

// 우리가 watch하고 있는 프로바이더가 변경되면 최상위 provider가 변경되어야 하기 때문에
// read는 잘 안 쓰고 watch를 쓴다.
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    // filterState에 따라서 필터링을 해서 return을 하고 싶다.
    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  // 안 매움
  notSpicy,
  // 매움
  spicy,
  // 전부
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
