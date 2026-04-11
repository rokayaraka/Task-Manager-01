import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_astad/providers/task_provider.dart';
import 'package:task_manager_astad/widgets/taskCard.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


      final provider = Provider.of<TaskProvider>(context,listen: false);
      provider.fetchTaskByStatus('Cancelled');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body:  Consumer<TaskProvider>(
          builder: (context, taskProvider, _){
            return ListView.separated(
              itemCount: taskProvider.cancelledTask.length,
              itemBuilder: (context,index){
                return TaskCard(
                  taskModel: taskProvider.cancelledTask[index],
                  cardColor: Colors.red,
                  refreshParent: () {  },


                );
              },
              separatorBuilder: (context,index){
                return SizedBox(
                  height: 4,
                );
              },
            );
          }
      ),
    );
  }
}