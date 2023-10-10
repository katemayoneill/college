#include "postfix.h"

// evaluate expression stored as an array of string tokens
double evaluate_postfix_expression(char ** args, int nargs) {
  struct double_stack *stack=double_stack_new(nargs);
  double one=0;
  double two=0;
  double result;
  for(int i=0; i<nargs; i++) {
    int nb = atof(args[i]); // ascii to float
    if(isdigit(*args[i]) || nb < 0)
      double_stack_push(stack, atof(args[i]));
    else {
      one=double_stack_pop(stack);
      two=double_stack_pop(stack);
      switch(*args[i]) {
	    case '+':
			result=one+two;
			break;
	    case '-':
			result=two-one;
			break;
	    case 'X':
			result=one*two;
			break;
	    case '/':
			result=two/one;
			break;
	    case '^':
			result = pow(two, one);
			break;
	    default: printf("AHHH NOT GOOD!! %c\n", *args[i]);
      }
      double_stack_push(stack, result);
      
    }
  }
	return result;
}
