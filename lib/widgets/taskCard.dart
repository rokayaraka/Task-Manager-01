import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_astad/Data/Models/task_model.dart';
import 'package:task_manager_astad/providers/task_provider.dart';
import 'package:task_manager_astad/widgets/show_snackbar.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  Future<void>deleteTask() async {

    final taskProvider = context.read<TaskProvider>();

    bool success = await taskProvider.deleteTask(widget.taskModel.id);



    if(success){

      showSnackbar(context,'Task Deletd');

    }else{
      showSnackbar(context,taskProvider.errorMessage.toString());

    }




  }

  Future<void>changeStatus(String status) async {

   final taskProvider = context.read<TaskProvider>();

   bool success = await taskProvider.changeTaskStatus(widget.taskModel.id, status);

    if(success){

      Navigator.pop(context);
      showSnackbar(context,'Task Status updated');

    }else{
      showSnackbar(context,taskProvider.errorMessage.toString());

    }




  }

  void showChangeStatusDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Change Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            ListTile(
              onTap: (){
                changeStatus('New');
              },
              title: Text('New'),
              trailing: widget.taskModel.status == 'New' ? Icon(Icons.done) : null,
            ),
            ListTile(
              onTap: (){
                changeStatus('Progress');
              },
              title: Text('Progress'),
              trailing: widget.taskModel.status == 'Progress' ? Icon(Icons.done) : null,

            ),
            ListTile(
              onTap: (){
                changeStatus('Completed');
              },
              title: Text('Completed'),
              trailing: widget.taskModel.status == 'Completed' ? Icon(Icons.done) : null,

            ),
            ListTile(
              onTap: (){
                changeStatus('Cancelled');
              },
              title: Text('Cancelled'),
              trailing: widget.taskModel.status == 'Cancelled' ? Icon(Icons.done) : null,

            ),
          ],
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(widget.taskModel.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 18
          ),),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description),
              Text('Date: ${widget.taskModel.createdDate}'),
              Row(
                children: [
                  Chip(label: Text(widget.taskModel.status,
                  ),
                    backgroundColor: widget.cardColor,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),

                  Spacer(),

                  IconButton(onPressed: (){
                    showChangeStatusDialog();
                  }, icon: Icon(Icons.edit_note_rounded,color: Colors.orange,)),
                  IconButton(onPressed: (){
                    deleteTask();
                  }, icon: Icon(Icons.delete,color: Colors.red,)),

                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}