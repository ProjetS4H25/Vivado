#ifndef API_C
#define API_C

#include "api.h"

void apiMoveViewPort() {
    
}

void apiMoveActor() {

}

void apiSetBackgroundBuffer() {

}

//Reintialise le jeu dans son etat de depart connu
void apiReset() { //1111 1100 0000 0000 0000 0000 0000 0000 FC00 0000
    Xil_Out32(0x00, 0xFC000000);
}

void apiSetActorPosition() {

}

#endif
