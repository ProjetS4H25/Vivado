#ifndef API_C
#define API_C

#include "api.h"

// Déplace le viewport selon un certain offset en X
// opcode 0b000001
void apiMoveViewPort(int offsetX)
{
    offsetX &= 0x3F; // 6 bits

    int instruction = (0b000001 << 26) | (offsetX << 20);

    Xil_Out32(0x43C40000, instruction);
}

// Deplace un acteur par un offset en x et y
// opcode 000010
void apiMoveActor(char actorID, int offsetX, int offsetY)
{                    // oooo ooii iixx xxxx yyyy yy00 0000 0000
    actorID &= 0x0F; // 4 bits
    offsetX &= 0x3F; // 6 bits
    offsetY &= 0x3F; // 6 bits

    int instruction = (0b000010 << 26) | (actorID << 22) | (offsetX << 16) | (offsetY << 10);

    Xil_Out32(0x43C40000, instruction);
}

void apiSetBackgroundBuffer(char tuileID, char posX, char posY ) {//oooo ooii iixx xxxx yyyy yy00 0000 0000
    tuileID &= 0x0F;    // 4 bits
    posX &= 0x3F;    // 6 bits
    posY &= 0x3F;    // 6 bits

    int instruction = (0b000100 << 26) | (tuileID << 22) | (posX << 16) | (posY << 10);

    Xil_Out32(0x43C40000, instruction);
}

// Reintialise le jeu dans son etat de depart connu
void apiReset()
{ // 1111 1100 0000 0000 0000 0000 0000 0000 FC00 0000
    Xil_Out32(0x43C40000, 0xFC000000);
}

//intialise la position d un acteur dans l affichage
//opcode 100001
void apiSetActorPosition(char actorID, int positionX, int positionY) { //oooo ooii iixx xxxx xxxx yyyy yyyy yy00
    actorID &= 0x0F;    // 4 bits
    positionX &= 0x03FF;// 10 bits
    positionY &= 0x03FF;// 10 bits

    int instruction = (0b100001 << 26) | (actorID << 22) | (positionX << 12) | (positionY << 2);
    
    Xil_Out32(0x43C40000, instruction);
}

#endif
