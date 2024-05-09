import 'package:app_ui/app_ui.dart';

class YesNoRadioGroup extends StatelessWidget {
  final ValueNotifier<String?> groupValue;

  YesNoRadioGroup({required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <dynamic>["Yes", "No"]
          .map(
            (e) => Expanded(
              child: Row(
                key: Key(e),
                children: [
                  Radio(
                    value: e,
                    groupValue: groupValue.value,
                    onChanged: (v) => groupValue.value = v!,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => groupValue.value = e,
                      child: Text(e),
                    ),
                  )
                ],
              ),
              flex: 1,
            ),
          )
          .toList()
        ..add(Expanded(child: Container())),
    );
  }
}
