#ifndef _GLFUNCS_H
#define _GLFUNCS_H 1

#include <GL/glut.h>
#include <GL/gl.h>

enum BFont 
{
  FONT_12,
  FONT_13
};

class GLFuncs
{
  public:
    GLFuncs ();
    ~GLFuncs ();
  
    void DrawBox (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height);
    void DrawVGradientBox (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height, GLfloat colorTop[4], GLfloat colorBottom[4]);
    void DrawOutlinedBox (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height, GLfloat borderSize, GLfloat boxColor[4], GLfloat borderColor[4]);
    void DrawOutBorder (GLfloat x, GLfloat y, GLfloat z, GLfloat boxWidth, GLfloat boxHeight, GLfloat borderSize, GLfloat borderColor[4]);
    void Printf (GLfloat x, GLfloat y, BFont font, char *szBuffer);
};

#endif
