import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/account/data/account_repository.dart';

class NameController extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    final accountRepository = ref.read(accountRepositoryProvider);
    return await _loadUserName(accountRepository);
  }

  Future<String> _loadUserName(AccountRepository accountRepository) async {
    final name = await accountRepository.getUserName();
    state = AsyncValue.data(name);
    return name;
  }
}

final nameProvider =
    AsyncNotifierProvider<NameController, String>(NameController.new);
