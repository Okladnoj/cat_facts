part of 'cat_fact_cubit.dart';

enum CatFactStatus {
  initial,
  loading,
  loaded,
  error,
}

@immutable
class CatFactState extends Equatable {
  final CatFactStatus status;
  final String errorMessage;
  final Cat? cat;

  const CatFactState({
    this.status = CatFactStatus.initial,
    this.errorMessage = '',
    this.cat,
  });

  CatFactState copyWith({
    CatFactStatus? status,
    String? errorMessage,
    Cat? cat,
  }) {
    return CatFactState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      cat: cat ?? this.cat,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, cat];
}
