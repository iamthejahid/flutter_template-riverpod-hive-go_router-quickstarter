import 'package:app_ui/app_ui.dart';

class CustomerCardCallCycle extends StatelessWidget {
  final Widget? extraChild;
  final String name;
  final String customeId;
  final String route;
  final String customerType;
  final EdgeInsetsGeometry? margin;

  const CustomerCardCallCycle({
    super.key,
    this.extraChild,
    required this.name,
    required this.customeId,
    required this.route,
    required this.customerType,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      // padding: EdgeInsets.all(12.w),
      decoration: CUSTOM_CARD_DECORATION.copyWith(
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF8EF9A0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
                child: LabeledTextRow(
                  label: "Customer",
                  text: customerType,
                  isBold: true,
                ),
              ),
            ),
            gap12,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: LabeledTextRow(
                label: "Customer Name",
                text: name,
                isBold: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: LabeledTextRowFlexible(
                label: "Customer ID",
                text: customeId,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: LabeledTextRowFlexible(
                label: "Roue",
                text: route,
              ),
            ),
            if (extraChild != null) extraChild!,
            gap12,
          ],
        ),
      ),
    );
  }
}
