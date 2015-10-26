/*Copyright (C) Kevin Darlington, 2002*/

#ifndef _BZCHEAT_H 
#define _BZCHEAT_H 1

#include "glfuncs.h"

enum MenuEntryType
{
  MENU_SUB,
  MENU_VAL
};

//menu structures
struct MenuEntry;
struct MenuPage
{
  char *szTitle;
  MenuEntry *pEntries;
  MenuPage *pPrev;
  int nEntries;
};
struct MenuEntry 
{
  char *szText;  
  MenuEntryType type;
  
  union
  {
    bool *pState;
    MenuPage *pNext;
  };
};

class BZCheat
{
  public:
    BZCheat ();
    ~BZCheat ();
  
    void DrawMenu ();
    void IncreaseMenuPos ();
    void DecreaseMenuPos ();
    void MenuAction1 ();
    void MenuAction2 ();
  
    //how playing.cxx informs SceneRenderer.cxx to call DrawMenu ();
    bool bDisplayMenu;
  
    //cheats
    bool bIdentify;
    bool bGhost;
    bool bFly;
    bool bInvincible;
    bool bSeeAll;
    bool bDropBadFlags;
    bool bShootAlways;
    //flags
    bool bGuidedMissileFlag;
    bool bShockWaveFlag;
    bool bLaserFlag;
    //targets
    bool bCurrentWeaponTarget;
    bool bShockWaveTarget;
    bool bMissileTarget;
    bool bLaserTarget;
    
  protected:
    void BuildMenu ();
  
  private:
    GLFuncs *m_pGL;
    
    float m_fPosX;
    float m_fPosY;
    
    float m_fMaxX;
    float m_fMinX;
    float m_fMaxY;
    float m_fMinY;
    
    float m_fItemDistance;
    
    float m_fMenuWidth;
    float m_fBorderWidth;
    float m_fTitleHeight;
    float m_fTitleWidth;
    
    GLfloat m_fBorderColor[4];
    GLfloat m_fBgColor[4]; 
    GLfloat m_fTitleColor[4];
    
    MenuPage *m_pMenuPages;
    MenuPage *m_pCurrentPage;
    int m_nPages;      //number of menu pages 
    int m_nMenuPos;    //the current menu position
};

#ifndef _CHEATS_OWNER
extern
#endif
BZCheat bzCheat;

#endif
