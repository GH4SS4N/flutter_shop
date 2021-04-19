import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

final roleSelectedProvider = StateProvider<String>((ref) => null);
final branchSelectedProvider = StateProvider<String>((ref) => null);

class CDropdown extends ConsumerWidget {
  final StateProvider selectedState;
  final List<String> options;

  CDropdown({@required this.selectedState, @required this.options});

  @override
  Widget build(BuildContext context, watch) {
    final selected = watch(selectedState).state;

    return Container(
      height: 68,
      padding: EdgeInsets.all(24),
      child: DropdownButton<String>(
        disabledHint: Text('جاري التحميل'),
        isExpanded: true,
        value: options == null ? null : selected ?? options[0],
        items: options == null
            ? null
            : options
                .map(
                  (String item) => DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  ),
                )
                .toList(),
        isDense: true,
        underline: Container(),
        onChanged: (String newValue) =>
            context.read(selectedState).state = newValue,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          border: Border.all(color: green)),
    );
  }
}
