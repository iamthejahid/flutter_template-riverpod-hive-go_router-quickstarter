import 'package:app_ui/app_ui.dart';

class CustomerCardBasic extends StatelessWidget {
  final Widget? extraChild;
  final String name;
  final String customeId;
  final String address;
  final String visitDate;

  const CustomerCardBasic({
    super.key,
    this.extraChild,
    required this.name,
    required this.customeId,
    required this.address,
    required this.visitDate,
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
          gap12,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LabeledTextRow(
              label: "Customer Name",
              text: name,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LabeledTextRow(
              label: "Customer ID",
              text: customeId,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: LabeledTextRowFlexible(
              label: "Address",
              text: address,
            ),
          ),
          gap12,
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF8EF9A0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
              child: LabeledTextRow(
                label: "Visit Date",
                text: visitDate,
              ),
            ),
          )
        ],
      ),
    );
  }
}
