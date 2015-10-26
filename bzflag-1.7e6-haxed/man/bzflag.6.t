bzflag(6)                                                            bzflag(6)



NNAAMMEE
       BZFlag - a tank battle game

SSYYNNOOPPSSIISS
       bbzzffllaagg  [--33ddffxx] [--nnoo33ddffxx] [--aannoonnyymmoouuss] [--ccaallllssiiggnn _c_a_l_l_s_i_g_n] [--ddiirreeccttoorryy
       _d_i_r_e_c_t_o_r_y] [--eecchhoo] [--ggeeoommeettrryy  _w_i_d_t_hxx_h_e_i_g_h_t[{++|--}x{++|--}y]]  [--iinntteerrffaaccee
       _i_n_t_e_r_f_a_c_e]  [--llaattiittuuddee  _l_a_t_i_t_u_d_e]  [--lliisstt  _u_r_l]  [--lloonnggiittuuddee _l_o_n_g_i_t_u_d_e]
       [--mmuullttiissaammppllee] [--mmuuttee] [--nnoolliisstt] [--ppoorrtt _p_o_r_t] [--ssoolloo  _n_u_m_b_e_r_-_o_f_-_r_o_b_o_t_s]
       [--tteeaamm  {_r_e_d  |  _g_r_e_e_n  | _b_l_u_e | _p_u_r_p_l_e | _r_o_g_u_e}] [--ttttll _t_t_l] [--vveerrssiioonn]
       [--vviieeww {_n_o_r_m_a_l | _s_t_e_r_e_o |  _t_h_r_e_e}]  [--wwiinnddooww]  [--zzbbuuffffeerr  {_o_n  |  _o_f_f}]
       [_s_e_r_v_e_r]

DDEESSCCRRIIPPTTIIOONN
       BBZZFFllaagg  is a 3D multi-player tank battle game that allows users to play
       against each other in a networked environment.  There are  five  teams:
       red, green, blue, purple and rogue (rogue tanks are black).  Destroying
       a player on another  team  scores  a  win,  while  being  destroyed  or
       destroying  a  teammate  scores  a loss.  Rogues have no teammates (not
       even other rogues), so they cannot shoot teammates and they do not have
       a team score.

       There  are two main styles of play:  capture-the-flag and free-for-all.
       In capture-the-flag, each team (except rogues) has a team base and each
       team  with  at least one player has a team flag.  The object is to cap-
       ture an enemy team's flag by bringing it to  your  team's  base.   This
       destroys  every  player  on  the captured team, subtracts one from that
       team's score, and adds one to  your  team's  score.   In  free-for-all,
       there  are no team flags or team bases.  The object is simply to get as
       high a score as possible.

   OOppttiioonnss
              --33ddffxx          For Mesa users with a passthrough 3Dfx card, e.g.
                             a  Voodoo  or Voodoo 2 based card.  This sets the
                             MESA_GLX_FX   environment   variable    to    use
                             fullscreen  passthrough  mode.   Use --ggeeoommeettrryy to
                             use  a  resolution  other  than  640x480  on  the
                             passthrough card.  You should not use this option
                             with --wwiinnddooww.

              --nnoo33ddffxx        For Mesa users with a passthrough 3Dfx card, such
                             as  Voodoo  or Voodoo 2 based cards.  This unsets
                             the MESA_GLX_FX environment variable so that  the
                             passthrough  card isn't used.  Use this option if
                             MESA_GLX_FX is normally set in  your  environment
                             and  you don't want bzflag to use the passthrough
                             card.  This option is only  a  convenience;   you
                             can   achieve   the   same  effect  by  unsetting
                             MESA_GLX_FX in your environment.

              --aannoonnyymmoouuss     Uses the email address _a_n_o_n_y_m_o_u_s instead of _u_s_e_r_-
                             _n_a_m_e_@_h_o_s_t_n_a_m_e.

              --ccaallllssiiggnn _c_a_l_l_s_i_g_n
                             Uses  _c_a_l_l_s_i_g_n  as  the  player's  callsign.  The
                             callsign is taken from the command line  if  pro-
                             vided.   Otherwise the callsign used for the pre-
                             vious game is used.  If that cannot be found then
                             the  callsign  is the value of the BBZZFFLLAAGGIIDD envi-
                             ronment variable.  If BBZZFFLLAAGGIIDD is empty or  unde-
                             fined then bbzzffllaagg will prompt for a callsign when
                             joining a game.

              --ddiirreeccttoorryy _d_i_r_e_c_t_o_r_y
                             Looks for data files in  _d_i_r_e_c_t_o_r_y  first.   This
                             defaults to a directory named _d_a_t_a in the current
                             directory.  If not found there,  the  game  looks
                             for  data files in the current directory, then in
                             the      default      installation       location
                             _/_u_s_r_/_X_1_1_R_6_/_l_i_b_/_X_1_1_/_b_z_f_l_a_g_/_d_a_t_a.

              --eecchhoo          Copies all message window output to the shell.

              --ggeeoommeettrryy _w_i_d_t_hxx_h_e_i_g_h_t[{++|--}x{++|--}y]
                             This  specifies  the  size  and,  optionally, the
                             position of the window. It can be  used  with  or
                             without  the  --wwiinnddooww option. It may be necessary
                             to use this on some systems  when  bzflag  cannot
                             correctly determine the display size.

              --iinntteerrffaaccee _i_n_t_e_r_f_a_c_e
                             Send  all  multicast  packets  through _i_n_t_e_r_f_a_c_e,
                             which should be the IP address of one the  host's
                             multicast   capable   interfaces.   Communication
                             between players is normally via multicast as this
                             is  much  more  efficient  than unicasting to all
                             other players and  more  flexible  and  efficient
                             than broadcasting to all hosts.  The first multi-
                             cast capable interface is used by default.

              --llaattiittuuddee _l_a_t_i_t_u_d_e
                             Uses _l_a_t_i_t_u_d_e  when  computing  celesital  object
                             positions.

              --lloonnggiittuuddee _l_o_n_g_i_t_u_d_e
                             Uses  _l_o_n_g_i_t_u_d_e  when  computing celesital object
                             positions.

              --lliisstt _u_r_l      Look for bbzzffllss servers using _u_r_l.  A built-in url
                             is  used  by default (the same url is the default
                             for bbzzffss).  See bbzzffllss for a  description  of  the
                             format of _u_r_l.  If _u_r_l is _d_e_f_a_u_l_t then the url is
                             reset to the built-in url (the url is  remembered
                             across  invokations  of  bbzzffllaagg).   BBzzffllss servers
                             keep a list of bbzzffss servers accessible  from  the
                             internet  and  are  queried  when  using the Find
                             Server menu.

              --mmuullttiissaammppllee   Uses a multisample buffer for rendering.  If mul-
                             tisampling  isn't  available then the application
                             will terminate.

              --mmuuttee          Disables sound.

              --nnoolliisstt        Disables bbzzffllss server querying.  See --lliisstt.

              --ppoorrtt _p_o_r_t     Connect to server on _p_o_r_t instead of the default.
                             The  server  must  be listening on this port (see
                             the -p option on bbzzffss).

              --ssoolloo _n_u_m_b_e_r_-_o_f_-_r_o_b_o_t_s
                             When you join a game, you'll also  cause  _n_u_m_b_e_r_-
                             _o_f_-_r_o_b_o_t_s robots to join too.  This is an experi-
                             mental option and the robots are extremely stupid
                             players.  Robots are added to teams at random.

              --tteeaamm _t_e_a_m_-_n_a_m_e
                             Chooses the player's team.

              --ttttll _t_i_m_e_-_t_o_-_l_i_v_e
                             Sets the maximum time-to-live of the inter-player
                             multicast packets.  Any site more than this  many
                             hops away will not be reachable.

              --vveerrssiioonn       Prints the version number of the executable.

              --vviieeww {_n_o_r_m_a_l | _s_t_e_r_e_o | _t_h_r_e_e}
                             Chooses  one  of  three possible display options.
                             _N_o_r_m_a_l will render a single view  to  the  entire
                             screen.   _S_t_e_r_e_o  will  try  to allocate a stereo
                             (in-a-window) capable buffer and then draw a sin-
                             gle  view  in stereo.  You're system must support
                             stereo-in-a-window buffers  and  stereo  goggles.
                             _T_h_r_e_e  will  render  the  front view to the upper
                             right quadrant of the display, a left view to the
                             lower  left  quadrant,  and  a  right view to the
                             lower right quadrant.  This is intended for  sys-
                             tems  capable  of  driving multiple moniters from
                             various areas of the display surface, yielding  a
                             wrap around view.

              --wwiinnddooww        Runs  the application in a window instead of full
                             screen.

              --zzbbuuffffeerr {_o_n | _o_f_f}
                             When _o_f_f is chosen the game will not  attempt  to
                             allocate  a  depth (z) buffer and will use a dif-
                             ferent rendering  technique  for  hidden  surface
                             removal.   Some systems may be capable of using a
                             higher screen resolution if a depth buffer  isn't
                             allocated.

              _s_e_r_v_e_r         Specifies the host running the bbzzffss server.  Mul-
                             tiple independent games can be run  on  a  single
                             network.   Which  server you choose decides which
                             game you enter.

   CCoonnttrroollss
       Tanks are controlled by moving the mouse within the large yellow box in
       the main view.  When the mouse is inside the small yellow box, the tank
       is motionless.  The large box is the limit of the tank's speed.

       Shots are fired by pressing the _l_e_f_t _m_o_u_s_e _b_u_t_t_o_n.  The  type  of  shot
       fired  depends  on what flag the tank has.  Normal shots last about 3.5
       seconds.  Reloading also takes 3.5 seconds for normal shots.

       Pressing the _m_i_d_d_l_e _m_o_u_s_e _b_u_t_t_o_n drops a flag.  Nothing will happen  if
       the tank has no flag or is not allowed to drop the flag for some reason
       (e.g. it's a bad flag).  Flags are picked up by driving over  them.   A
       dropped  flag gets tossed straight up;  it falls to the ground in about
       3 seconds.

       Pressing the _r_i_g_h_t _m_o_u_s_e _b_u_t_t_o_n identifies the closest player  centered
       in the view.  If your tank has the guided missile super-flag, this will
       also lock the missile on target.  However, the target must be carefully
       centered for the missile to lock.

       When the server allows jumping or if the tank has the jumping flag, the
       _T_a_b key jumps.  Tanks can jump onto buildings, however there is no  way
       to  shoot downward (or upward) with a regular shot.  The guided missile
       and the shock wave are two ways of destroying  a  tank  on  or  from  a
       building.

       The  current radar range can be changed by pressing the _1_, _2_, or _3 keys
       above  the  alphabetic  keys  for  low,   medium,   and   long   range,
       respectively.  The _f key toggles the flag help display, which describes
       the flag in the tank's possession.  Displaying help does nnoott pause  the
       game.

       The _P_a_u_s_e key pauses and resumes play.  When paused, the tank cannot be
       destroyed nor can it's shots destroy other players.  The reload  count-
       down  is  suspended  and the radar and view are blanked when paused.  A
       paused tank has a transparent black sphere  surrounding  it.   Since  a
       paused tank is invulnerable a player could cheat by pausing just before
       being destroyed, so there's  a  brief  delay  before  the  pause  takes
       effect.   This delay is long enough to make pausing effectively useless
       for cheating.  Pressing _P_a_u_s_e before the pause takes effect cancels the
       pause request.

       The list of players and scores is displayed when your tank is paused or
       dead.  Pressing the _s key toggles the score display when alive and  not
       paused.

       The  _b  key  toggles binoculars, which gives a close up view of distant
       objects.  The _t key toggles the frame rate display and the _y key toggle
       the  frame  time  display. The time of day can be changed with the _p_l_u_s
       and _m_i_n_u_s keys, which advance  and  reverse  the  time  by  5  minutes,
       respectively.   The  time of day in the game is initialized to the sys-
       tem's clock.  In addition, the latitude and longitude are used to  cal-
       culate the positions of celestial objects.

       The _E_s_c key shows the game menu.  Use the _E_n_t_e_r and arrow keys to navi-
       gate the menu and the _E_s_c key to return to the previous  menu  or  hide
       the main menu.  The menus allow you to start a new server, join a game,
       leave a game and enter another, change the  rendering  options,  change
       the  display resolution, change the sound volume, remap the meanings of
       keys, browse online help, and quit the game.

       The display resolution is not always available for changing.  If it is,
       use  the  _t key to test a selected resolution;  it will be loaded for a
       few seconds and then the previous resolution restored.  Press the _E_n_t_e_r
       key to permanently select a new resolution. When you quit the game, the
       resolution is restored to what it was before the game started.

       Options are recorded between game sessions  in  the  .bzflag  file  (or
       .bzflag.$(HOST)  if  the  _H_O_S_T  environment variable is defined) in the
       user's home directory.  This file has a simple name/value pair  format.
       This file is completely rewritten by the game after each session.

       You  can  send  typed  messages to other players by pressing the _m or _n
       keys.  The _m key will send a message to  your  teammates  only.   Rogue
       players  cannot  send these messages.  The _n key will send a message to
       all the other players.  After pressing the key, just type your  message
       and  press  enter  or  Control-D.  To cancel a message, you can enter a
       blank message or press Delete, Escape, or Control-C.  Be  careful  with
       the Escape key;  pressing Escape once will cancel the message, pressing
       it again will show the main  menu.   Backspace  will  delete  the  most
       recently typed character.  The Tab key doesn't add a tab to the message
       but instead causes the tank to jump (as usual).  You can  also  send  a
       direct  message  to a single player by pressing the _, or _.  keys. The _,
       key will send your message to your 'nemesis', i.e. the last player  who
       killed you or was killed by you. The _.  key will send a private message
       to another player. You can choose the recipient by using the  left  and
       right arrow keys.

   SSccoorriinngg
       An  individual's score is the difference between that player's wins and
       losses.  A win is scored for each enemy  tank  destroyed.   A  loss  is
       scored  for  each  teammate  destroyed  and for each time the player is
       destroyed.  The score sheet displays each player's score and the number
       of wins and losses.

       A  team's  score is calculated differently depending on the game style.
       In the capture-the-flag style, the team score is the  number  of  enemy
       flags  captured minus the number of times the team's flag was captured.
       Capturing your own flag (by taking it onto an enemy base) counts  as  a
       loss.   In the free-for-all style, the team score is sum of the wins of
       all the players on the team minus the sum of  the  losses  of  all  the
       players on the team.

       The  score sheet also lists the number times you have destroyed or been
       destroyed by each other player under the _K_i_l_l_s heading.  This lets  you
       compare your one-on-one performance against other players.

   TTeelleeppoorrtteerrss
       The server can be configured to place teleporters in the game.  A tele-
       porter is a tall black transparent object  that  instantaneously  moves
       any  object  (tanks  and  shots) passing through it to some other tele-
       porter.  The teleporter connections are fixed for the entire game.   In
       the capture-the-flag style the connections are always the same.  In the
       free-for-all style the connections are  random  and  reversable  (going
       back through where you come out puts you back where you started).

       Each  side  of  a teleporter teleports independently of the other side.
       However, it's possible for each side to go to the  other.   This  is  a
       thru-teleporter and it's almost as if it weren't there.  It's also pos-
       sible for a side to teleport to itself.  This is a  reverse-teleporter.
       Shooting  at  a  reverse  teleporter  is likely to be self-destructive.
       Shooting a laser at a reverse teleporter is invariably fatal.

   RRaaddaarr
       The radar is displayed on the left side of the control panel.  It  pro-
       vides  a  satellite view of the game.  Buildings and the outer wall are
       light blue.  Team bases are outlined squares in the team colors.  Tele-
       porters  are short yellow lines.  Tanks are dots the in the tank's team
       color, except for rogues which are yellow.  The size of a tank's dot is
       a  rough  indication  of  the tank's altitude: higher tanks have larger
       dots.  Flags are small crosses.  Team flags have the team  color  while
       super-flags  are white.  Shots are small white dots (except laser beams
       which are line segments and shock waves which are circles).

       The tank always appears in the center of the radar and the  radar  dis-
       play  rotates  with  the  tank so that forward is always up.  There's a
       small tick mark indicating forward.  The left and right extremes of the
       current  view  are represented by a yellow V who's tip is at the center
       of the radar.  North is indicated by the letter N.

   HHeeaaddss UUpp DDiissppllaayy
       The heads-up-display, or HUD, has several displays.  First,  there  are
       two boxes in the center of the view.  As explained above, these delimit
       the ranges for the mouse.  These boxes are  yellow  when  you  have  no
       flag.   Otherwise they take the color of the flag you're holding (white
       for superflags).

       Above the larger box is a heading tape showing  your  current  heading.
       North  is  0, east is 90, etc.  If jumping is allowed, an altitude tape
       appears to the right of the larger box.

       Small colored diamonds or arrows may appear on the  heading  tape.   An
       arrow  pointing  left  means that a particular flag is to your left, an
       arrow pointing right means that the flag is to your right, and  a  dia-
       mond  indicates  the heading to the flag by its position on the heading
       tape.  In capture-the-flag mode a marker in your team's color is always
       present,  showing  you  the  direction  to  your team's flag.  A yellow
       marker shows the way to the antidote flag (when you have a bad flag and
       antidote flags are enabled).

       At  the  top  of the HUD are several text readouts.  At the very top on
       the left is your callsign and score, in your team's color.  At the very
       top  on the right is the name of the flag you're holding (or nothing if
       you have no flag).  In the center at the top is  your  current  status:
       ready,  dead,  sealed,  zoned, or reloading. If you have a bad flag and
       shaking time is enabled and your status is ready, the  status  displays
       how  much  time is left before the bad flag is shaken.  When reloading,
       the time until you're reloaded is displayed.  A tank is sealed when  it
       has  the  oscillation  overthruster  flag  and  any part of the tank is
       inside a building. A tank is zoned when it has the  phantom  zone  flag
       and  has passed through a teleporter.  When there's a time limit on the
       game, the time left in the game is displayed to the left of the status.

   FFllaaggss
       Team  flags  are  supplied  by the server in the capture-the-flag style
       game.  While at least one player is on a team, that team's flag  is  in
       the  game.  When captured, the flag is returned to the team's base.  If
       the flag is dropped in a Bad Place, it is moved to a  safety  position.
       Bad  Places  are:   on top of a building or on an enemy team base.  The
       flag can be dropped on a team base only by a player from a third  team;
       for example, when a blue player drops the red flag on the green base.

       A  team  flag is captured when a tank takes an enemy flag onto its base
       or when a tank takes its flag onto an enemy base (even  if  there's  no
       one  playing  on  that  team).   You must be on the ground to capture a
       flag.

       The server can be configured to supply a fixed or random set of  super-
       flags.   These  flags are white and come in many flavors.  However, you
       cannot tell what a super-flag is until it's picked up.  There  are  two
       broad  catagories  of super-flags:  good and bad.  Good super-flags may
       be dropped and will remain for up to 4  possessions.   Bad  super-flags
       are  sticky -- in general, they cannot be dropped.  The server may pro-
       vide a yellow antidote flag.  Driving over  it  will  release  the  bad
       flag.   The  server may also allow a timeout and/or a number of wins to
       shake the flag.  Scoring the required number  of  wins,  surviving  the
       required  amount of time or being destroyed will automatically drop the
       flag.  Bad flags disappear after the first possession.

       Here is a brief description of each good superflag with the flag's code
       in parentheses:

              HHiigghh SSppeeeedd ((VV)) Boosts top speed by 50%.

              QQuuiicckk TTuurrnn ((AA)) Boosts turn rate by 50%.

              OOsscciillllaattiioonn OOvveerrtthhrruusstteerr ((OOOO))
                             Let's  the tank go through buildings.  You cannot
                             back up in or into a building, nor can you  shoot
                             while inside.

              RRaappiidd FFiirree ((FF)) Increases  shot  speed  and  decreases  range and
                             reload delay.

              MMaacchhiinnee GGuunn ((MMGG))
                             Increases shot speed and  dramatically  decreases
                             range and reload delay.

              GGuuiiddeedd MMiissssiillee ((GGMM))
                             Shots  guide themselves when locked on.  The mis-
                             sile can be retargeted at  any  time  during  its
                             flight  (with  the  right  mouse  button).   This
                             allows the player some control over the missile's
                             steering.

              LLaasseerr ((LL))      Shoots  a  laser, with effectively infinite speed
                             and range.  Just point and shoot.  The binoculars
                             are  handy  for  lining  up distant targets.  The
                             downside (you knew it was  coming)  is  that  the
                             reload time is doubled.

              RRiiccoocchheett ((RR))   Shots  reflect  off  walls.   It is exceptionally
                             easy to kill yourself with this flag.

              SSuuppeerr BBuulllleett ((SSBB))
                             Shots can go through buildings (possibly destroy-
                             ing  a  tank  with  the  oscillation overthruster
                             flag) and can also destroy (phantom) zoned tanks.

              SStteeaalltthh ((SSTT))   Tank becomes invisible on radar but is still vis-
                             ible out-the-window.

              CCllooaakkiinngg ((CCLL))  Tank  becomes  invisible  out-the-window  but  is
                             still visible on radar.

              IInnvviissiibbllee BBuulllleett ((IIBB))
                             Shots  are  invisible on radar (except your own).
                             They are visible out-the-window.  Sort of stealth
                             for shots.

              TTiinnyy ((TT))       Tank becomes much smaller and harder to hit.

              NNaarrrrooww ((NN))     Tank becomes paper thin.  It's very hard (but not
                             impossible) to hit a narrow tank from  the  front
                             or  back.   However, the tank is as long as usual
                             so hitting it from the  side  has  normal  diffi-
                             culty.

              SShhiieelldd ((SSHH))    Getting  shot  while  in  possession of this flag
                             simply drops the flag (instead of destroying  the
                             tank).   Since the flag may not disappear you may
                             want to wait around for it to fall to the  ground
                             so  you  can  grab  it again, but, be warned, the
                             shield flag flies for an extra long time  (longer
                             than the normal reload time).

              SStteeaammrroolllleerr ((SSRR))
                             Tank can destroy other tanks by driving over them
                             (but you must get quite close).

              SShhoocckk WWaavvee ((SSWW))
                             Tank doesn't fire shells.  Instead it sends out a
                             shock wave in all directions.  Any tank caught in
                             the wave is destroyed (including tanks on  or  in
                             buildings).

              PPhhaannttoomm ZZoonnee ((PPZZ))
                             Driving  through  a  teleporter phantom zones the
                             tank.  A zoned tank cannot shoot, but  can  drive
                             through  buildings and cannot be destroyed except
                             by a Super Bullet or a  Shock  Wave  (or  if  the
                             team's flag is captured).

              GGeennoocciiddee ((GG))   Destroying  any  tank  on  a  team destroys every
                             player on that team.

              JJuummppiinngg ((JJPP))   Allows the tank to jump.  You cannot steer  while
                             in the air.

              IIddeennttiiffyy ((IIDD))  Displays  the identity of the closest flag in the
                             vicinity.

       A brief description of each bad  superflag  with  the  flag's  code  in
       parentheses:

              CCoolloorrbblliinnddnneessss ((CCBB))
                             Prevents  tank  from  seeing any team information
                             about other tanks.  You have  to  be  careful  to
                             avoid shooting teammates.

              OObbeessiittyy ((OO))    The  tank  becomes  very  large  and easy to hit.
                             It's so big  that  it  can't  fit  through  tele-
                             porters.

              LLeefftt TTuurrnn OOnnllyy ((<<--))
                             Prevents the tank from turning right.

              RRiigghhtt TTuurrnn OOnnllyy ((-->>))
                             Prevents the tank from turning left.

              MMoommeennttuumm ((MM))   Gives the tank a lot of inertia.

              BBlliinnddnneessss ((BB))  Blanks  the out-the-window view.  The radar still
                             works.  It is effectively  impossible  to  detect
                             any  tank  with Stealth;  shooting a Stealth with
                             Blindness is the stuff legends are made of.

              JJaammmmiinngg ((JJMM))   Disables the radar but you can still see.

              WWiiddee AAnnggllee ((WWAA))
                             Gives the tank a fish eye lens that's rather dis-
                             orienting.

   OObbsseerrvviinngg
       If  a  server  is  full  or  if you just want to watch a battle without
       interfering in it, you can use the observer mode. To join a  server  as
       an  observer,  use  _@ as the first letter of your callsign. The maximum
       number of observers can be restricted by the server admin, so you might
       still not be able to join a full server.

       When  in  observer mode, you can freely roam the world. Using the arrow
       keys you can rotate the camera in every direction.  Holding  shift  and
       usign  the  arrow  keys  moves the camera left, right, forward or back.
       Pressing the up or down arrow while holding the the _A_L_T key will change
       the  camera's  altitude.  The _F_9 and _F_1_0 keys change the camera's focal
       lengths, giving a zoom effect. The _F_1_1 key will reset the zoom.

       Repeatedly pressing _F_8 cycles through different  roaming  modes:  _f_r_e_e,
       _t_r_a_c_k_i_n_g,  _f_o_l_l_o_w_i_n_g,  _f_i_r_s_t _p_e_r_s_o_n and _t_r_a_c_k_i_n_g _t_e_a_m _f_l_a_g. The default
       is _f_r_e_e mode where you can move your camera around. In  _t_r_a_c_k_i_n_g  mode,
       the  camera  will  automatically  look at a tank. You can cycle through
       available tanks with the _F_6 and _F_7 keys. In _f_o_l_l_o_w mode, the camera  is
       positioned  right  behind  the targeted tank, whereas you actually look
       from within the tank when using _f_i_r_s_t _p_e_r_s_o_n mode. The last mode, _t_r_a_c_k
       _t_e_a_m  _f_l_a_g  is  only available in capture-the-flag games and will track
       the team flags. Again, use _F_6 and _F_7 to choose which flag to track.

FFIILLEESS
              $(HOME)/.bzflag
                             Stores options between game sessions.  Used  when
                             HOST is not defined.

              $(HOME)/.bzflag.$(HOST)
                             Stores  options between game sessions.  Used when
                             HOST is defined.

SSEEEE AALLSSOO
       bzfls(6), bzfs(6)



                                                                     bzflag(6)
