import 'package:egypt_news/componants.dart';
import 'package:egypt_news/cubit/cubit.dart';
import 'package:egypt_news/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget
{
   SearchScreen({Key? key}) : super(key: key);

var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body:Column(
            children:
            [
              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: defaultFromField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChanged: (value)=> NewsCubit.get(context).getSearch(value),
                  label: 'search',
                  prefix: Icons.search,
                  validate: 'search must not be empty',
                ),
              ),
              Expanded(
                  child: articleBuilder(
                      list, context)),
            ],
          ) ,
        );
      },
      );
  }
}
