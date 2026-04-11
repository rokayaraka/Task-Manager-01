



import 'package:flutter/foundation.dart';
import 'package:task_manager_astad/Data/Models/api_response.dart';
import 'package:task_manager_astad/Data/Models/task_model.dart';
import 'package:task_manager_astad/Data/Models/task_status_count_model.dart';
import 'package:task_manager_astad/Data/services/api_caller.dart';

import '../utils/urls.dart';

class TaskProvider extends ChangeNotifier{

    List<TaskModel>newTask = [];
    List<TaskModel>progressTask = [];
    List<TaskModel>completeTask = [];
    List<TaskModel>cancelledTask = [];
    List<TaskStatusCountModel>taskStatusCounts = [];

    bool isLoading = false;
    String? errorMessage;


    _setLoading(bool value){
      isLoading = value;
      notifyListeners();
    }

    void setListByStatus(String status, List<TaskModel>tasks){
      switch(status){
        case 'New':
          newTask = tasks;
          break;

        case 'Progress':
          progressTask = tasks;
          break;

        case 'Completed':
          completeTask = tasks;
          break;

        case 'Cancelled':
          cancelledTask = tasks;
          break;

      }
    }


    Future fetchTaskByStatus(String status) async {
      _setLoading(true);

      final response = await ApiCaller.getRequest(URL: Urls.TaskByStatusURL(status));


      if(response.isSuccess){
        List<TaskModel> tasks  = [];
        for(Map<String,dynamic>jsonData in response.responseData['data']){
          tasks.add(TaskModel.fromJson(jsonData));
        }
        setListByStatus(status, tasks );
      }else{
        errorMessage = response.responseData['data'];
      }

      _setLoading(false);
    }


    Future fetchTaskCounts() async {

      final response = await ApiCaller.getRequest(URL: Urls.TaskCountURL);


      if(response.isSuccess){
        List<TaskStatusCountModel> count = [];
        for(Map<String,dynamic>jsonData in response.responseData['data']){
          count.add(TaskStatusCountModel.formJson(jsonData));
        }
        taskStatusCounts = count;
      }else{
        errorMessage = response.responseData['data'];
      }
      notifyListeners();
    }



    Future<bool>changeTaskStatus(String id, String newStatus) async {

      final response =await ApiCaller.getRequest(URL: Urls.ChangeStatusURL(id, newStatus));

      if(response.isSuccess){
        newTask.removeWhere((t)=>t.id == id);
        progressTask.removeWhere((t)=>t.id == id);
        completeTask.removeWhere((t)=>t.id == id);
        cancelledTask.removeWhere((t)=>t.id == id);

       await Future.wait([
        fetchTaskByStatus(newStatus),
        fetchTaskCounts(),
        ]);


        return true;
      }else{

        errorMessage = response.responseData['data'];
        notifyListeners();
        return false;
      }



    }



    Future<bool>deleteTask(String id) async {

      final response =await ApiCaller.getRequest(URL: Urls.DeleteTaskURL(id));

      if(response.isSuccess){
        newTask.removeWhere((t)=>t.id == id);
        progressTask.removeWhere((t)=>t.id == id);
        completeTask.removeWhere((t)=>t.id == id);
        cancelledTask.removeWhere((t)=>t.id == id);

        await Future.wait([
          fetchTaskCounts(),
        ]);


        return true;
      }else{

        errorMessage = response.responseData['data'];
        notifyListeners();
        return false;
      }



    }


    Future<bool>addTask(String title, String description) async {

      _setLoading(true);

      final ApiResponse response = await ApiCaller.PostRequest(URL: Urls.AddTaskURL,
      body: {
        'title': title,
        'description': description,
        'status': 'New',
      }
      );

      _setLoading(false);

      if(response.isSuccess){
        await Future.wait([
          fetchTaskByStatus('New'),
          fetchTaskCounts(),

        ]);
        return true;
      }else{
        errorMessage = response.responseData['data'];
        notifyListeners();
        return false;
      }
    }



}