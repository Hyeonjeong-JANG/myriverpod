import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // value는 selectProvider의 상태에 해당하는 값이다.
    // 그리고 이 state는 isSpicy가 변할 때만 watch한다!
    // 내가 selectProvider의 value 중 isSpicy에만 관심이 있어서 우와 같이 쓰면 그것만 가져온다!
    // 여기서는 isSpicy가 bool이기 때문에 state는 bool이 된다.

    // listen에도 적용할 수 있다.
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next: $next');
    });

    // 원래는 select를 안 했을 때는 selectProvider의 상태가 변할 때마다 그 상태가 무엇이든간에 listen이 실행이 되어야 하지만 
    //select를 했기 때문에 select 한 값만 listen이 된다. 
    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.toString(),
            ),
            // Text(
            //   state.name,
            // ),
            // Text(
            //   state.isSpicy.toString(),
            // ),
            // Text(
            //   state.hasBought.toString(),
            // ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(selectProvider.notifier)
                    .toggleIsSpice(); // 이걸 누르면 watch를 했기 때문에 build가 되고,
              },
              child: Text('Spicy Toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(selectProvider.notifier)
                    .toggleHasBought(); // 이걸 누르면 listen을 했기 때문에 next: bool만 나온다.
              },
              child: Text('HasBought Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
