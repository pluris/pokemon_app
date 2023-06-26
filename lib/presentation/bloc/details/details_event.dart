import 'package:flutter/material.dart';

@immutable
abstract class DetailsEvent {}

class GetDetailsEvent extends DetailsEvent {
  final String url;
  GetDetailsEvent(this.url);
}
