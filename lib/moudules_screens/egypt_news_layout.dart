import 'package:egypt_news/componants.dart';
import 'package:egypt_news/cubit/cubit.dart';
import 'package:egypt_news/cubit/states.dart';
import 'package:egypt_news/moudules_screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EgyptNews extends StatelessWidget {
  const EgyptNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit= NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'NewsApp',
              ),
              actions:
              [
                IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen());
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                ),
                IconButton(
                    onPressed: ()
                    {
                      NewsCubit.get(context).changeAppMode();
                    },
                    icon: const Icon(
                      Icons.brightness_4_outlined,
                    ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items:cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
