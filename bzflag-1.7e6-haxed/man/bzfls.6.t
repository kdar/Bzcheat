bzfls(6)                                                              bzfls(6)



NNAAMMEE
       bzfls - BZFlag game server-list server

SSYYNNOOPPSSIISS
       bbzzffllss [--dd] [--hheellpp] [--pp _p_o_r_t] [--vveerrssiioonn] [_b_o_o_t_s_t_r_a_p_-_l_i_s_t]

DDEESSCCRRIIPPTTIIOONN
       BBzzffllss  keeps  a list of bbzzffss servers.  It's used to help BBZZFFllaagg clients
       find available servers on the internet.

   OOppttiioonnss
              --dd             Increases the debugging level.   The  option  may
                             appear  multiple  times to increase the amount of
                             debugging information printed.  It should not  be
                             used in normal circumstances.

              --hheellpp          Print  the  version  and  usage  information then
                             exit.

              --pp _p_o_r_t        Listen  for  requests  on  _p_o_r_t  instead  of  the
                             default port.

              --vveerrssiioonn       Print version information and exit.

              _b_o_o_t_s_t_r_a_p_-_l_i_s_t Initialize  the  server  list  with  the  servers
                             listed in the file _b_o_o_t_s_t_r_a_p_-_l_i_s_t.  This is  nor-
                             mally  used  when  restarting the server to avoid
                             having to wait for servers to register themselves
                             again.

   NNootteess
       Public  bbzzffss servers (i.e. those that used the _-_p_u_b_l_i_c option) register
       themselves with bbzzffllss servers at regular  intervals  and  update  their
       information,  such  as  the  number  of current players, as it changes.
       BBZZFFllaagg clients query the bbzzffllss servers to provide the user  a  list  of
       available  servers.   Working  together these programs provide users an
       easy way to find games.

       Game servers (bbzzffss) will also unregister  themselves  when  they  exit.
       However, since it's possible for the servers to be unable to unregister
       themselves, bzfls will drop servers that it hasn't heard from in a cer-
       tain  amount  of time.  Normally bzfs will send updates more often than
       this, even if nothing has changed.  If bzfls is stopped and  restarted,
       the  listed  bzfs  servers will not know this and they won't show up on
       the list until they send an update.

       Both clients and servers use a built-in url to find  a  list  of  bbzzffllss
       servers  (see URLs below).  This url is maintained by the BZFlag author
       and lists a number of bbzzffllss servers.  Only these servers  are  required
       for  game clients and servers to provide automatic server finding.  You
       do not need to run your own bzfls under normal circumstances.

       If you want a private list of servers then you can run  bzfls  but  you
       must also get clients and servers to use it.  BZFlag uses the --lliisstt _u_r_l
       option to specify an alternate bzfls  server.   Bzfs  uses  --ppuubblliicclliisstt
       _u_r_l.  See URLs below for a description of the url format.

   UURRLLss
       The  BZFlag  family  understands URLs with the standard syntax but sup-
       ports a non-standard set of protocols.

              hhttttpp::////_h_o_s_t_n_a_m_e[:_p_o_r_t][_p_a_t_h]

              ffiillee::_p_a_t_h

              bbzzfflliisstt::////_h_o_s_t_n_a_m_e[:_p_o_r_t]

       The hhttttpp protocol is the standard HTTP protocol but only  a  subset  of
       responses are understood.  The reply must either be 200 (okay) with one
       or more URLs in the above form, one per line;  or a 302 (object  moved)
       with the new http URL.

       The  ffiillee protocol names a file on the system that contains one or more
       URLs in the above form, one per line.

       The bbzzfflliisstt protocol names a bbzzffllss server and an optional port.  Unlike
       the other protocols, this type of URL does not list more URLs.  Instead
       it points to an actual bzfls server.

       Note that the http and file protocols can  be  used  to  list  multiple
       bzfls  servers.  The built-in url does this;  each bzfls server acts as
       a backup for the others.  Any number of URLs may be given, but  only  a
       certain  number  of bzflist URLs will be used (the exact number is com-
       piled into bzflag and bzfs).

   PPrroottooccooll
       The bzfls protcol is very simple, with just 5 messages.  See the source
       code  for  details.   One  message  worth  noting here is GGEETT.  You can
       request the server list from a bzfls server using a protocol similar to
       HTTP.   Sending  a  message  with  the  first line of the form "GET _u_r_l
       HTTP/_*", where the * stands for  any  sequence  of  characters,  causes
       bzfls  to send an HTTP reply with the server list.  The GET line may be
       followed by any number of lines;  they are ignored.  Most web  browsers
       can  successfully  query the server list;  just change bzflist in a URL
       to http.  Note that the url in the GET line is ignored.

   SSiiggnnaallss
       BBzzffllss handles the following signals:

              SSIIGGUUSSRR11        Causes bzfls to write the current server list  to
                             /tmp/bzfls.lst.  This list can be used as a boot-
                             strap file.

              SSIIGGUUSSRR22        Causes  bzfls  to  write  network  statistics  to
                             /tmp/bzfls.cnt.

FFIILLEESS
              /tmp/bzfls.cnt The network statistics dumped by SIGUSR2.

              /tmp/bzfls.lst The server list dumped by SIGUSR1.

SSEEEE AALLSSOO
       bzflag(6), bzfs(6)



                                                                      bzfls(6)
