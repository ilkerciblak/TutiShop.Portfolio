import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/modules/user/presentation/user_tab_main/bloc/user_tab_state.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserTabCubit extends Cubit<UserTabState> {
  final IUserRepository _userRepository = GetIt.instance<IUserRepository>();

  UserTabCubit()
      : super(
          UserTabState.initial(),
        );

  void getUser() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));

    var response = await _userRepository
        .getCurrentUser(
          accessToken: TokenManager.i.getAccessToken() ?? '',
        )
        .run();

    response.fold(
      (l) {
        print(l);
      },
      (r) {
        emit(
          state.copyWith(
            user: r,
            fetchStatus: FetchStatus.success,
          ),
        );
      },
    );
  }

  void logout() {}
}
