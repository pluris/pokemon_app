abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class CharacterFeaturesState extends DetailsState {}

class LoadingState extends DetailsState {
  final bool isLoading;
  LoadingState(this.isLoading);
}
