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
  initRoom/2,
  removeRoom/1,
  roomReady/1,
  joinRoom/2,
  leaveRoom/2,
  setMaxPlayers/2,
  getMaxPlayers/1,
  checkRoomAvailable/1,
  getPlayers/1,
  getPlayersCount/1
]).

-export([
  getRoomList/0,
  getAvailableRoomList/0
]).

%% Apply Functions
-export([
  join_room/2,
  leave_room/2,
  remove_room/1,
  players_count/1,
  players_in_room/1
]).

initRoom(RoomId) -> base_lib_room:initRoom(RoomId).
initRoom(RoomId,MaxPlayers) -> base_lib_room:initRoom(RoomId,MaxPlayers).
removeRoom(RoomId) -> base_lib_room:removeRoom(RoomId).
roomReady(RoomId) -> base_lib_room:roomReady(RoomId).
joinRoom(RoomId,PlayerId)-> base_lib_room:joinRoom(RoomId,PlayerId).
leaveRoom(RoomId,PlayerId)-> base_lib_room:leaveRoom(RoomId,PlayerId).
setMaxPlayers(RoomId,Max)-> base_lib_room:setMaxPlayers(RoomId,Max).
getPlayersCount(RoomId)-> base_lib_room:getPlayersCount(RoomId).
getMaxPlayers(RoomId)-> base_lib_room:getMaxPlayers(RoomId).
checkRoomAvailable(RoomId)-> base_lib_room:checkRoomAvailable(RoomId).
getPlayers(RoomId)-> base_lib_room:getPlayers(RoomId).
%% ------------------------------------------------------------------
getRoomList()-> base_lib_room:getRoomList().
getAvailableRoomList()-> base_lib_room:getAvailableRoomList().
%% ------------------------------------------------------------------
%% Apply Functions
%% ------------------------------------------------------------------
join_room(State,RoleId) -> base_lib_room:join_room(State,RoleId).
remove_room(State) -> base_lib_room:remove_room(State).
leave_room(State,RoleId) -> base_lib_room:leave_room(State,RoleId).
players_in_room(State) -> base_lib_room:players_in_room(State).
players_count(State) -> base_lib_room:players_count(State).


