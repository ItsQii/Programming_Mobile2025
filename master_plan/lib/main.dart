import 'package:flutter/material.dart';
import 'package:master_plan/models/data_export.dart';
import 'package:master_plan/provider/plan_provider.dart';
import 'package:master_plan/views/plan_creator_screen.dart';

void main() {
  runApp(const MasterPlanApp());
}

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      // Inisialisasi notifier dengan list kosong
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: "Master Plan App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        // Memanggil class PlanCreatorScreen yang sudah Anda buat
        home: const PlanCreatorScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}