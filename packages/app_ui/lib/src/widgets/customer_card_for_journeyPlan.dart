import 'package:app_ui/app_ui.dart';

class CustomerCardForJourneyPlan extends StatelessWidget {
  final Widget? extraChild;
  final String name;
  final String customeId;
  final String route;
  final String lastVisitDate;
  final String hcStock;
  final String lastDateOfOrder;
  final String customerType;

  const CustomerCardForJourneyPlan({
    super.key,
    this.extraChild,
    required this.name,
    required this.customeId,
    required this.route,
    required this.lastVisitDate,
    required this.hcStock,
    required this.lastDateOfOrder,
    required this.customerType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      // padding: EdgeInsets.all(12.w),
      decoration: CUSTOM_CARD_DECORATION.copyWith(
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LabeledTextRow(
              label: "Last Date of Visit",
              text: lastVisitDate,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LabeledTextRow(
              label: "Last Visit Available HC Stock",
              text: hcStock,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LabeledTextRow(
              label: "Last Date of Order",
              text: lastDateOfOrder,
            ),
          ),
          gap12,
        ],
      ),
    );
  }
}
