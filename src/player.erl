%%%-------------------------------------------------------------------
%%% @author codeadict
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Apr 2017 11:15 PM
%%%-------------------------------------------------------------------
-module(player).
-author("codeadict").
-include_lib("../include/comecome.hrl").

-behaviour(gen_server).

%% API
-export([start/1]).

-export([init/1,
  handle_call/3,
  handle_cast/2,
  handle_info/2,
  terminate/2,
  code_change/3]).

start(Sock) ->
  {ok, Pid} = gen_server:start(?MODULE, [Sock], []),
  gen_tcp:controlling_process(Sock, Pid),
  inet:setopts(Sock, [{active, once}]),
  lager:info("~p Started game worker~n", [Pid]),
  {ok, Pid}.

init([_Sock]) ->
  State = #player{},
  {ok, State}.

handle_call(state, _From, State) ->
  {reply, State, State};

handle_call(_Request, _From, State) ->
  {noreply, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(Info, State) ->
  lager:info("~p Received info: ~p~n", [self(), Info]),
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.
code_change(_OldVsn, State, _Extra) ->
  {ok, State}.