import 'package:flutter/material.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/bloc/advice_bloc_bloc.dart';
import 'package:flutter_advisor_clean_architecture/application/screens/advice/cubit/advicer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
        onTap: () {
          // now we gonna emit events for block, but we need to use provider
          // BlocProvider.of<AdviceBloc>(context).add(
          //   AdviceRequestedEvent(),
          // );
          BlocProvider.of<AdvicerCubit>(context).onAdviceRequested();
        },
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: themeData.colorScheme.secondary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Get Advice',
                style: themeData.textTheme.bodyMedium,
              ),
            ),
          ),
        ));
  }
}
