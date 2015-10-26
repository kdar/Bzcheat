bzfrelay(6)                                                        bzfrelay(6)



NNAAMMEE
       bzfrelay - BZFlag game server firewall relay

SSYYNNOOPPSSIISS
       bbzzffrreellaayy  [--aa  _a_d_d_r_e_s_s _m_a_s_k] [--dd] [--ff] [--hh] [--pp _p_o_r_t] [--rr _a_d_d_r_e_s_s _m_a_s_k]
       [--ss [[_a_d_d_r_e_s_s][:_p_o_r_t]] _a_d_d_r_e_s_s[:_p_o_r_t]

DDEESSCCRRIIPPTTIIOONN
       BBzzffrreellaayy relays communication between bzflag and  bzfs.   It's  primary
       purpose is to provide a tunnel to bzfs through a firewall.

       Because security is a prime concern on a firewall, users are encouraged
       to read the source code and run it with restricted  permissions.   Also
       bzfrelay  rejects  connections  from any clients not explicitly allowed
       and the default is to reject all connections; you must use the  options
       to allow some connections for bzfrelay to be useful.

       In  the  interests  of  security  (and  because there's no need for it)
       bzfrelay provides no means to escape to  a  shell,  start  executables,
       access the filesystem, report system resources, etc.

   OOppttiioonnss
              --aa _a_d_d_r_e_s_s _m_a_s_k
                             Allow  addresses  matching  _a_d_d_r_e_s_s and _m_a_s_k.  An
                             address _s_r_c matches iff (_s_r_c & _m_a_s_k) ==  (_a_d_d_r_e_s_s
                             &  _m_a_s_k).   This  option may appear any number of
                             times.

              --dd             Increase debugging level.   This  option  may  be
                             specified multiple times to increase logging.

              --ff             Run in the foreground and log to stderr.  Default
                             is to detach from the terminal and log to syslog.

              --hh             Print help information and exit.  The help infor-
                             mation includes the default connect and reconnect
                             ports.

              --pp _p_o_r_t        Listen  for  reconnections on _p_o_r_t instead of the
                             default.  The BZFlag protocol is broken  in  that
                             it requires clients to connect to the server, get
                             a port to reconnect to, disconnect, and reconnect
                             on  the  new  port  (there's  no  reason for this
                             except  backward  compatibility).   This   option
                             overrides  the  default  reconnect  port  number.
                             Packet filters on the firewall must be configured
                             to  allow  TCP  packets  to  and  from this port;
                             clients will be initiating the  connection.   Use
                             --hh to get the default reconnection port number.

              --rr _a_d_d_r_e_s_s _m_a_s_k
                             Reject  addresses  matching _a_d_d_r_e_s_s and _m_a_s_k.  An
                             address _s_r_c matches iff (_s_r_c & _m_a_s_k) ==  (_a_d_d_r_e_s_s
                             &  _m_a_s_k).   This  option may appear any number of
                             times.

              --ss [[_a_d_d_r_e_s_s][:_p_o_r_t]
                             Listen for connections on _p_o_r_t at  _a_d_d_r_e_s_s.   The
                             default  is  to use the standard bzfs port and to
                             listen on all interfaces.  Either _a_d_d_r_e_s_s or _p_o_r_t
                             can be omitted, but not both; the default is used
                             for the omit argument.   Packet  filters  on  the
                             firewall  must be configured to allow TCP packets
                             to and from this port and address;  clients  will
                             be  initiating the connection.  Use --hh to get the
                             default connection port number.

              _a_d_d_r_e_s_s[:_p_o_r_t] Relay packets to the bzfs server on port _p_o_r_t  at
                             _a_d_d_r_e_s_s.  If _p_o_r_t is not specified then the stan-
                             dard bzfs port is used.  Packet  filters  on  the
                             firewall  must  be configured to allow packets to
                             and from this address and  port,  but  note  that
                             bzfrelay  will  be  initiating  these TCP connec-
                             tions.  This argument is required.

   NNootteess
       Addresses are matched against --aa and  --rr  options  in  the  order  they
       appear  on  the  command  line.   An  address is accepted as soon as it
       matches an --aa set and rejected as soon as it matches an --rr set, so  you
       must  list more specific sets before more general sets.  An address not
       matching any set is rejected.

   EExxaammpplleess
       To allow clients from any  host  in  the  192.0.2  net  only  use:  "-a
       192.0.2.0 255.255.255.0".

       To  allow clients from any host except those in the 192.0.2 subnet use:
       "-r 192.0.2.0 255.255.255.0 -a 0.0.0.0 0.0.0.0".  To  also  allow  host
       192.0.2.1 use: "-a 192.0.2.1 255.255.255.255 -r 192.0.2.0 255.255.255.0
       -a 0.0.0.0 0.0.0.0".

       To allow clients from any host use: "-a 0.0.0.0 0.0.0.0".  This is  not
       recommended.

BBUUGGSS
       Bzfrelay uses IP addresses for authentication and is therefore vulnera-
       ble to address spoofing attacks.

SSEEEE AALLSSOO
       bzfs(6)



                                                                   bzfrelay(6)
