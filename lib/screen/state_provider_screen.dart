import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref를 통해서 riverpod 안에 선언된 StateProvider에 접근할 수 있다.

    // build함수 안에서 직접적으로 UI에 반영을 하려면 watch를 사용해야 한다.
    final provider = ref.watch(numberProvider); // read, watch, listen이 중요.
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼을 눌렀을 때 실행되는 경우는 read!
                ref
                    .read(numberProvider.notifier)
                    .update((state) => state + 1); // state는 지금 현재 상태이다.
              },
              child: Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => _NextScreen(),
                  ),
                );
              },
              child: Text('NEXT SCREEN'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼을 눌렀을 때 실행되는 경우는 read!
                ref
                    .read(numberProvider.notifier)
                    .update((state) => state + 1); // state는 지금 현재 상태이다.
              },
              child: Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                // 버튼을 눌렀을 때 실행되는 경우는 read!
                ref.read(numberProvider.notifier).state =
                    ref.read(numberProvider.notifier).state - 1;
              },
              child: Text('DOWN'),
            ),
          ],
        ),
      ),
    );
  }
}
