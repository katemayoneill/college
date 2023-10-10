#include "bitset.h"


// create a new, empty bit vector set with a universe of 'size' items

/* function that returns a pointer of type bitset called bitset_new that 
takes size of the universe as a parameter */

struct bitset* bitset_new(int universe_size) {
  /* initialize a struct of pointers of type bitset called bitset_new
     and allocate memory of size bitset  */
  struct bitset* result = malloc(sizeof(struct bitset));
  /* assign value to universe_size variable of result using arrow operator */
  result->universe_size = universe_size;
  /* assign value to result.size_in_words */
  result->size_in_words = universe_size/(sizeof(uint64_t)*8);
  /* if the result.universe_size is not divisible by 64, increase 
     result.size_in_words by one */
  if(universe_size%64!=0 ){
    result->size_in_words++;
  }
  /* allocate memory to result.bits */
  result->bits = malloc(sizeof(uint64_t)*result->size_in_words);
  /* set every result.bits to  0 */
  for(int i=0; i<result->size_in_words; i++) {
    result->bits[i] = 0;
  }
  /*returns a new bitset*/
  return result;
}

// get the size of the universe of items that could be stored in the set
int bitset_size(struct bitset * this) {
  return this->universe_size;
}

// get the number of items that are stored in the set
int bitset_cardinality(struct bitset * this){
  int count = 0;
  for(int i=0; i<this->size_in_words; i++) {
    uint64_t test = this->bits[i];
    /* loop through all of the bits and increment count for each 1 */
    while(test != 0) {
      if((test & 1)==1 ) {
	count++;
      }
      test=test >> 1;
    }
  }
  return count;
}

// check to see if an item is in the set
int bitset_lookup(struct bitset * this, int item){
  /* item is the nth bit in the whole bitset. if looking for 4th bit, 
shift first word 4 times (gotta check which word u need to check first) 
if its 1 return 1 if 0 return 0, or can use a mask floor(item/64); */
  uint64_t test = this->bits[(int)floor(item/64)];
  item = item%64;
  uint64_t mask = 1;
  mask=mask << (64-item);
  if((mask & test) == 0 ) {
    return 0;
  }
  else{
    return 1;
  }
}

// add an item, with number 'item' to the set
// has no effect if the item is already in the set
void bitset_add(struct bitset * this, int item) {
  /* find out what word its in, shift however many times and or it  */
  int index = item;
  uint64_t test = this->bits[(int)floor(index/64)];
  item = item%64;
  uint64_t mask = 1;
  mask=mask << (64-item);
  this->bits[(int)floor(index/64)] = (mask | test);  
  
}

// remove an item with number 'item' from the set
void bitset_remove(struct bitset * this, int item) {
  /* same but set to 0 if its set to 1 */
  int index = item;
  uint64_t test = this->bits[(int)floor(index/64)];
  item=item%64;
  uint64_t mask=1;
  mask=mask << (64-item);
  mask=~mask;
  this->bits[(int)floor(index/64)]=(mask&test);
  
}

// place the union of src1 and src2 into dest;
// all of src1, src2, and dest must have the same size universe
void bitset_union(struct bitset * dest, struct bitset * src1,
    struct bitset * src2) {
  /* loop through each word(uint64) of the destination and orr src1 and src2*/
  for(int i=0; i<src1->size_in_words;i++){
    dest->bits[i]=(src1->bits[i]|src2->bits[i]);
  }
  
}

// place the intersection of src1 and src2 into dest
// all of src1, src2, and dest must have the same size universe
void bitset_intersect(struct bitset * dest, struct bitset * src1,
    struct bitset * src2) {
  /* same shit but && instead  */
  for(int i=0; i<src1->size_in_words;i++){
    dest->bits[i]=(src1->bits[i]&src2->bits[i]);
  }
}
