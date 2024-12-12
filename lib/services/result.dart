class Result<TSuccess, TFailure> {
  final TSuccess? success;
  final TFailure? error;
  final bool isSuccess;

  Result._(this.success, this.error, this.isSuccess);

  factory Result.success(TSuccess value) {
    return Result._(value, null, true);
  }

  factory Result.error(TFailure error) {
    return Result._(null, error, false);
  }

  bool get isFailure => !isSuccess;
}
