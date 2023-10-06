import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/cubits/cubit/main_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 207, 197),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 102, 13),
        title: Text("${AppLocalizations.of(context)!.welcome} ${AppLocalizations.of(context)!.name} "),
      ),
      body: Center(
        child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {

          return Column(
            children: [
              SizedBox(height: 25,),
            Text(AppLocalizations.of(context)!.screen,style: TextStyle(color:Color.fromARGB(255, 130, 102, 13), 
                fontSize: 25,fontWeight: FontWeight.bold, ),),

                Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.hint,
                      hintStyle: TextStyle(
                        color:Color.fromARGB(255, 130, 102, 13), 
                      
                      )
                    ),
                  ),
                ),

              SwitchListTile(
                value: MainCubit.get(context).currentLang == ("en", " "),
                onChanged: (value) {
                  if (AppLocalizations.of(context)!.localeName == "ar") {
                    MainCubit.get(context).changeToEn();
                  } else {
                    MainCubit.get(context).changeToAr();
                  }
                },
                title: Text(AppLocalizations.of(context)!.changelanguage,style: TextStyle(color:Color.fromARGB(255, 130, 102, 13), 
                fontSize: 16,fontWeight: FontWeight.bold ),),
              ),
            ],
          );
        },
      )),
    );
  }
}
