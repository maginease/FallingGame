//
//  toUpper.c
//  movingTest
//
//  Created by Minseo Kim on 1/29/21.
//

#include "toUpper.h"


char * toUpper(char * name) {
    
    //    char * dest = malloc(strlen(name)*sizeof(char));
    //    strcpy(dest, name);

    
    // name[i] == *(name+i)
    
    
    
    for(int i = 0; *(name+i) == '\0'; i++) {
        
        if ( name[i] <= 'z' && name[i] >= 'a' ) {
            
            name[i] = name[i]  -('a' - 'A');
        }
        
    }
    
    return name;
}
