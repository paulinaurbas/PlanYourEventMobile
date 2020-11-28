enum ToDoType{
  TODO, INPROGRESS, DONE
}
const Map<String, ToDoType> toDoType = {
  'ToDoType.TODO': ToDoType.TODO,
  'ToDoType.INPROGRESS': ToDoType.INPROGRESS,
  'ToDoType.DONE': ToDoType.DONE,
};

getToDoType(String status){
  switch (status){
    case 'ToDoType.TODO':
      return ToDoType.TODO;
    case 'ToDoType.INPROGRESS':
      return ToDoType.INPROGRESS;
    case 'ToDoType.DONE':
      return ToDoType.DONE;
  }

}
