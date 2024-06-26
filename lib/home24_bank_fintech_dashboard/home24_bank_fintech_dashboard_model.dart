import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home24_bank_fintech_dashboard_widget.dart'
    show Home24BankFintechDashboardWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home24BankFintechDashboardModel
    extends FlutterFlowModel<Home24BankFintechDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
