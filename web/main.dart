import 'dart:html';


ButtonElement bouton = querySelector('#bouton');
InputElement input = querySelector('input[type=text]');
UListElement listHolder = querySelector("#output");
ElementList<CheckboxInputElement> check = querySelectorAll('input[type=checkbox]');

List<Map<String, dynamic>> todoList = [
  { "text": "Dart Basics and IDE", "done": true},
  { "text": "Important concepts", "done": false },
  { "text": "Keywords in Dart", "done": false },
  { "text": "Variables in Dart", "done": false },
  { "text": "Built-in types in Dart", "done": false }
];

List<String> todoList = ["Dart Basics and IDE", "Types in Dart", "Variables in Dart", "Built-in types in Dart"];

void main() {
  bouton.onClick.listen(addTodoItemToList);
  input.onKeyUp.listen(inputOnChange);
  updateUi(todoList);
  check.onChange.listen(onCheckToDo);
}

void addItemToList(Map<String, dynamic> todo){
  LIElement todoItem = new LIElement();
  CheckboxInputElement yesOrNo = new CheckboxInputElement();
  SpanElement span = new SpanElement();
  yesOrNo.onChange.listen(onCheckToDo);

  if(todo["done"]){
    yesOrNo.checked = true;
    span.style.textDecoration = 'line-through';
    span.style.color = 'crimson';
    todoItem.style.borderColor = 'crimson';
  }


  span.text = todo['text'];
  span.style.marginLeft = '20px';
  todoItem.append(yesOrNo);
  todoItem.append(span);
  listHolder.children.add(todoItem);
}

void updateUi(List<Map<String, dynamic>> array){
  num len = array.length;
  for(var i=0; i<len; i++){
    addItemToList(array[i]);
  }
}

void inputOnChange(Event e){
  if(input.value.isEmpty){
    print("TODO input is Empty");
    bouton.disabled = true;
    bouton.style.backgroundColor = "#7faf77";
    bouton.style.color = "gray";
  }else{
    print("TODO input is not empty");
    bouton.disabled = false;
    bouton.style.backgroundColor = "#4CAF50";
    bouton.style.color = "white";
  }
}

void addTodoItemToList(Event e){
  Map<String, dynamic> map = {
    "text": input.value,
    "done": false
  };
  todoList.add(map);
  addItemToList(map);
  input.value = '';
  bouton.disabled = true;
}

void onCheckToDo(Event e){
  if((e.target as CheckboxInputElement).checked){
    (e.target as CheckboxInputElement).nextElementSibling.style.textDecoration = 'line-through';
    (e.target as CheckboxInputElement).nextElementSibling.style.color = 'crimson';
    (e.target as CheckboxInputElement).parent.style.borderColor = 'crimson';
  }else{
    (e.target as CheckboxInputElement).nextElementSibling.style.textDecoration = 'none';
    (e.target as CheckboxInputElement).nextElementSibling.style.color = 'rgba(0, 0, 0, .7)';
    (e.target as CheckboxInputElement).parent.style.borderColor = 'rgba(0, 0, 0, .7)';
  }
}