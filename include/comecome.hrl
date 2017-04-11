-define(CONNECT_TIMEOUT, 2000).
-define(PLAYER, 1).

-record(player, {
  type = ?PLAYER,
  pos = {0, 0},
  direction
}).

-record(tab_player_info, {
  pid,
  identity,
  nick,
  photo,
  points = 0,
  ghosts = []
}).
