import 'package:app_ui/app_ui.dart';

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.selected,
    MaterialState.focused,
    MaterialState.pressed,
  };
  if (states.any(interactiveStates.contains)) {
    return AppColors.primaryColor;
  }
  return Colors.white;
}
