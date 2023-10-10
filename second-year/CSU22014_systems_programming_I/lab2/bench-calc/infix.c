#include "infix.h"

// evaluate expression stored as an array of string tokens
double evaluate_infix_expression(char ** args, int nargs) {
  
  struct double_stack *stack = double_stack_new(nargs);
  char **postfix_final = malloc(sizeof(char*) * nargs); //allocate memory to string of size nargs
  
  int string_index = 0;
  
  // *args[i] = next expression (can be number or operator or brackets)

  for(int i = 0; i < nargs; i++) {
    int nb = atof(args[i]); // ascii to float
    if(isdigit(*args[i]) || nb < 0) {
      postfix_final[string_index++] = args[i];
    } 
    else if (*args[i] == '(') {
      double_stack_push(stack, *args[i]);
    } 
    else if (*args[i] == ')') {
      while (stack->items[stack->top - 1] != '(') {
          char pooped_char = (char)double_stack_pop(stack);
          postfix_final[string_index] = malloc(sizeof(pooped_char));
          *postfix_final[string_index++] = pooped_char;
        }
      double_stack_pop(stack);
    } 
    else if (*args[i] == '+' || 
               *args[i] == '-' || 
               *args[i] == '^' || 
               *args[i] == 'X' || 
               *args[i] == '/' ) {
      while(check_precedence(stack, *args[i]) == 1) {
          char next_char = (char)double_stack_pop(stack);
          postfix_final[string_index] = malloc(sizeof(next_char));
          *postfix_final[string_index++] = next_char;
        }
      double_stack_push(stack, *args[i]);
    }

  }  
  while(stack->top != 0) {
      char remaining = (char)double_stack_pop(stack);
      postfix_final[string_index] = malloc(sizeof(remaining));
      *postfix_final[string_index++] = remaining;
    }
    return evaluate_postfix_expression(postfix_final, string_index);

}

int check_precedence(struct double_stack * s, char c) {
  if ((c == '^') && s->items[s->top - 1] == '^') {
    return 1;
  }
  else if( (c == 'X' || c == '/' ) && 
            (s->items[s->top - 1] == '^' ||
            s->items[s->top - 1] == 'X' ||
            s->items[s->top - 1] == '/')) {
            return 1;
  } 
  else if( (c == '+' || c == '-' ) && 
            (s->items[s->top - 1] == '^' ||
            s->items[s->top - 1] == 'X' ||
            s->items[s->top - 1] == '/' || 
            s->items[s->top - 1] == '+' ||
            s->items[s->top - 1] == '-')) {
              return 1;
  } else return 0;
}