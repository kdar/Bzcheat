bzfs(6)                                                                bzfs(6)



NNAAMMEE
       bzfs - BZFlag game server

SSYYNNOOPPSSIISS
       bbzzffss  [--aa _v_e_l_o_c_i_t_y _r_o_t_a_t_i_o_n] [--aaddmmssgg _m_e_s_s_a_g_e] [--bb] [--bbaann _a_d_d_r_e_s_s[,...]]
       [--cc] [--ccrr] [++ff  {_g_o_o_d|_f_l_a_g_-_i_d}]  [--ff  {_b_a_d|_f_l_a_g_-_i_d}]  [--ffbb]  [--gg]  [--hh]
       [--hheellpp]  [--ii  _i_n_t_e_r_f_a_c_e]  [--jj] [--llaaggddrroopp _w_a_r_n_-_c_o_u_n_t] [--llaaggwwaarrnn _t_i_m_e_/_m_s]
       [--mmaaxxiiddllee _t_i_m_e_/_s] [--mmoo _o_b_s_e_r_v_e_r_-_c_o_u_n_t] [--mmpp  {_c_o_u_n_t|[_r_o_g_u_e_-_c_o_u_n_t],,[_r_e_d_-
       _c_o_u_n_t],,[_g_r_e_e_n_-_c_o_u_n_t],,[_b_l_u_e_-_c_o_u_n_t],,[_p_u_r_p_l_e_-_c_o_u_n_t]}]  [--mmppss  {_m_a_x_-_s_c_o_r_e}]
       [--mmss _s_h_o_t_s] [--mmttss {_m_a_x_-_s_c_o_r_e}] [--nnoouuddpp] [--pp  _p_o_r_t]  [--ppaasssswwdd  _p_a_s_s_w_o_r_d]
       [--pprr  _p_o_r_t] [--ppuubblliicc _d_e_s_c_r_i_p_t_i_o_n] [--ppuubblliiccaaddddrr _a_d_d_r_e_s_s[_:_p_o_r_t]] [--ppuubbllii--
       cclliisstt _u_r_l] [--qq] [++rr] [--rr] [--rreeqquuiirreeuuddpp] [++ss _f_l_a_g_-_c_o_u_n_t] [--ss _f_l_a_g_-_c_o_u_n_t]
       [--ssaa]  [--ssrrvvmmssgg _m_e_s_s_a_g_e] [--sstt _t_i_m_e] [--ssww _c_o_u_n_t] [--ssyynnccttiimmee] [--tt] [--ttiimmee
       _t_i_m_e_-_l_i_m_i_t] [--ttttll _t_t_l] [--vveerrssiioonn] [--wwoorrlldd _w_o_r_l_d_-_f_i_l_e]

DDEESSCCRRIIPPTTIIOONN
       BBzzffss is the server for BBZZFFllaagg, and it must be running to play.  It  can
       be run on any system on the network (including a player's system or one
       without graphics).  Terminating  the  server  terminates  the  game  in
       progress.

   OOppttiioonnss
              --aa _v_e_l_o_c_i_t_y _r_o_t_a_t_i_o_n
                             Enables  inertia  and sets the maximum linear and
                             angular accelerations.  The  units  are  somewhat
                             arbitrary  so  you'll  have to experiment to find
                             suitable values.  The values must be non-negative
                             and higher values yield greater inertia.

              --aaddmmssgg _m_e_s_s_a_g_e Define  a  message which will be broadcast to all
                             players every 15 minutes.

              --bb             When --cc is supplied, this option randomly rotates
                             the buildings.

              --bbaann _a_d_d_r_e_s_s[,...]
                             Prohibits  connections from the listed addresses.
                             Trailing 255 bytes are treated as mask bytes.

              --cc             Enables  the  capture-the-flag  style  game.   By
                             default, the free-for-all style is used.

              --ccrr            Enables the capture-the-flag style game with ran-
                             dom map.  By default, the free-for-all  style  is
                             used.

              ++ff {_g_o_o_d|_f_l_a_g_-_i_d}
                             Forces the existence of the given flag.  If spec-
                             ified multiple times for the same  _f_l_a_g_-_i_d,  then
                             that  many  flags will appear.  The _g_o_o_d argument
                             is equivalent to specifying ++ff once for each kind
                             of good flag.

              --ff {_b_a_d|_f_l_a_g_-_i_d}
                             Disallows   random   flags  of  the  given  type.
                             Required flags given by the ++ff option  are  still
                             provided.   The  _b_a_d  argument  is  equivalent to
                             specifying --ff once for each kind of bad flag.

              --ffbb            Allow flags on box buildings.

              --gg             Quit after serving one game.

              --hh             Buildings are given random heights.

              --hheellpp          Shows a help page and lists all  the  valid  flag
                             id's.

              --ii _i_n_t_e_r_f_a_c_e   Server  will  listen for and respond to ``pings''
                             (sent via multicast) on the given interface.  The
                             server uses the first multicast enabled interface
                             by default.  Clients  use  this  to  find  active
                             servers   on   the  network.  This  is  also  the
                             TCP/UDP/IP address the server will listen on.

              --jj             Allows jumping.

              --llaaggddrroopp _w_a_r_n_-_c_o_u_n_t
                             Kicks players after _w_a_r_n_-_c_o_u_n_t lag warnings.

              --llaaggwwaarrnn _t_i_m_e_/_m_s
                             Send warnings to players that lag more than _t_i_m_e.

              --mmaaxxiiddllee _t_i_m_e_/_s
                             Kick  players  that did not play longer than time
                             seconds. Pausing players are  not  kicked.  If  a
                             player uttered a word recently, he will be kicked
                             after thrice the given time.

              --mmoo _o_b_s_e_r_v_e_r_-_c_o_u_n_t
                             Sets the maximum number of observers. If not set,
                             no observers are allowed.

              --mmpp {_c_o_u_n_t|[_r_o_g_u_e],,[_r_e_d],,[_g_r_e_e_n],,[_b_l_u_e],,[_p_u_r_p_l_e]}
                             Sets  the maximum number of players, total or per
                             team.  A single value sets the  total  number  of
                             players allowed.  Five comma separated values set
                             the maximum for each team.  If a  count  is  left
                             blank  then no limit is set for that team, except
                             for the limit on the  total  number  of  players.
                             Boths forms may be provided.

              --mmppss _m_a_x_-_s_c_o_r_e Sets a maximum score for individual players.  The
                             first player to reach this score is declared  the
                             winner and the game is over.

              --mmss _s_h_o_t_s      Allows  up  to  _s_h_o_t_s simultaneous shots for each
                             player.  This is 1 by default.

              --mmttss _m_a_x_-_s_c_o_r_e Sets a maximum score for teams.  The  first  team
                             to  reach  this  score is declared the winner and
                             the game is over.

              --nnoouuddpp         Do not use a parallel UDP channel for player com-
                             munication.

              --pp _p_o_r_t        Listen  for  game  connections on _p_o_r_t instead of
                             the default port.  Use --hheellpp to print the default
                             port.

              --ppaasssswwdd _p_a_s_s_w_o_r_d
                             Specify  a  server administrator password for use
                             in remote administration such as /kick  messages.

              --pprr _p_o_r_t       Listen for reconnects on _p_o_r_t. The current bzflag
                             protocol  is  a  little  braindead  in  that   it
                             requires  clients  to  reconnect  to another port
                             after having registered on the  main  port.  Both
                             this  and the main port must be open for incoming
                             TCP connections.

              --ppuubblliicc _d_e_s_c_r_i_p_t_i_o_n
                             Advertise this server on the  internet  with  the
                             given  _d_e_s_c_r_i_p_t_i_o_n.   By  default,  a server will
                             respond to broadcast or multicast queries, allow-
                             ing  clients  to find servers on the local subnet
                             or accessible through  multicast  routers.   How-
                             ever,  this doesn't allow clients to find servers
                             not accessible via multicast.  The --ppuubblliicc option
                             causes the server to register itself with a bbzzffllss
                             server, which clients can query to get a list  of
                             bbzzffss servers.

              --ppuubblliiccaaddddrr _a_d_d_r_e_s_s[:_p_o_r_t]
                             Advertise  this server with the given _a_d_d_r_e_s_s and
                             _p_o_r_t.  Only has an effect when used with --ppuubblliicc.
                             Normally  a server advertises itself at the local
                             address and port.  Some servers are not  accessi-
                             ble  from the internet at this address (for exam-
                             ple servers behind a  firewall  using  bbzzffrreellaayy).
                             Use  this  option  to  specify the address and/or
                             port that internet users  should  use  to  access
                             this server.

              --ppuubblliicclliisstt _u_r_l
                             Advertise this server on the bbzzffllss servers listed
                             at _u_r_l.  Only has an effect when used with  --ppuubb--
                             lliicc.   A  built-in  url  is used by default.  The
                             BBZZFFllaagg clients use the same built-in url  so,  by
                             default, clients will see public servers automat-
                             ically.  See bbzzffllss for a description of the  for-
                             mat of _u_r_l.

              --qq             If  specified, the server will not listen for nor
                             respond to ``pings''.   BBZZFFllaagg  sends  out  these
                             pings  to  give  the  user  a  list  of available
                             servers.  This effectively makes the server  pri-
                             vate, especially if the --pp option is also used.

              ++rr             Makes  most shots ricochet.  Super bullets, shock
                             waves, and guided missiles do not.

              --rr             Allows rogues to join the game.  By  default,  no
                             rogue players are allowed.

              --rreeqquuiirreeuuddpp    Require  clients  to use parallel UDP. If players
                             fire before opening a UDP channel, kick them  off
                             the server.

              ++ss _n_u_m_-_f_l_a_g_s   The  server  will  have an extra _n_u_m_-_f_l_a_g_s random
                             super flags  available  at  all  times.   The  --ff
                             option  can  be  used  to restrict which types of
                             flags will be added.  Required flags given by the
                             ++ff  option  are  not  included  in  the _n_u_m_-_f_l_a_g_s
                             total.

              --ss _n_u_m_-_f_l_a_g_s   The server will have up to _n_u_m_-_f_l_a_g_s random super
                             flags  available  at any time.  The --ff option can
                             be used to restrict which types of flags will  be
                             added.  Required flags given by the ++ff option are
                             not included in the _n_u_m_-_f_l_a_g_s total.

              --ssaa            Antidote flags are provided for players with  bad
                             flags.

              --ssrrvvmmssgg _m_e_s_s_a_g_e
                             Define a server welcome message.

              --sstt _t_i_m_e       Bad  flags  are  automatically dropped after _t_i_m_e
                             seconds.

              --ssww _c_o_u_n_t      Bad flags are automatically dropped  after  _c_o_u_n_t
                             wins.   Capturing a team flag does not count as a
                             win.

              --ssyynnccttiimmee      Forces all clients to use the same time  of  day.
                             The  current  time  is determined by the server's
                             clock.  This disables the + and  -  keys  on  the
                             clients.

              --tt             Adds teleporters to the game.

              --ttiimmee _t_i_m_e_-_l_i_m_i_t
                             Sets a time limit on the game to _t_i_m_e_-_l_i_m_i_t.  The
                             game will be stopped _t_i_m_e_-_l_i_m_i_t seconds after the
                             first player connects.

              --ttttll _t_i_m_e_-_t_o_-_l_i_v_e
                             Sets  the maximum number of hops a ``ping'' reply
                             will take.  This effectively limits the range  of
                             the  server  in  the  network.  Clients more than
                             _t_i_m_e_-_t_o_-_l_i_v_e hops away will not receive notifica-
                             tion of the server's existence.

              --vveerrssiioonn       Prints the version number of the executable.

              --wwoorrlldd _w_o_r_l_d_-_f_i_l_e
                             Reads a specific world layout for the game map.

   NNootteess
       The  server  uses nearly zero CPU time when nobody is playing, and even
       during a game the server uses very little CPU, so it's not a burden  on
       the  system  to  leave one running and it won't interfere with a player
       using the same system (except on Windows 95, which _r_e_a_l_l_y sucks at mul-
       titasking).   The  server  will continue to run until terminated.  If a
       game is in progress when the server goes  down,  all  players  will  be
       kicked  off  and  the game will be aborted without warning.  The server
       resets itself when all players have quit.  All  players  must  quit  to
       reset  the  server  when  a  game  is  over (because of a score or time
       limit).

       The following game styles are recommended starting points.

              --cc [--bb]        Basic capture-the-flag game.  It teaches teamwork
                             and dogfighting skills.

              --rr --ss --tt       Free-for-all  with  superflags  and  teleporters.
                             Rogues are allowed.  Teaches players how  to  use
                             superflags  and  teleporters  for maximum effect.
                             You may want to allow players to drop  bad  flags
                             with any of -sa, -st, and -sw.

       Notice  that the maximum number of shots for these styles is one.  Hav-
       ing only one shot greatly increases  playability  and  learning  speed.
       Multiple  shots decrease the required skill level and make it virtually
       impossible for even a skilled player to  avoid  getting  shot  for  any
       length of time.  More experienced players will still dominate the game,
       but beginners will have an easier time making kills.

   NNeettwwoorrkkiinngg
       Communication between the server and clients  (i.e.  between  bbzzffss  and
       bbzzffllaagg)  during  a  game  is  via TCP.  Use the --hheellpp option to get the
       server's default port.  If there's a firewall between  the  server  and
       client,  the  firewall  must accept connections from the client to this
       port and forward them to the server.  See bbzzffrreellaayy for a  BZFlag  fire-
       wall relay.

       Clients  can  search for servers by sending and receiving multicast UDP
       packets.  For a client to discover a server, there must be a  multicast
       route  between them with fewer hops than the default TTL (time-to-live)
       which is 8 or whatever the TTL was set to  using  the  --ttttll  option  to
       bbzzffllaagg.   However,  a  client  can still connect to a server beyond the
       multicast TTL.  Clients can also find servers advertised using  _-_p_u_b_l_i_c
       by querying bbzzffllss servers.

       Game  information  is  relayed  through  the server. Some communication
       between clients, such as position and orientation information, is  nor-
       mally  sent  via UDP packets.  Other data, like flag grab and kill mes-
       sages, are sent to the server via TCP. The setver then turns around and
       broadcasts these packets  to all players. Since being in a game implies
       connection to the server, all players are guaranteed to  get  all  mes-
       sages  sent  via  TCP.  But the multicast UDP packets may be discarded.
       If other players can see your tank in the game but it never appears  to
       move and shots go through it, chances are high that your UDP connection
       is not working. Try using TCP only on servers that allow it.


GGEENNEERRAALL SSEERRVVEERR CCOOMMMMAANNDDSS
       //llaaggssttaattss
              Lists network delays by player. Example:
              MrApathyCream 335ms (5)
              Gerbol 210ms (8)
              captain_macgyver 155ms (12)


       //ffllaagghhiissttoorryy
              Lists what flags players have grabbed in the past. Example:
              MrApathyCream: (<-) (->) (O) (CB) (M) (B) (JM) (WA)
              Gerbol: (L) (GM) (L) (GM) (CL) (ST) (GM) (L)
              captain_macgyver: (SB) (SW)


       //ppaasssswwoorrdd {{ppaasssswwoorrdd}}
              Attempt to gain administrator status Example:
              /password supersecretpassword
              You are now an administrator!


SSEERRVVEERR AADDMMIINNIISSTTRRAATTIIVVEE CCOOMMMMAANNDDSS
       //sshhuuttddoowwnnsseerrvveerr
              Stop serving BZFlag on this server

       //ssuuppeerrkkiillll
              Kick all players off the server

       //ggaammeeoovveerr
              Ends the current game

       //ffllaagg rreesseett
              Removes flags from all players

       //ffllaagg uupp
              Removes all flags from the game

       //ffllaagg sshhooww
              Shows all flags with information Example:
              0: p:-1 r:1 g:1 1:V s:1 p:159.1x43.2x0.0
              1: p:2 r:1 g:1 1:SW s:1 p:209.1x143.2x10.0
              2: p:-1 r:1 g:3 1:L s:1 p:-29.1x301.2x0.0


       //kkiicckk {{ppllaayyeerrNNaammee}}
              Kick a named player off the server.Example:
              /kick Gerbol
              You were kicked off the server by MrApathyCream


       //ppllaayyeerrlliisstt
              List player names and IP addresses. Example:
              /playerlist
              [0]MrApathyCream: 35.23.65.44:4808 udp id
              [1]Gerbol: 130.123.1.55:4909 udp id
              [2]captain_macgyver: 15.32.122.51:3201 udp id


       //bbaann {{iippLLiisstt}} {{mmiinnss}}

              Ban players using the specified IPs for certain length of time from using this server. Example:
              /ban 35.23.43.66 2
              bans player with specific ip for 2 minutes
              /ban 35.23.*.*,47.23.17.*
              bans all ips in this range forever


       //bbaannlliisstt
              List all of the IPs currently banned from this server. Example:
              /banlist
              IP Ban List
              ------------
              35.23.43.66
              47.23.17.*


       //ccoouunnttddoowwnn
              Starts the countdown sequence for a timed game. Example:

              /countdown


       //llaaggwwaarrnn

              Dynamic change the maximum allowed lag time. Example:

              /lagwarn 300


SSEEEE AALLSSOO
       bzflag(6), bzfls(6), bzfrelay(6), mrouted(1)



                                                                       bzfs(6)
