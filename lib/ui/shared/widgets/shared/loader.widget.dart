import 'progress_indicator.widget.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  final List<Object>? object;
  final Function? callback;
  const Loader({Key? key, required this.object, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return const Center(
        child: GenericProgressIndicator(),
      );
    }
    if (object!.isEmpty) {
      return const Center(
        child: Text('Nenhum item encontrado.'),
      );
    }

    return callback!();
  }
}
