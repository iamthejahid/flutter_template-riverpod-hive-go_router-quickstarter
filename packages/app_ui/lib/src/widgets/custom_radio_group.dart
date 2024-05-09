import 'package:app_ui/app_ui.dart';

class CustomRadioGroup extends StatelessWidget {
  final ValueNotifier<String?> groupValue;
  final List<String> items;
  final Function(String?)? onChanged;

  CustomRadioGroup({
    required this.groupValue,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: items
            .map(
              (e) => Expanded(
                child: Row(
                  key: Key(e),
                  children: [
                    Radio(
                      value: e,
                      groupValue: groupValue.value,
                      onChanged: (v) => {
                        groupValue.value = v!,
                        onChanged?.call(v),
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => {
                          groupValue.value = e,
                          onChanged?.call(e),
                        },
                        child: Text(e),
                      ),
                    )
                  ],
                ),
                flex: 1,
              ),
            )
            .toList()
        // ..add(Expanded(child: Container())),
        );
  }
}
