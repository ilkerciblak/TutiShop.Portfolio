import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserTabState {
  final FetchStatus fetchStatus;
  final String errorMessage;
  final User user;

  UserTabState({
    required this.fetchStatus,
    required this.errorMessage,
    required this.user,
  });

  factory UserTabState.initial() => UserTabState(
        fetchStatus: FetchStatus.idle,
        user: User.def(),
        errorMessage: '',
      );

  UserTabState copyWith({
    FetchStatus? fetchStatus,
    String? errorMessage,
    User? user,
  }) =>
      UserTabState(
        fetchStatus: fetchStatus ?? this.fetchStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        user: user ?? this.user,
      );

  @override
  int get hashCode =>
      user.hashCode ^ fetchStatus.hashCode ^ errorMessage.hashCode;

  @override
  bool operator ==(covariant UserTabState other) {
    if (identical(other, this)) return true;

    return other.user == user &&
        other.fetchStatus == fetchStatus &&
        other.errorMessage == errorMessage;
  }
}
