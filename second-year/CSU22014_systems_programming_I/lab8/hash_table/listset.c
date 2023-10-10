#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

// include the header files with the declarations of listset
#include "listset.h"

// create a new, empty linked list set
struct listset *listset_new() {
  struct listset *result = malloc(sizeof(struct listset));
  result->head = NULL;
}

int listset_lookup(struct listset *this, char *item) {
  struct listnode *node = this->head;
  while(node != NULL) {
    if(strcmp(node->str, item) == 0) {
      return 1;
    }
    node = node->next;
  }
  return 0;
}

// add an item, with number 'item' to the set
// has no effect if the item is already in the set.
// New items that are not already in the set should
// be added to the start of the list

void listset_add(struct listset *this, char *item) {
  if(listset_lookup(this, item) == 0) {
    struct listnode *node = malloc(sizeof(struct listnode));
    node->str = item;
    node->next = this->head;
    this->head = node;
    return;
  }
  return;
}

// remove an item with number 'item' from the set
void listset_remove(struct listset *this, char *item) {
    if(strcmp(item, this->head->str) == 0) {
        this->head = this->head->next;
        return;
      }
    else {
      struct listnode *node = this->head;
      while(node->next != NULL) {
        if(strcmp(item, node->next->str) == 0) {
          node->next = node->next->next;
          return;
        }
        node = node->next;
      }
    }
    return;
  }
  
// place the union of src1 and src2 into dest
void listset_union(struct listset *dest, struct listset *src1,
		   struct listset *src2) {
        struct listnode *node1 = src1->head;
        while(node1 != NULL) {
          listset_add(dest, node1->str);
          node1 = node1->next;
        }
        struct listnode *node2 = src2->head;
        while(node2 != NULL) {
          listset_add(dest, node2->str);
          node2 = node2->next;
        }
        return;
}

// place the intersection of src1 and src2 into dest
void listset_intersect(struct listset * dest, struct listset * src1,
		       struct listset * src2) {
            struct listnode *node = src1->head;
            while(node != NULL) {
              if(listset_lookup(src2, node->str) == 1) {
                listset_add(dest, node->str);
              }
              node = node->next;
            }
}

// return the number of items in the listset
int listset_cardinality(struct listset * this) {
  struct listnode *node = this->head;
  int result = 0;
  while(node != NULL) {
    result ++;
    node = node->next;
  }
  return result;
}

// print the elements of the list set
void listset_print(struct listset *this) {
  struct listnode *p;

  for ( p = this->head; p != NULL; p = p->next ) {
    printf("%s, ", p->str);
  }
  printf("\n");
}
