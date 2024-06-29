part of 'intro_bloc.dart';

class IntroState extends Equatable {
  final int currentIndex;

  const IntroState({
    this.currentIndex = 0,
  });

  IntroState copyWith({
    int? currentIndex,
  }) {
    return IntroState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
