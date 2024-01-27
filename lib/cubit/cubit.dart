import 'package:egypt_news/cubit/states.dart';
import 'package:egypt_news/moudules_screens/business/business.dart';
import 'package:egypt_news/moudules_screens/science/science.dart';
import 'package:egypt_news/moudules_screens/sports/sports.dart';
import 'package:egypt_news/remote/cashe_helper.dart';
import 'package:egypt_news/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(): super(NewInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems =
  [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business_outlined,
        ),
        label: 'Business',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science',
    ),
  ];
  List<Widget> screens =
  [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    if(index==1)
    {
      getSports();
    }

    if(index==2)
    {
      getScience();
    }
    emit(NewBottomNavState());
  }

  List< dynamic> business=[];
  void getBusiness()
  {
    emit(NewGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'business',
          'apiKey':'3efad376c31c4507acefce2de448d465',
        },
    ).then((value)
    {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBusinessSuccessState());

    }).catchError((error)
    {
      print(error.toString());
      emit(NewGetBusinessErrorState(error.toString()));
    });
  }

  List< dynamic> sports=[];
  void getSports()
  {
    emit(NewGetSportsLoadingState());
    if(sports.length==0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'sports',
          'apiKey':'3efad376c31c4507acefce2de448d465',
        },
      ).then((value)
      {
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewGetSportsSuccessState());

      }).catchError((error)
      {
        print(error.toString());
        emit(NewGetSportsErrorState(error.toString()));
      });
    }else
      {
        emit(NewGetSportsSuccessState());
      }

  }

  List< dynamic> science=[];
  void getScience()
  {
    emit(NewGetScienceLoadingState());
    if(science.length==0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'eg',
          'category':'science',
          'apiKey':'3efad376c31c4507acefce2de448d465',
        },
      ).then((value)
      {
        science=value.data['articles'];
        print(science[0]['title']);
        emit(NewGetScienceSuccessState());

      }).catchError((error)
      {
        print(error.toString());
        emit(NewGetScienceErrorState(error.toString()));
      });
    }else
      {
        emit(NewGetScienceSuccessState());
      }

  }
bool isDark=true;
  void changeAppMode({ bool? fromShared})
  {
    if(fromShared !=null)
    {
      isDark=fromShared;
      emit(AppChangeModeState());
    }else
      {
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeState());
      });
      }

  }

  List< Map> search=[];
  void getSearch(String value)
  {
    emit(NewGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'3efad376c31c4507acefce2de448d465',
      },
    ).then((value)
    {
      print(search[0]['title']);
      emit(NewGetSearchSuccessState());

    }).catchError((error)
    {
      print(error.toString());
      emit(NewGetSearchErrorState(error.toString()));
    });

  }
}