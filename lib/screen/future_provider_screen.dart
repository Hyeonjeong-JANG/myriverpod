import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 우리가 상태를 받을 때 AsyncValue라는 값으로 들어오는데 
    //그 값을 받으면 when을 사용할 수 있고 그러면 데이터가 있는 경우, 에러가 발생한 경우, 로딩이 진행중인 경우 이렇게 세가지 경우를 나눠서 처리할 수 있다.
    final state = ref.watch(multipleFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            }, // 로딩이 끝나서 데이터가 있는 경우
            error: (error, stack) {
              return Text(
                error.toString(),
              );
            }, // 에러가 발생한 경우
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            }, // 로딩이 진행중인 경우
          )
        ],
      ),
    );
  }
}
