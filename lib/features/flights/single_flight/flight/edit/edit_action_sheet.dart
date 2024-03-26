import 'package:auto_route/auto_route.dart';
import 'package:flights/app/router/router.dart';
import 'package:flights/features/flights/flights/model/flight/flight.dart';
import 'package:flutter/cupertino.dart';

class EditActionSheet extends StatelessWidget {
  final Flight flight;
  const EditActionSheet({
    super.key,
    required this.flight,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => context.router
            ..popForced()
            ..push(EditDepartureRoute(flight: flight)),
          child: const Text('Departure'),
        ),
        CupertinoActionSheetAction(
          onPressed: () => context.router
            ..popForced()
            ..push(EditArrivalRoute(flight: flight)),
          child: const Text('Arrival'),
        ),
        CupertinoActionSheetAction(
          onPressed: () => context.router
            ..popForced()
            ..push(EditTransferRoute(flight: flight)),
          child: const Text('Transfers'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => context.router.popForced(),
        isDefaultAction: true,
        child: const Text('Cancel'),
      ),
    );
  }
}
