import 'package:auto_route/auto_route.dart';
import 'package:flights/app/styling/const.dart';
import 'package:flights/features/flights/flights/controller/flight_list_cubit.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flights/features/flights/flights/model/plan/plan.dart';
import 'package:flights/shared/layout/section_with_title.dart';
import 'package:flights/shared/widget/custom_button.dart';
import 'package:flights/shared/widget/custom_text_button.dart';
import 'package:flights/shared/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddPlansScreen extends StatefulWidget {
  final Flight flight;
  final Plan? plan;

  const AddPlansScreen({super.key, required this.flight, this.plan});

  @override
  State<AddPlansScreen> createState() => _AddPlansScreenState();
}

class _AddPlansScreenState extends State<AddPlansScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    if (widget.plan != null) {
      titleController.text = widget.plan!.title;
      descriptionController.text = widget.plan!.description;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FlightListCubit>();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: null,
          backgroundColor: surfaceColor,
          previousPageTitle: 'Flight',
          middle: Column(
            children: [
              const Text('Flight'),
              if (widget.plan != null)
                const Text(
                  'Edit plan',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              else
                const Text(
                  'New plan',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SectionWithTitle(
                  title: 'Describle your plans',
                  child: Column(
                    children: [
                      CustomTextField(
                        placeholder: 'Title',
                        controller: titleController,
                        onChanged: () => setState(() {}),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        placeholder: 'Description...',
                        controller: descriptionController,
                        onChanged: () => setState(() {}),
                      ),
                      SizedBox(height: 8.h),
                      CustomButton(
                        title: 'Done',
                        onPressed: () {
                          if (widget.plan != null) {
                            updatePlan(cubit, context);
                          } else {
                            createPlan(cubit, context);
                          }
                        },
                        isActive: titleController.text != '' &&
                            descriptionController.text != '',
                      ),
                      if (widget.plan != null)
                        CustomTextButton(
                          title: 'Delete plan',
                          onPressed: () {
                            deletePlan(cubit, context);
                          },
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void deletePlan(FlightListCubit cubit, BuildContext context) {
    final newPlans = widget.flight.plans!;
    newPlans.remove(widget.plan);
    cubit.update(cubit.state.indexOf(widget.flight),
        widget.flight.copyWith(plans: newPlans));
    context.router.popForced();
  }

  void createPlan(FlightListCubit cubit, BuildContext context) {
    final newPlans = widget.flight.plans;
    newPlans!.add(
      Plan(
        title: titleController.text,
        description: descriptionController.text,
      ),
    );
    cubit.update(cubit.state.indexOf(widget.flight),
        widget.flight.copyWith(plans: newPlans));
    context.router.popForced();
  }

  void updatePlan(FlightListCubit cubit, BuildContext context) {
    final planIndex = widget.flight.plans!.indexOf(widget.plan!);
    final newPlans = widget.flight.plans!;
    newPlans[planIndex] = Plan(
      title: titleController.text,
      description: descriptionController.text,
    );
    cubit.update(context.read<FlightListCubit>().state.indexOf(widget.flight),
        widget.flight.copyWith(plans: newPlans));
    context.router.popForced();
  }
}
