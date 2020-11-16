enum ToDoType{
  TODO, INPROGRESS, DONE
}
const Map<String, ToDoType> guestType = {
  'TODO': ToDoType.TODO,
  'INPROGRESS': ToDoType.INPROGRESS,
  'DONE': ToDoType.DONE,
};

getToDoType(String status){
  switch (status){
    case 'TODO':
      return ToDoType.TODO;
    case 'INPROGRESS':
      return ToDoType.INPROGRESS;
    case 'DONE':
      return ToDoType.DONE;
  }

}
