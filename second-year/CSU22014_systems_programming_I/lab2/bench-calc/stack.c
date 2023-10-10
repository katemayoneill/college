#include "stack.h"
// create a new empty stack 
struct double_stack * double_stack_new(int max_size) {
  struct double_stack * result;
  // allocate space for the stack header
  result=malloc(sizeof(struct double_stack));
  result->max_size=max_size;
  result->items=malloc(sizeof(double)*max_size);
  // return a pointer to the newly-allocated stack
  return result;
}
// end of code

// push a value onto the stack
void double_stack_push(struct double_stack * this, double value) {

  //get the top of the stack
  int temp_top = this->top;

  //get the pointer to the stack in the struct
  double * items = this->items;

  //set tghe value on the top of tjhestack to be value
  items[temp_top] = value;

  // increment the stack top index
  temp_top++;
  this->top = temp_top;
  
}

// pop a value from the stack
double double_stack_pop(struct double_stack * this) {
  int temp_top=this->top-1;
  double value=this->items[temp_top];
  this->top=temp_top;
  return value;
}
