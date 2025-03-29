import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myriverpod/layout/default_layout.dart';
import 'package:myriverpod/riverpod/listen_provider.dart';

// stateless widget을 provider를 사용할 수 있게 바꾸려면 ConsumerWidget으로 바꿔주는데
// statefulwidget을 provider를 사용할 수 있게 바꾸려면 ConsumerStatefulWidget으로 바꿔주면 된다.
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10, // 10개의 탭
      vsync: this,
      initialIndex: ref.read(listenProvider),
      // 뒤로 갔다가 다시 페이지로 돌아와도 이전에 갔던 숫자가 남아있음. 언제까지 유지가 되나? listenProvider가 삭제될때까지!
    );
  }

  @override
  Widget build(BuildContext context) {
    // 두 번째 파라미터로 WidgetRef를 따로 받지 않아도 ConsumerState안에 ref가 기본으로 제공되고 context도 글로벌하게 사용할 수 있다.

    // 값이 변경이 될 때마다 컨트롤라가 자동으로 탭을 변경시켜준다.
    ref.listen<int>(listenProvider, (previous, next) {
      // 변경될 값(previous, next에 의해 controller의 값이 변경되어서 작동한다. )
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
      // previous에는 기존 상태, next에는 변경될 상태
      print('previous: $previous');
      print('next: $next');
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) =>
                      state == 10 ? 10 : state + 1); // 10이면 10유지, 아니면 1증가
                },
                child: Text(
                  '다음',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) =>
                      state == 0 ? 0 : state - 1); // 0이면 0유지, 아니면 1감소
                },
                child: Text(
                  '이전',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
