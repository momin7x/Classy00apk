

import 'package:classy/const/all_colors.dart';
import 'package:flutter/material.dart';

Widget customTextfield(textController,validator,{readonly}){
  
  return TextFormField(
    controller: textController,
                  style:  TextStyle(color: AllColors.whiteColor),
                  readOnly: readonly??false,
                  validator: validator,
                  decoration:  InputDecoration(
                    filled: true,
                     fillColor: AllColors.filledColor,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AllColors.filledColor, width: 2)),
                  ),
                );
}