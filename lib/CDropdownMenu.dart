import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

final roleSelectedProvider = StateProvider<String>((ref) => null);
final branchSelectedProvider = StateProvider<String>((ref) => null);

class CDropdown extends ConsumerWidget {
  final StateProvider selectedState;
  final List<String> options;
  int type;

  CDropdown(
      {@required this.selectedState,
      @required this.options,
      @required this.type});

  @override
  Widget build(BuildContext context, watch) {
    final selected = watch(selectedState).state;

    // if (type == 1) {
    //   context.read(roleSelectedProvider).state = options[0];
    // } else {
    //   context.read(branchSelectedProvider).state = options[0];
    // }

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
          onChanged: (String newValue) {
            context.read(selectedState).state = newValue;
            // if (type == 1) {
            //   context.read(roleSelectedProvider).state = newValue;
            // } else {
            //   context.read(branchSelectedProvider).state = newValue;
            // }
          }),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          border: Border.all(color: green)),
    );
  }
}
