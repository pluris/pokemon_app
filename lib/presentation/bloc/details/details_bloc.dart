import 'package:bloc/bloc.dart';
import 'package:pokemon_app/presentation/bloc/details/details_event.dart';
import 'package:pokemon_app/presentation/bloc/details/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitialState());
}
