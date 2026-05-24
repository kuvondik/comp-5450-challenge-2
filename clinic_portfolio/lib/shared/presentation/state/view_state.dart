enum ViewStatus { idle, loading, success, error }

class ViewState<T> {
  final ViewStatus status;
  final T? data;
  final String? errorMessage;

  const ViewState._({required this.status, this.data, this.errorMessage});

  const ViewState.idle() : this._(status: ViewStatus.idle);
  const ViewState.loading() : this._(status: ViewStatus.loading);
  const ViewState.success(T data) : this._(status: ViewStatus.success, data: data);
  const ViewState.error(String message)
      : this._(status: ViewStatus.error, errorMessage: message);

  bool get isLoading => status == ViewStatus.loading;
  bool get isSuccess => status == ViewStatus.success;
  bool get isError => status == ViewStatus.error;
}
