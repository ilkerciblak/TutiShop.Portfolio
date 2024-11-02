enum FetchStatus {
  idle,
  loading,
  success,
  failed,
}

extension FetchStatusX on FetchStatus {
  bool get isIdle => index == 0;
  bool get isLoading => index == 1;
  bool get isSuccess => index == 2;
  bool get isFailed => index == 3;
}
