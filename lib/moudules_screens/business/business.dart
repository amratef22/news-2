import 'package:egypt_news/componants.dart';
import 'package:egypt_news/cubit/cubit.dart';
import 'package:egypt_news/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).business;

        return articleBuilder(list,context);
      },
    );
  }
}
