import 'dart:html';


ButtonElement bouton = querySelector('#bouton');
InputElement input = querySelector('input[type=text]');
UListElement listHolder = querySelector("#output");
ElementList<CheckboxInputElement> check = querySelectorAll('input[type=checkbox]');

//List<Map<String, dynamic>> todoList = [
//  { "text": "Dart Basics and IDE", "no": 1},
//  { "text": "Types in Dart", "no": 2 },
//  { "text": "Variables in Dart", "no": 3 },
//  { "text": "Built-in types in Dart", "no": 4 }
//];

List<String> todoList = ["Dart Basics and IDE", "Types in Dart", "Variables in Dart", "Built-in types in Dart"];

void main() {
  bouton.onClick.listen(addTodoItemToList);
  input.onKeyUp.listen(inputOnChange);
  updateUi(todoList);
  check.onChange.listen(onCheckToDo);
}

void addItemToList(String text){
  LIElement todoItem = new LIElement();
  CheckboxInputElement yesOrNo = new CheckboxInputElement();
  SpanElement span = new SpanElement();
  yesOrNo.onChange.listen(onCheckToDo);
  span.text = text;
  span.style.marginLeft = '20px';
  todoItem.append(yesOrNo);
  todoItem.append(span);
  listHolder.children.add(todoItem);
}

void updateUi(List<String> array){
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
  addItemToList(input.value);
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