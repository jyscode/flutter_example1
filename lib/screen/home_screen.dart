import 'package:example_1/riverpod/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = ref.watch(dateProvider);
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  onPressed: onPressed,
                ),
                _BottomPart(),
              ],
            ),
          )),
    );
  }

  void onPressed() async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      // setState(() {
      //   selectedDate = selected!;
      // });
      ref.read(dateProvider.notifier).update((state) => selected!);
    }
  }
}

class _TopPart extends StatelessWidget {
  DateTime selectedDate;
  VoidCallback? onPressed;

  _TopPart({
    required this.selectedDate,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'U&I',
            style: theme.textTheme.displayLarge,
          ),
          Text(
            '우리 처음 만난 날',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
            style: theme.textTheme.bodySmall,
          ),
          IconButton(
            iconSize: 80.0,
            color: Colors.red,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
            ),
          ),
          Text(
            'D+${DateTime.now().difference(selectedDate).inDays + 1}',
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset('asset/img/middle_image.png'),
    );
  }
}

// Dialog(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             const Text('This is a typical dialog.',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),),
//                             const SizedBox(height: 15),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text('Close'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
