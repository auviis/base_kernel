%%%-------------------------------------------------------------------
%%% @author nhnhat
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Jul 2022 22:19
%%%-------------------------------------------------------------------
-module(base_kernel_game).
-author("nhnhat").
%% API
-export([
  initRoom/1,
  roomReady/1,
  joinRoom/2,
  leaveRoom/2,
  getPlayers/1,
  getPlayersCount/1
]).

%% Apply Functions
-export([
  join_room/2,
  leave_room/2,
  players_count/1,
  players_in_room/1
]).

initRoom(RoomId) -> base_lib_room:initRoom(RoomId).

roomReady(RoomId) -> base_lib_room:roomReady(RoomId).
joinRoom(RoomId,PlayerId)-> base_lib_room:joinRoom(RoomId,PlayerId).
leaveRoom(RoomId,PlayerId)-> base_lib_room:leaveRoom(RoomId,PlayerId).
getPlayersCount(RoomId)-> base_lib_room:getPlayersCount(RoomId).
getPlayers(RoomId)-> base_lib_room:getPlayers(RoomId).

%% ------------------------------------------------------------------
%% Apply Functions
%% ------------------------------------------------------------------
join_room(State,RoleId) -> base_lib_room:join_room(State,RoleId).
leave_room(State,RoleId) -> base_lib_room:leave_room(State,RoleId).
players_in_room(State) -> base_lib_room:players_in_room(State).
players_count(State) -> base_lib_room:players_count(State).


