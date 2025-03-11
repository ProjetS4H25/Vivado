#ifndef API_C
#define API_C

#include "api.h"

void apiMoveViewPort() {
    
}

//Deplace un acteur par un offset en x et y
//opcode 000010
void apiMoveActor(char actorID, int offsetX, int offsetY) { //oooo ooii iixx xxxx yyyy yy00 0000 0000
    actorID &= 0x0F;    // 4 bits
    offsetX &= 0x3F;    // 6 bits
    offsetY &= 0x3F;    // 6 bits

    int instruction = (0b000010 << 26) | (actorID << 22) | (offsetX << 16) | (offsetY << 10);

    Xil_Out32(0x00, instruction);
}

void apiSetBackgroundBuffer(char tuileID, char posX, char posY ) {//oooo ooii iixx xxxx yyyy yy00 0000 0000
    tuileID &= 0x0F;    // 4 bits
    posX &= 0x3F;    // 6 bits
    posY &= 0x3F;    // 6 bits

    int instruction = (0b000100 << 26) | (tuileID << 22) | (posX << 16) | (posY << 10);

    Xil_Out32(0x00, instruction);
}

//Reintialise le jeu dans son etat de depart connu
void apiReset() { //1111 1100 0000 0000 0000 0000 0000 0000 FC00 0000
    Xil_Out32(0x00, 0xFC000000);
}

void apiSetActorPosition() {

}

#endif
