#include "glfuncs.h"

//**************************
//     GLFuncs Class
//**************************

//=======================================
GLFuncs::GLFuncs ()
{
  
}

//=======================================
GLFuncs::~GLFuncs ()
{
  
}

//=======================================
void GLFuncs::DrawBox (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height)
{
  glBegin (GL_QUADS);
  glVertex3f (x, y, z);
  glVertex3f (x + width, y, z);
  glVertex3f (x + width, y + height, z);
  glVertex3f (x, y + height, z);
  glEnd ();
}

//=======================================
void GLFuncs::DrawVGradientBox (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height, GLfloat colorTop[4], GLfloat colorBottom[4])
{
  glShadeModel (GL_SMOOTH);
  glBegin (GL_QUADS);
  glColor4f (colorBottom[0], colorBottom[1], colorBottom[2], colorBottom[3]);
  glVertex3f (x, y, z);
  glVertex3f (x + width, y, z);
  glColor4f (colorTop[0], colorTop[1], colorTop[2], colorTop[3]);
  glVertex3f (x + width, y + height, z);
  glVertex3f (x, y + height, z);
  glEnd ();
}

//=======================================
//draws the box at x and y, then the outline outside
void GLFuncs::DrawOutlinedBox (GLfloat x, GLfloat y, GLfloat z, GLfloat boxWidth, GLfloat boxHeight, GLfloat borderSize, GLfloat boxColor[4], GLfloat borderColor[4])
{
  //absolute value
  if (borderSize < 0)
    borderSize += (borderSize*2);
  
  //middle box
  glColor4f (boxColor[0], boxColor[1], boxColor[2], boxColor[3]);
  DrawBox (x, y, z, boxWidth, boxHeight);
  
  //border
  DrawOutBorder (x, y, z, boxWidth, boxHeight, borderSize, borderColor);
}

//=======================================
//draws on the outside, x and y define the box, not the border
void GLFuncs::DrawOutBorder (GLfloat x, GLfloat y, GLfloat z, GLfloat boxWidth, GLfloat boxHeight, GLfloat borderSize, GLfloat borderColor[4])
{
  //absolute value
  if (borderSize < 0)
    borderSize += (borderSize*2);
  
  //border
  glColor4f (borderColor[0], borderColor[1], borderColor[2], borderColor[3]);
  DrawBox (x-borderSize, y, z, borderSize, boxHeight+borderSize); //left
  DrawBox (x, y+boxHeight, z, boxWidth+borderSize, borderSize); //top  
  DrawBox (x+boxWidth, y-borderSize, z, borderSize, boxHeight+borderSize); //right
  DrawBox (x-borderSize, y-borderSize, z, boxWidth+borderSize, borderSize); //bottom
  
}

//=======================================
void GLFuncs::Printf (GLfloat x, GLfloat y, BFont font, char *szBuffer)
{
  //doesn't seem to work with bzflag :'(
  /*fntRenderer texout ;
  fntTexFont font ("/home/crenix/Programming/C++/bzcheat/Helvetica-Bold.txf") ;
  texout.setFont (&font) ;
  texout.setPointSize (14) ;
  texout.begin () ;
  texout.start2f (x, y) ;
  texout.puts (szBuffer) ;
  texout.end () ;*/
  
  void **nGlutFont = 0;
  switch (font) {
    case FONT_12:
      nGlutFont = GLUT_BITMAP_HELVETICA_12;
    break;
    
    case FONT_13:
      nGlutFont = GLUT_BITMAP_8_BY_13;
    break;
  }
  
  if (nGlutFont) {
    //bitmaps seem to be the things that work, and glut does just that
    char *c;
    glRasterPos2f (x, y);
    for (c = szBuffer; *c != '\0'; c++) {
      glutBitmapCharacter (nGlutFont, *c);
    }
  }
}
