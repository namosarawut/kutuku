import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kutuku/constants/base_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final formKey = GlobalKey<FormState>();
  FocusNode i = FocusNode();
  FocusNode ii = FocusNode();
  FocusNode iii = FocusNode();
  FocusNode iv = FocusNode();
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget buildTextFormField(
        TextEditingController textEditingController,
        FocusNode focusNode,
        String label,
       ) {
      return  Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: TextFormField(
          focusNode: focusNode,
          textAlign: TextAlign.center,
          showCursor: false,
          enableInteractiveSelection: false,
          style: const TextStyle(
              color: kuTuKuTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 18
          ),

          autofocus: false,
          keyboardType: TextInputType.number,
          // maxLength: 1,
          // onEditingComplete: ,
          onFieldSubmitted: (t) {
          },
          onTap: () {
          },
          onChanged: (text){
            log("text ${text}");
            if(focusNode.hasFocus && label == "1" && text.length == 1){
              FocusScope.of(context).requestFocus(ii);
            }else if(focusNode.hasFocus && label == "2" && text.length == 1){
              FocusScope.of(context).requestFocus(iii);
            }else if(focusNode.hasFocus && label == "3" && text.length == 1){
              FocusScope.of(context).requestFocus(iv);
            }


            if(one.text.length == 2){
             setState(() {
               one.clear();
               one = TextEditingController(text:text.substring(1) );
             });
             FocusScope.of(context).requestFocus(ii);
            }
            else if(two.text.length == 2){
              setState(() {
                two.clear();
                two = TextEditingController(text:text.substring(1) );
              });
              FocusScope.of(context).requestFocus(iii);
            }else if(three.text.length == 2){
              setState(() {
                three.clear();
                three = TextEditingController(text:text.substring(1));
              });
              FocusScope.of(context).requestFocus(iv);
            }
            else if(four.text.length == 2){
              setState(() {
                four.clear();
                four = TextEditingController(text:text.substring(1));
              });
            }

            // if(four.text.isEmpty){
            //   FocusScope.of(context).requestFocus(iii);
            // }else if(three.text.isEmpty){
            //   FocusScope.of(context).requestFocus(ii);
            // }else if(two.text.isEmpty){
            //   FocusScope.of(context).requestFocus(i);
            // }
          },
          controller: textEditingController,
          decoration: InputDecoration(
            counterText: '',
            labelStyle: const TextStyle(
                color: Color(0xffA7AEC1),
                fontWeight: FontWeight.w400,
                fontSize: 24),
            filled: true,
            fillColor: focusNode.hasFocus ? Colors.white : const Color(0xffFBFBFD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide:
              const BorderSide(color: kuTuKuPrimaryColor, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
              const BorderSide(color: Colors.black26, width: 2.0),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
                width: 130,
                height: 130,
                child: CircleAvatar(
                  // backgroundColor: Colors.deepOrange,
                  child: SizedBox(
                    width: 93,
                      height: 93,
                      child: CircleAvatar(
                        backgroundColor: kuTuKuPrimaryColor,
                        child: Icon(Icons.mail_lock_rounded,color: Colors.white,size: 35,)
                      )),
                )),
            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verification Code",style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("We have to sent the code verification to ",style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("example@gmail.con",style: TextStyle(fontSize: 18)),
              ],
            ),
SizedBox(height: 32,),
            Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        width:60,
                          height: 70,
                          child: buildTextFormField(one,i,"1")),
                        SizedBox(width: 10,),
                        Container(
                            width:60,
                            height: 70,
                            child: buildTextFormField(two,ii,"2")),
                        SizedBox(width: 10,),
                        Container(
                            width:60,
                            height: 70,
                            child: buildTextFormField(three,iii,"3")),
                        SizedBox(width: 10,),
                        Container(
                            width:60,
                            height: 70,
                            child: buildTextFormField(four,iv,"4"))
                    ],),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
