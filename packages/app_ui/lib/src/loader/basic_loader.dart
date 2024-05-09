import 'package:app_ui/app_ui.dart';

class BasicLoader extends StatelessWidget {
  const BasicLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
