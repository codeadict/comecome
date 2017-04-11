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

update_pos({X, Y}, Dir) ->
  case Dir of
    left  -> {X, Y-1};
    up    -> {X-1, Y};
    right -> {X, Y+1};
    down  -> {X+1, Y}
  end.
