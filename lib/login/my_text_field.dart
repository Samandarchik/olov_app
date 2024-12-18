import 'package:flutter/material.dart';
import 'package:olov_app/style/color.dart';
import 'package:olov_app/style/text_style.dart';

class MyTextField extends StatefulWidget {
  final String text;
  final bool isNumber;
  final String textP;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLens;
  const MyTextField(
      {super.key,
      required this.text,
      this.isNumber = false,
      required this.controller,
      required this.textP,
      this.textInputType = TextInputType.text,
      this.maxLens = 100});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextClass textClass = TextClass();

  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: kBlack26),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.isNumber ? Text("+998  ", style: kTextPhone) : SizedBox(),
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.next,
                  style: kTextPhone,
                  maxLength: widget.maxLens,
                  controller: numberController,
                  keyboardType: widget.textInputType,
                  onChanged: (value) {
                    widget.isNumber
                        ? setState(() {
                            // Formatlash va TextController ga qaytarish
                            numberController.text =
                                textClass.formatPhoneNumber(value);
                            // Kursorni oxiriga qo'yish
                            numberController.selection =
                                TextSelection.collapsed(
                                    offset: numberController.text.length);
                          })
                        : setState(() {});
                    ;
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    hintStyle: kTextPhone.copyWith(color: kBlack26),
                    hintText: widget.textP,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextClass {
  String formatNumberWithSpaces(int number) {
    // Raqamni satrga aylantiramiz
    String numStr = number.toString();

    // Raqamni uch xonali guruhlarga ajratamiz
    List<String> chunks = [];
    int length = numStr.length;

    // Har uch xonali guruhni bo'laklarga ajratamiz
    while (length > 3) {
      chunks.insert(0, numStr.substring(length - 3, length));
      numStr = numStr.substring(0, length - 3);
      length = numStr.length;
    }

    // Oxirgi qismni qo'shamiz
    if (numStr.isNotEmpty) {
      chunks.insert(0, numStr);
    }

    // Har bir guruh orasiga bo'sh joy qo'yamiz
    return chunks.join(',');
  }

  String formatPhoneNumber(String input) {
    // Faqat raqamlarni olish
    input = input.replaceAll(RegExp(r'[^0-9]'), '');

    // Telefon raqamini formatlash
    if (input.length <= 2) {
      return input;
    } else if (input.length <= 5) {
      return '${input.substring(0, 2)} ${input.substring(2)}';
    } else if (input.length <= 7) {
      return '${input.substring(0, 2)} ${input.substring(2, 5)} ${input.substring(5)}';
    } else if (input.length <= 10) {
      return '${input.substring(0, 2)} ${input.substring(2, 5)} ${input.substring(5, 7)} ${input.substring(7)}';
    }
    return input.substring(0, 13); // Maksimal 13 belgidan oshmasligi kerak
  }
}
