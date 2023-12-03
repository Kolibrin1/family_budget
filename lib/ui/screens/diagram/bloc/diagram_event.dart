part of 'diagram_bloc.dart';

@freezed
class DiagramEvent with _$DiagramEvent {
  const factory DiagramEvent.initial() = _InitialEvent;

  const factory DiagramEvent.selectTypeView({
    required int type,
  }) = _SelectTypeView;
}
