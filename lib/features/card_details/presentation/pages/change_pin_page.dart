// ignore_for_file: use_build_context_synchronously
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_cubit.dart';
import 'package:fintechapp/features/card_details/presentation/cubit/changepin_cubit/change_pin_state.dart';
import 'package:fintechapp/features/card_details/presentation/widgets/change_pin.dart';
import 'package:fintechapp/features/card_details/presentation/widgets/change_pin_new_pin_sheet.dart';
import 'package:fintechapp/features/card_details/presentation/widgets/change_pin_view2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// REMOVED THE BLOCPROVIDER FROM THIS WIDGET
class ChangePinPage extends StatelessWidget {
  const ChangePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorScheme.onSurface,
            size: 24.sp,
          ),
          onPressed: () {
            final cubit = context.read<ChangePinCubit>();
            if (cubit.state is ChangePinStep2Loaded ||
                cubit.state is ChangePinShowNewPinSheet) {
              cubit.goBack();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        centerTitle: true,
      ),
      body: BlocListener<ChangePinCubit, ChangePinState>(
        listenWhen: (previous, current) =>
            current is ChangePinShowNewPinSheet || current is ChangePinSuccess,
        listener: (context, state) {
          if (state is ChangePinShowNewPinSheet) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              builder: (sheetContext) => BlocProvider.value(
                value: context.read<ChangePinCubit>(),
                child: const ChangePinNewPinSheet(),
              ),
            ).then((_) {
              final currentState = context.read<ChangePinCubit>().state;
              if (currentState is! ChangePinSuccess) {
                context.read<ChangePinCubit>().goBack();
              }
            });
          }
          if (state is ChangePinSuccess) {
            // This is the correct navigation logic.
            // It pops the current page, which automatically dismisses the
            // bottom sheet and cleans up the state.
                 Navigator.of(context).popUntil((route) => route.isFirst);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('PIN changed successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        child: BlocBuilder<ChangePinCubit, ChangePinState>(
          builder: (context, state) {
            if (state is ChangePinInitial || state is ChangePinLoading) {
              return Center(
                  child: CircularProgressIndicator(color: colorScheme.primary));
            }

            if (state is ChangePinStep1Loaded) {
              return const ChangePinStep1();
            }

            if (state is ChangePinStep2Loaded ||
                state is ChangePinShowNewPinSheet) {
              return ChangePinStep2(
                  mobileNumber: (state as dynamic).data.mobileNumber);
            }
            
            // Fallback to prevent blank screen during state transitions
            return const ChangePinStep1();
          },
        ),
      ),
    );
  }
}