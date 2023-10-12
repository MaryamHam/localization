import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/cubits/cubit/main_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 210, 207, 197),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 43, 99),
          title: Text("${AppLocalizations.of(context)!.welcome} ",style: TextStyle(color: Color.fromARGB(255, 233, 93, 17)),),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
            
              return Column(
                children: [
                   SizedBox(height: 25,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/log.jpg"),
                    radius: 80,
                  ),
                  SizedBox(height: 25,),
                Text(AppLocalizations.of(context)!.screen,style: TextStyle(color:Color.fromARGB(255, 233, 93, 17), 
                    fontSize: 25,fontWeight: FontWeight.bold, ),),
             SizedBox(height: 25,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:30,vertical: 3),
                      child: TextField(
                        decoration: InputDecoration(
                           filled: true,
                          fillColor: Color.fromARGB(255, 209, 230, 245),
                          hintText: AppLocalizations.of(context)!.hint,
                          hintStyle: TextStyle(
                            color:Color.fromARGB(255, 233, 93, 17)),
                               focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 43, 99),
                              ),
                             ),
                        enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 43, 99),
                              ),
                             ),
                        ),
                      ),
            
                    ),
            
                    Container(
                      padding: EdgeInsets.all(30),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 209, 230, 245),
                          hintText: AppLocalizations.of(context)!.pass,
                          hintStyle: TextStyle(
                            color:Color.fromARGB(255, 233, 93, 17)),
                               focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 19, 43, 99),
                      ),
                    ),
                     enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 19, 43, 99),
                              ),
                             ),
                        ),
                      ),
                      
                    ),
            
                    Container(
                       width: MediaQuery.sizeOf(context).width *.65 ,
                      height: MediaQuery.sizeOf(context).height *.05,
                      child: MaterialButton(
                        color:  Color.fromARGB(255, 33, 64, 134),
                        
                              onPressed: (){},
                              child: Text(AppLocalizations.of(context)!.button,
                             style: TextStyle(color: Color.fromARGB(255, 233, 93, 17)),
                             ),
                        
                             ),
                    ),
             SizedBox(height: 50,),
                  SwitchListTile(
                    value: MainCubit.get(context).currentLang == ("en", " "),
                    onChanged: (value) {
                      if (AppLocalizations.of(context)!.localeName == "ar") {
                        MainCubit.get(context).changeToEn();
                      } else {
                        MainCubit.get(context).changeToAr();
                      }
                    },
                    title: Text(AppLocalizations.of(context)!.changelanguage,style: TextStyle(color:Color.fromARGB(255, 33, 64, 134), 
                    fontSize: 16,fontWeight: FontWeight.bold ),),
                  ),


                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
