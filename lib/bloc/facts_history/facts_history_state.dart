part of 'facts_history_cubit.dart';

enum HistoryFactStatus {
  initial,
  loading,
  loaded,
  error,
}

class FactsHistoryLoaded extends Equatable {
  final HistoryFactStatus status;
  final String errorMessage;
  final List<Fact> factsHistory;

  const FactsHistoryLoaded({
    this.status = HistoryFactStatus.initial,
    this.errorMessage = '',
    this.factsHistory = const [],
  });

  FactsHistoryLoaded copyWith({
    HistoryFactStatus? status,
    String? errorMessage,
    List<Fact>? factsHistory,
  }) {
    return FactsHistoryLoaded(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      factsHistory: factsHistory ?? this.factsHistory,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, factsHistory];
}
