import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'moudules_screens/web_view/web_view_screen.dart';

Widget defaultFromField({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
   onChanged,
   onTap,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  required String validate,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s)
      {
        onSubmit(s);
      },
      onChanged: (String value)=> onChanged(value),

        onTap: ()
      {
        onTap ();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

// // Widget buildTaskItem(Map model, context)=>Dismissible(
// //   key: Key(model['id'].toString()),
// //   child:Padding(
// //
// //     padding:  const EdgeInsets.all(20.0),
// //
// //     child: Row(
// //
// //       children:
// //
// //       [
// //
// //          CircleAvatar(
// //
// //           radius: 40,
// //
// //           child: Text
// //
// //             (
// //
// //             '${model['time']}',
// //
// //           ),
// //
// //         ),
// //
// //         const SizedBox(
// //
// //           width: 20,
// //
// //         ),
// //
// //         Expanded(
// //
// //           child: Column(
// //
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //
// //             mainAxisSize: MainAxisSize.min,
// //
// //             children:
// //
// //              [
// //
// //               Text(
// //
// //                 '${model['title']}',
// //
// //                 style: const TextStyle(
// //
// //                   fontSize: 18,
// //
// //                   fontWeight: FontWeight.bold,
// //
// //                 ),
// //
// //               ),
// //
// //               Text(
// //
// //                 '${model['date']}',
// //
// //                 style: const TextStyle(
// //
// //                   color: Colors.grey,
// //
// //                 ),
// //
// //               ),
// //
// //             ],
// //
// //           ),
// //
// //         ),
// //
// //         const SizedBox(
// //
// //           width: 20,
// //
// //         ),
// //
// //         // IconButton(
// //         //
// //         //     onPressed: ()
// //         //
// //         //     {
// //         //
// //         //       AppCubit.get(context).updateData
// //         //
// //         //         (
// //         //
// //         //         status: 'done',
// //         //
// //         //         id: model['id'],
// //         //
// //         //       );
// //         //
// //         //     },
// //         //
// //         //     icon: const Icon(
// //         //
// //         //       Icons.check_circle,
// //         //
// //         //       color: Colors.green,
// //         //
// //         //     )
// //         //
// //         // ),
// //
// //         IconButton(
// //
// //             onPressed: ()
// //
// //             {
// //
// //               AppCubit.get(context).updateData
// //
// //                 (
// //
// //                 status: 'archived',
// //
// //                 id: model['id'],
// //
// //               );
// //
// //             },
// //
// //             icon: const Icon(
// //
// //               Icons.archive,
// //
// //               color: Colors.red,
// //
// //             )
// //
// //         ),
// //
// //
// //
// //       ],
// //
// //     ),
// //
// //   ),
// //   onDismissed:(direction)
// //   {
// //     AppCubit.get(context).deleteData(id:model['id']);
// //   },
// // );
//
// Widget taskBuilder({
//   required List<Map>tasks,
// // })=>ConditionalBuilder(
// //   condition: tasks.isNotEmpty,
// //   builder: (context)=>ListView.separated(
// //     itemBuilder: (context, index) =>buildTaskItem(tasks[index], context),
// //     separatorBuilder: (context,index)=>Padding(
// //       padding: const EdgeInsetsDirectional.only(
// //         start: 20,
// //       ),
// //       child: Container
// //         (
// //         width: double.infinity,
// //         height: 1,
// //         color: Colors.grey,
// //       ),
// //     ),
// //     itemCount: tasks.length,),
// //   fallback:(context)=>Center(
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children:
// //       const [
// //         Icon(
// //           Icons.menu,
// //           size:100 ,
// //           color: Colors.grey,
// //         ),
// //         Text(
// //           'No Tasks Yet, Pease Add Some Tasks',
// //           style: TextStyle(
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.grey,
// //           ),
// //         ),
// //       ],
// //     ),
// //   ) ,
// // );
//
//
//
//
//
//
//
//
//
// // Widget buildTaskItem(Map model,context) => Dismissible(
// //   key: Key(model['id'].toString()),
// //   child:   Padding(
// //     padding: const EdgeInsets.all(20.0),
// //     child: Row(
// //       children: [
// //         CircleAvatar(
// //           backgroundColor: Colors.deepOrange,
// //           radius: 40,
// //           child: Text(
// //             '${model['time']}',
// //           ),
// //         ),
// //         const SizedBox(
// //           width: 20,
// //         ),
// //         Expanded(
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children:  [
// //               Text(
// //                 '${model['title']}',
// //                 style: const TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               Text(
// //                 '${model['date']}',
// //                 style: const TextStyle(
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         const SizedBox(
// //           width: 20,
// //         ),
// //         IconButton(
// //             onPressed: ()
// //             {
// //               AppCubit.get(context).updateData
// //                 (
// //                 status: 'done',
// //                 id: model['id'],
// //               );
// //             },
// //             icon: const Icon(
// //               Icons.check_box_sharp,
// //               color: Colors.green,
// //             )
// //         ),
// //         IconButton(
// //             onPressed: ()
// //             {
// //               AppCubit.get(context).updateData
// //                 (
// //                 status: 'archived',
// //                 id: model['id'],
// //               );
// //             },
// //             icon: const Icon(
// //               Icons.archive,
// //               color: Colors.black45,
// //             )
// //         ),
// //       ],
// //     ),
// //   ),
// //   // onDismissed: (direction)
// //   // {
// //   //   AppCubit.get(context).deleteData(id: model['id'],);
// //   // },
// // );
//
// // Widget taskBuilder ({
// //   required tasks,
// // })=>ConditionalBuilder(
// //   condition:tasks.isNotEmpty,
// //   builder: (context)=>ListView.separated(
// //     itemBuilder: (context, index)=>buildTaskItem(tasks[index],context),
// //     separatorBuilder: (context,index)=>Container(
// //       width: double.infinity,
// //       height: 1,
// //       color: Colors.grey[300],
// //     ),
// //     itemCount: tasks.length,
// //   ),
// //   fallback: (context)=>Center(
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children:
// //       const [
// //         Icon(
// //           Icons.menu_outlined,
// //           size: 100,
// //           color: Colors.grey,
// //         ),
// //         Text(
// //           'No tasks yet ! Please enter some Tasks',
// //           style: TextStyle(
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.deepOrange,
// //           ),
// //         ),
// //       ],
// //     ),
// //   ),
// // );
Widget buildArticleItem(article, context) =>InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

  padding: const EdgeInsets.all(10.0),

  child: Row(

  children:

  [

  Container(

  width: 120,

  height: 120,

  decoration: BoxDecoration(

  borderRadius: BorderRadius.circular(10),

  image:  DecorationImage(

    image: NetworkImage('${article['urlToImage']}'),

  fit: BoxFit.cover,

  ),

  ),

  ),

  const SizedBox(

  width: 20,

  ),

  Expanded(

  child: Container(

  height: 120,

  child: Column(

  crossAxisAlignment: CrossAxisAlignment.start,

  mainAxisAlignment: MainAxisAlignment.start,

  children:

   [

  Expanded(

  child: Text(

    '${article['title']}',

  style: Theme.of(context).textTheme.bodyText1,

  maxLines: 3,

  overflow: TextOverflow.ellipsis,

  ),

  ),

  Text(

    '${article['publishedAt']}',

  style: const TextStyle(

  color: Colors.grey,

  ),

  ),

  ],

  ),

  ),

  ),

  ],

  ),

  ),
);
Widget myDivider()=>Padding(
padding: const EdgeInsetsDirectional.only(
start: 20,
),
child: Container
(
width: double.infinity,
height: 1,
color: Colors.grey,
),
);
Widget articleBuilder(list,context)=>ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context)=>ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index)=>buildArticleItem(list[index],context),
    separatorBuilder: (context, index)=>myDivider(),
    itemCount: 10,
  ),
  fallback:(context)=>const Center(child: CircularProgressIndicator()) ,
);
void navigateTo(context, widget)=> Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>widget,
    ),
);





// Widget taskBuilder({
//   required List<Map>tasks,
// })=>ConditionalBuilder(
//   condition: tasks.isNotEmpty,
//   builder: (context)=>ListView.separated(
//     itemBuilder: (context, index) =>buildTaskItem(tasks[index], context),
//     separatorBuilder: (context,index)=>Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 20,
//       ),
//       child: Container
//         (
//         width: double.infinity,
//         height: 1,
//         color: Colors.grey,
//       ),
//     ),
//     itemCount: tasks.length,),
//   fallback:(context)=>Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children:
//       const [
//         Icon(
//           Icons.menu,
//           size:100 ,
//           color: Colors.grey,
//         ),
//         Text(
//           'No Tasks Yet, Pease Add Some Tasks',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     ),
//   ) ,
// );
