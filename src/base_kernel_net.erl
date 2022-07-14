-module (base_kernel_net).

-export([decode/2, encode/2]).
-export([decode/3, encode/3]).

-export([
	decode_int8/1
	,decode_int16/1
	,decode_int32/1
	,decode_int64/1
	,decode_string/1
	,decode_list/2
]).

-export([
	encode_int8/2
	,encode_int16/2
	,encode_int32/2
	,encode_int64/2
	,encode_string/2
	,encode_list/3
]).

-export([
	pack/2, pack/3
]).

-export([
	handle_decode/1
]).

-export([
	websocket_init/2,
	websocket_handle/2,
	websocket_info/2,
	terminate/3,
	get_sock_crash_num/0,
	stop_listening/0
]).
-export ([
	send/2,
	disconnect/1
]).
%% ---------------------------------------------------------
decode_int8(Bin) ->	base_net_encoder:decode_int8(Bin).
decode_int16(Bin) ->	base_net_encoder:decode_int16(Bin).
decode_int32(Bin) ->	base_net_encoder:decode_int32(Bin).
decode_int64(Bin) ->	base_net_encoder:decode_int64(Bin).
decode_string(Bin) ->	base_net_encoder:decode_string(Bin).
decode(Cmd, Bin) ->	base_net_encoder:decode(Cmd, Bin,protocol).
decode(Cmd, Bin,ModuleDecode) ->	base_net_encoder:decode(Cmd, Bin,ModuleDecode).
decode_list(F, Bin) ->	base_net_encoder:decode_list(F, Bin).
%% ---------------------------------------------------------
encode_int8(Val, Bin) ->	base_net_encoder:encode_int8(Val, Bin).
encode_int16(Val, Bin) ->	base_net_encoder:encode_int16(Val, Bin).
encode_int32(Val, Bin) ->	base_net_encoder:encode_int32(Val, Bin).
encode_int64(Val, Bin) ->	base_net_encoder:encode_int64(Val, Bin).
encode_string(S, Bin) ->	base_net_encoder:encode_string(S, Bin).
encode(Cmd, List) ->	base_net_encoder:encode(Cmd, List,protocol).
encode(Cmd, List,ModuleEncode) ->	base_net_encoder:encode(Cmd, List,ModuleEncode).
encode_list(F, List, Bin) ->	base_net_encoder:encode_list(F, List, Bin).

%% ---------------------------------------------------------
pack(Cmd, Data) ->	base_net_encoder:pack(Cmd, Data, 0).
pack(Cmd, Data, _Zip) ->	base_net_encoder:pack(Cmd, Data, _Zip).
%% ---------------------------------------------------------
handle_decode(Bin) ->	base_net_encoder:handle_decode(Bin).
%% ---------------------------------------------------------
websocket_init(Req,State) ->
	base_socket_handle:init(Req,State).

websocket_handle({binary, Bin}, #{bin :=OldBin}) ->
	base_socket_handle:websocket_handle({binary, Bin,protocol},#{bin=>OldBin});
websocket_handle({binary, Bin, ModuleEncoder}, #{bin :=OldBin}) ->
	base_socket_handle:websocket_handle({binary, Bin,ModuleEncoder},#{bin=>OldBin}).

websocket_info(Info,State) -> base_socket_handle:websocket_info(Info,State).
terminate(Reason,Req,State) -> base_socket_handle:terminate(Reason,Req,State).
get_sock_crash_num() -> base_socket_handle:get_sock_crash_num().

%% ---------------------------------------------------------
send(SocketPid,BinaryData) ->
	base_socket_handle:send(SocketPid,BinaryData).
disconnect(SocketPid) ->
	base_socket_handle:disconnect(SocketPid).
%% ---------------------------------------------------------
stop_listening() ->
	cowboy:stop_listener(http),
	cowboy:stop_listener(https).