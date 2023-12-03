import 'package:flutter/material.dart';
import 'package:flutter_advisor_clean_architecture/application/presentation_services/theme_service.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/bloc/advice_bloc_bloc.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/widgets_advice/advice_field.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/widgets_advice/custom_button.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/widgets_advice/error_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

//this wrapper serves to provide any bloc, even for test.
class AdviceScreenWrapperProvider extends StatelessWidget {
  const AdviceScreenWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //this works exactly like provider
      create: (context) {
        return AdviceBloc();
      },
      child: const AdviceScreen(),
    );
  }
}

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            //_ is not using the parameter, just signaling it with _
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                //this is needed to react to states, we will build on reacting states of chosen block and state
                child: BlocBuilder<AdviceBloc, AdviceBlocState>(
                  builder: (context, state) {
                    if (state is AdviceBlocInitialState) {
                      return Text(
                        'Your Advice is wating for you!',
                        style: themeData.textTheme.bodyLarge,
                      );
                    } else if (state is AdviceBlocLoadingSate) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdviceBlocLoadedState) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    } else if (state is AdviceBlocErrorState) {
                      return ErrorMessage(message: state.message);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
