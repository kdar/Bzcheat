/*Copyright (C) Kevin Darlington, 2002*/

#include <iostream>
#include <cstdio>
#include <cstring>
#include <unistd.h>

#define _CHEATS_OWNER
#include "bzcheat.h"

#include <X11/Xlib.h>

//what you could do it make a menu class. have all those menu structures and stuff
//available to bzcheat, then have bzcheat do what BuildMenu () does, then pass on
//the memory locations to the menu for it to process

using namespace std;

//**************************
//     BZCheat Class
//**************************

//=======================================
BZCheat::BZCheat () : m_nMenuPos(1)
{
  m_pGL = new GLFuncs;
  BuildMenu ();
  
  //get screen resolution - NOTE: portability issue
  Display *pDisplay = XOpenDisplay (0);
  XWindowAttributes xWindowAttrib;
  XGetWindowAttributes (pDisplay, DefaultRootWindow (pDisplay), &xWindowAttrib);
  XCloseDisplay (pDisplay);
  
  //this is used by glOrtho to set up our perspective
  m_fMaxX = (float)xWindowAttrib.width/2;
  m_fMinX = (float)-xWindowAttrib.width/2;
  m_fMaxY = (float)xWindowAttrib.height/2;
  m_fMinY = (float)-xWindowAttrib.height/2;
  
  //basic menu dimensions
  m_fItemDistance = 20.0f;
  m_fMenuWidth = 150.0f;
  m_fBorderWidth = 1.0f;
  m_fTitleHeight = 20.0f;
  m_fTitleWidth = m_fMenuWidth;
  
  //position depending on perspective, specifies top left corner of menu
  m_fPosX = m_fMaxX - (m_fMenuWidth + 50.0f);
  m_fPosY = m_fMaxY - 100.0f;
  
  //set colors
  m_fBorderColor[0] = 1.0f;
  m_fBorderColor[1] = 1.0f;
  m_fBorderColor[2] = 1.0f;
  m_fBorderColor[3] = 0.70f;
  m_fBgColor[0] = 0.0f;
  m_fBgColor[1] = 0.05f;
  m_fBgColor[2] = 0.22f;
  m_fBgColor[3] = 0.6f;
  m_fTitleColor[0] = 0.05f;
  m_fTitleColor[1] = 0.1f;
  m_fTitleColor[2] = 0.2f;
  m_fTitleColor[3] = 0.7f;
}

//=======================================
BZCheat::~BZCheat ()
{
  if (m_pGL) delete m_pGL;
    
  if (m_pMenuPages) {
    for (int x = 0; x < m_nPages; x++) {
      delete []m_pMenuPages[x].pEntries;
    }
    delete []m_pMenuPages;
  }
}

//=======================================
//this function gets called many times (it gets iterated)
//it's not the fastest function so it lags a bit, but ehhh... it works
void BZCheat::DrawMenu ()
{    
  if (!bzCheat.bDisplayMenu) {
    m_pCurrentPage = &m_pMenuPages[0];
    return;
  }
  
  float fMenuHeight = (float)(((m_pCurrentPage->nEntries) * (m_fItemDistance)) + m_fTitleHeight - 1.0f);
  //ogl builds "from the bottom up". meaning if the y position is at 0, and you draw
  //a box that is 100 units high, the top of the box would be at y position 100, not 0
  //so this calculates the real y position 
  float fRealPosY = m_fPosY - fMenuHeight;
  
  //set some ogl stuff
  //glDisable (GL_TEXTURE_2D);  
  glEnable (GL_BLEND);
  glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  glShadeModel (GL_SMOOTH);
  glDisable (GL_DEPTH_TEST);
  
  glPushMatrix (); 
  
  //setup views
  glMatrixMode (GL_PROJECTION);  
  glLoadIdentity ();
  glOrtho (m_fMinX, m_fMaxX, m_fMinY, m_fMaxY, 1.0f, -1.0f);
  glMatrixMode (GL_MODELVIEW);
  
  //draw menu background and borders
  m_pGL->DrawOutlinedBox (m_fPosX, fRealPosY, 1.0f, m_fMenuWidth, fMenuHeight, 1.0f, m_fBgColor, m_fBorderColor);
  
  //draw black menu and status "seperator"
  glColor4f (0.0f, 0.0f, 0.0f, 0.4f);
  m_pGL->DrawBox (m_fPosX+(m_fMenuWidth-20.0f)+1.0f, fRealPosY+1.0f, 1.0f, 1.0f, fMenuHeight - m_fTitleHeight);

  //draw title and borders
  glColor4f (m_fTitleColor[0], m_fTitleColor[1], m_fTitleColor[2], m_fTitleColor[3]);
  m_pGL->DrawBox (m_fPosX+m_fBorderWidth, fRealPosY + (fMenuHeight - m_fTitleHeight), 1.0f, m_fTitleWidth-m_fBorderWidth, m_fTitleHeight);
  
  //menu "seperator"
  glColor4f (1.0f, 1.0f, 1.0f, 0.70f);
  m_pGL->DrawBox (m_fPosX+m_fBorderWidth, m_fPosY - m_fTitleHeight, 1.0f, m_fMenuWidth-m_fBorderWidth, 1.0f);
  
  //Draw Selected Item 
  //text selection bg
  glColor4f (1.0f, 1.0f, 0.3f, 0.3f);
  m_pGL->DrawBox (m_fPosX+1.0f, ((m_fPosY-m_fTitleHeight)-(m_nMenuPos*m_fItemDistance))+2.0f, 1.0f, m_fMenuWidth-20.0f, 18.0f);
  //status selection bg
  glColor4f (1.0f, 1.0f, 0.2f, 0.2f);
  m_pGL->DrawBox (m_fPosX+(m_fMenuWidth-20.0f)+1.0f, ((m_fPosY-m_fTitleHeight)-(m_nMenuPos*m_fItemDistance))+2.0f, 1.0f, 19.0f, 18.0f);
  //selection borders
  glColor4f (0.0, 0.0, 0.0, 1.0);
  m_pGL->DrawBox (m_fPosX+1.0f, ((m_fPosY-m_fTitleHeight)-(m_nMenuPos*m_fItemDistance))+1.0f, 1.0f, m_fMenuWidth - 1.0f, 1.0f);
  m_pGL->DrawBox (m_fPosX+1.0f, ((m_fPosY-m_fTitleHeight)-(m_nMenuPos*m_fItemDistance)) + 19.0f, 1.0f, m_fMenuWidth - 1.0f, 1.0f);


  glColor3f (1, 1, 1);

  //draw title text
  m_pGL->Printf (m_fPosX+22.0f, m_fPosY - 13.0f, FONT_12, m_pCurrentPage->szTitle);

  //draw menu entries' text
  float x = m_fPosX+6.0f, y = m_fPosY-m_fTitleHeight-13.0f;
  for (int c = 0; c < m_pCurrentPage->nEntries; c++, y -= m_fItemDistance) {
    m_pGL->Printf (x, y, FONT_12, m_pCurrentPage->pEntries[c].szText);
  
    if (m_pCurrentPage->pEntries[c].type == MENU_VAL) {
      if (*(m_pCurrentPage->pEntries[c].pState) == true)
        m_pGL->Printf (x + (m_fMenuWidth - 18.0f), y, FONT_13, "+");
      else
        m_pGL->Printf (x + (m_fMenuWidth - 18.0f), y, FONT_13, "-");
    } else {
      m_pGL->Printf (x + (m_fMenuWidth - 18.0f), y, FONT_13, ">");
    }
  }
  
  glPopMatrix ();
}

//=======================================
//it should somehow be a linked list. where you have one page, then either it has a state, or 
//a pointer to the next page, then the next page has a pointer to the previous page, etc
void BZCheat::BuildMenu ()
{
  m_nPages = 3;
  m_pMenuPages = new MenuPage[m_nPages];
  
  m_pMenuPages[0].pEntries = new MenuEntry[9];
  m_pMenuPages[0].szTitle = "BZCheat Menu 2.0";
  m_pMenuPages[1].pEntries = new MenuEntry[3];
  m_pMenuPages[1].szTitle = "< Flags";
  m_pMenuPages[2].pEntries = new MenuEntry[4];
  m_pMenuPages[2].szTitle = "< Kill Target";
  
  //---Menu page 1 (Flag menu page)---
  m_pMenuPages[1].pEntries[0].szText = "Guided Missiles";
  m_pMenuPages[1].pEntries[0].pState = &bGuidedMissileFlag;
  m_pMenuPages[1].pEntries[0].type   = MENU_VAL;  
  m_pMenuPages[1].pEntries[1].szText = "Shockwave";
  m_pMenuPages[1].pEntries[1].pState = &bShockWaveFlag;
  m_pMenuPages[1].pEntries[1].type   = MENU_VAL;  
  m_pMenuPages[1].pEntries[2].szText = "Laser";
  m_pMenuPages[1].pEntries[2].pState = &bLaserFlag;
  m_pMenuPages[1].pEntries[2].type   = MENU_VAL;  
      
  m_pMenuPages[1].pPrev = &m_pMenuPages[0];
  m_pMenuPages[1].nEntries = 3;
  
  //---Menu page 2 (Target menu page)---
  m_pMenuPages[2].pEntries[0].szText = "Current Weapon";
  m_pMenuPages[2].pEntries[0].pState = &bCurrentWeaponTarget;
  m_pMenuPages[2].pEntries[0].type   = MENU_VAL;
  m_pMenuPages[2].pEntries[1].szText = "ShockWave";
  m_pMenuPages[2].pEntries[1].pState = &bShockWaveTarget;
  m_pMenuPages[2].pEntries[1].type   = MENU_VAL;
  m_pMenuPages[2].pEntries[2].szText = "Guided Missiles";
  m_pMenuPages[2].pEntries[2].pState = &bMissileTarget;
  m_pMenuPages[2].pEntries[2].type   = MENU_VAL;
  m_pMenuPages[2].pEntries[3].szText = "Laser";
  m_pMenuPages[2].pEntries[3].pState = &bLaserTarget;
  m_pMenuPages[2].pEntries[3].type   = MENU_VAL;  
  
  m_pMenuPages[2].pPrev = &m_pMenuPages[0];
  m_pMenuPages[2].nEntries = 4;
  
  //---Menu page 0 (Main menu page)--- 
  m_pMenuPages[0].pEntries[0].szText  = "Flags";
  m_pMenuPages[0].pEntries[0].pNext   = &m_pMenuPages[1];
  m_pMenuPages[0].pEntries[0].type    = MENU_SUB;
  m_pMenuPages[0].pEntries[1].szText  = "Kill Target";
  m_pMenuPages[0].pEntries[1].pNext   = &m_pMenuPages[2];
  m_pMenuPages[0].pEntries[1].type    = MENU_SUB; 
  m_pMenuPages[0].pEntries[2].szText  = "Identify";
  m_pMenuPages[0].pEntries[2].pState  = &bIdentify;
  m_pMenuPages[0].pEntries[2].type    = MENU_VAL;  
  m_pMenuPages[0].pEntries[3].szText  = "Ghost";
  m_pMenuPages[0].pEntries[3].pState  = &bGhost;
  m_pMenuPages[0].pEntries[3].type    = MENU_VAL;  
  m_pMenuPages[0].pEntries[4].szText  = "Fly";
  m_pMenuPages[0].pEntries[4].pState  = &bFly;
  m_pMenuPages[0].pEntries[4].type    = MENU_VAL;  
  m_pMenuPages[0].pEntries[5].szText  = "Invincible";
  m_pMenuPages[0].pEntries[5].pState  = &bInvincible;
  m_pMenuPages[0].pEntries[5].type    = MENU_VAL;  
  m_pMenuPages[0].pEntries[6].szText  = "See All";
  m_pMenuPages[0].pEntries[6].pState  = &bSeeAll;
  m_pMenuPages[0].pEntries[6].type    = MENU_VAL;  
  m_pMenuPages[0].pEntries[7].szText  = "Drop Bad";
  m_pMenuPages[0].pEntries[7].pState   = &bDropBadFlags;
  m_pMenuPages[0].pEntries[7].type    = MENU_VAL;  
  m_pMenuPages[0].pEntries[8].szText  = "Shoot Always";
  m_pMenuPages[0].pEntries[8].pState  = &bShootAlways;
  m_pMenuPages[0].pEntries[8].type    = MENU_VAL;
  
  m_pMenuPages[0].pPrev = 0;
  m_pMenuPages[0].nEntries = 9;
  
  m_pCurrentPage = &m_pMenuPages[0];
}

//=======================================
void BZCheat::IncreaseMenuPos ()
{
  if (m_nMenuPos == m_pCurrentPage->nEntries) {
    m_nMenuPos = 1;
  } else {
    m_nMenuPos += 1;
  }
}

//=======================================
void BZCheat::DecreaseMenuPos ()
{
  if (m_nMenuPos == 1) {
    m_nMenuPos = m_pCurrentPage->nEntries;
  } else {
    m_nMenuPos -= 1;
  }
}

//=======================================
void BZCheat::MenuAction1 ()
{
  switch (m_pCurrentPage->pEntries[m_nMenuPos-1].type) {
    case MENU_VAL:
      *(m_pCurrentPage->pEntries[m_nMenuPos-1].pState) = !*(m_pCurrentPage->pEntries[m_nMenuPos-1].pState);
    break;
    
    case MENU_SUB:
      if (m_pCurrentPage)
        m_pCurrentPage = m_pCurrentPage->pEntries[m_nMenuPos-1].pNext;
      m_nMenuPos = 1;
    break;
  }
}

//=======================================
void BZCheat::MenuAction2 ()
{
  if (m_pCurrentPage->pPrev != 0) {
    if (m_pCurrentPage) {
      m_pCurrentPage = m_pCurrentPage->pPrev;
    }
  } else {
    bDisplayMenu = false;
  }
  
  if (m_pCurrentPage != &m_pMenuPages[0])
    m_nMenuPos = 1;
}
