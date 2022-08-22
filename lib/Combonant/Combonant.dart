import 'package:flutter/material.dart';


AppBar defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>?actions,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon:Icon(Icons.arrow_back_outlined),
  ),
  titleSpacing: 5,
  title: Text(title!),
  actions: actions,
);


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  bool isClickable = true,
   Function? onSubmit,
   //Function? onChange,
  Function? validate,
  bool obscureText=false,
  Function? SuffixPressed,
  required String lable,
   IconData? Prefix,
  IconData? Suffix,
}) =>
    TextFormField(

      controller: controller,
      keyboardType: type,
      obscureText:obscureText ,
      validator: (s){return validate!(s);},
     // onChanged: (s){ onChange!(s);},
      onFieldSubmitted: (s){ onSubmit!(s);},

      decoration: InputDecoration(
        labelText: '${lable}',
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon:Prefix!=null? Icon(Prefix):null,
        suffixIcon:Suffix!=null? IconButton(icon:Icon(Suffix),onPressed: (){SuffixPressed!();},):null,

        border: OutlineInputBorder(),
      ),
      // onFieldSubmitted: (s){onSubmit!(s);},
    );


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route)
  {
    return false;
  },
);


Widget DefultTextButton ({
  bool isUpperCase = true,
  TextStyle? style,
  required Function function,
  required String text ,
})=>TextButton(onPressed: (){function();}, child: Text('${text.toUpperCase()}',style: TextStyle(color: Colors.deepOrange,),),);
