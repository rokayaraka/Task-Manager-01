import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_astad/providers/task_provider.dart';
import 'package:task_manager_astad/screens/add_new_task.dart';
import 'package:task_manager_astad/widgets/taskCard.dart';
import 'package:task_manager_astad/widgets/taskCount_by_status.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {


  @override
  void initState() {
  
    super.initState();
    Future.microtask((){
      
      final provider = Provider.of<TaskProvider>(context,listen: false);
    provider.fetchTaskCounts();
    provider.fetchTaskByStatus('New');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: Consumer<TaskProvider>(
          builder: (context, taskProvider, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskProvider.taskStatusCounts.length,
                  itemBuilder: (context, index) {
                    print(taskProvider.taskStatusCounts[index]);
                    return TaskCountByStatus(
                      title: taskProvider.taskStatusCounts[index].status,
                      count: taskProvider.taskStatusCounts[index].count,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: taskProvider.newTask.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskModel: taskProvider.newTask[index],
                    cardColor: Colors.blue,
                    refreshParent: () {

                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNewTask()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}