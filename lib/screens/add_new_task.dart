import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:task_manager_astad/providers/task_provider.dart';
import 'package:task_manager_astad/screens/main_nav_screen.dart';

import 'package:task_manager_astad/widgets/screen_background.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),

              Text('Add new Task',
              style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: titleController,
                cursorHeight: 20,
                cursorWidth: 3,
                decoration: InputDecoration(
                  hintText: 'Title'
                ),
                style: TextStyle(fontSize: 16),

                validator: (String ? value){
                  if(value == null || value.isEmpty){
                    return 'please enter title';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionController,
                cursorHeight: 20,
                cursorWidth: 3,
                style: TextStyle(fontSize: 16),
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Description'
                ),

                validator: (String ? value){
                  if(value == null || value.isEmpty){
                    return 'please enter Description';
                  }

                  return null;
                },
              ),

              Consumer<TaskProvider>(
                builder: (context,taskProvider,_) {


                  return taskProvider.isLoading ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(child: CircularProgressIndicator()),
                  ) : FilledButton(

                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          addNewTask();

                        }

                      },
                      child: Icon(Icons.arrow_circle_right_outlined));
                }
              ),

            ],
          ),
        ),
      )),
    );
  }

  Future <void> addNewTask() async {
    final taskProvider = context.read<TaskProvider>();
    final bool success =await taskProvider.addTask(titleController.text, descriptionController.text);

    if(success){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task added..!')));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainNavScreen()), (predicate)=>false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(taskProvider.errorMessage.toString())));

    }
  }

}