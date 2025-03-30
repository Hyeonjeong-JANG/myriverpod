import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // provider가 update가 되면 실행된다.
  // main에 observer가 추가되었기 때문에 mian에 있는 모든 provider의 update를 감지하고 아래의 print가 된다.
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print(
        '[Provider Updated] provider: $provider / previousValue: $previousValue / newValue: $newValue');
  }

  // provider가 추가되면 실행된다.
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    print('[Provider Added] provider: $provider / value: $value');
  }

  // provider가 사라지면 실행된다.  
  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    print('[Provider Disposed] provider: $provider');
  }
}
