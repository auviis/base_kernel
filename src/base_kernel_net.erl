-module (base_kernel_net).
%% ---------------------------------------------------------
%% ------------------------WEB SOCKET ----------------------
%% ---------------------------------------------------------
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
%% ------------------------REST API   ----------------------
%% ---------------------------------------------------------
-export([
	rest_init/2,
	rest_allowed_methods/2,
	rest_is_authorized/2,
	rest_is_authorized/3,
	rest_content_types_provided/2,
	rest_content_types_accepted/2,
	rest_terminate/3
]).

-export([
	rest_get_handle/2,
	rest_post_handle/2,
	rest_response/3,
	rest_response/4,
	rest_get_response/3,
	rest_post_response/3,
	rest_file_response/3
]).

-export([
	rest_token_validate/1,
	rest_createGoogleClientSecretToken/3,
	rest_createGoogleClientSecretToken/4,
	rest_createAppleClientSecretToken/3,
	rest_createAppleClientSecretToken/4,
	rest_getGooglePaymentToken/1,
	rest_extractGoogleToken/1,
	rest_extractFacebookToken/1,
	rest_extractAppleToken/1,
	rest_createToken/1,
	rest_getEmail/1,
	rest_getEmail/0,
	rest_getUsername/1,
	rest_getUsername/0,
	rest_getUserId/1,
	rest_getUserId/0,
	rest_parser_header/1,
	send_mail/3
]).

-export([
	get_url_content_with_auth_key/2,
	get_url_content_with_header/2,
	get_url_content/1,
	post_url_content_with_auth_key/3,
	post_url_content_with_header/3,
	post_url_content/2,
	post_raw_url_content_with_auth_key/3,
	post_raw_url_content_with_header/3,
	post_raw_url_content/2
]).

%% ---------------------------------------------------------
%% ------------------------WEB SOCKET ----------------------
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

%% ---------------------------------------------------------
%% ------------------------REST API   ----------------------
%% ---------------------------------------------------------

rest_init(Req, Opts) ->	base_rest_handle:init(Req, Opts).
%
rest_is_authorized(Req, State) ->	base_rest_handle:is_authorized(Req, State).

rest_is_authorized(Authorized, Req, State) ->	base_rest_handle:is_authorized(Authorized,Req, State).
%%
rest_allowed_methods(Req, State) ->	base_rest_handle:allowed_methods(Req, State).
%%
rest_content_types_provided(Req, State) ->	base_rest_handle:content_types_provided(Req, State).

rest_content_types_accepted(Req, State) ->	base_rest_handle:content_types_accepted(Req, State).

rest_terminate(_Reason, _Req, _State) ->	base_rest_handle:terminate(_Reason, _Req, _State).

rest_get_handle(Req, State) ->	base_rest_handle:get_handle(Req, State) .

rest_post_handle (Req, State) ->	base_rest_handle:post_handle(Req, State) .

rest_file_response(Req,File,State) ->	base_rest_handle:file_response(Req,File,State).

rest_response(Req,Body,State,IsJson) ->	base_rest_handle:response(Req,Body,State,IsJson).

rest_response(Req,Body,State) ->	base_rest_handle:response(Req,Body,State).

rest_get_response(Req,Body,State) ->	base_rest_handle:get_response(Req,Body,State).

rest_post_response(Req,Body,State) ->	base_rest_handle:post_response(Req,Body,State).


rest_parser_header(Req) ->	base_rest_handle:parser_header(Req).

rest_token_validate(Token) ->	base_rest_handle:token_validate(Token) .

rest_extractAppleToken(RawToken) ->	base_rest_handle:extractAppleToken(RawToken).

rest_extractFacebookToken(RawToken) ->	base_rest_handle:extractFacebookToken(RawToken).

rest_getGooglePaymentToken(GameId) -> base_rest_handle:get_google_payment_access_token(GameId).

rest_extractGoogleToken(RawToken) ->	base_rest_handle:extractGoogleToken(RawToken).

rest_createToken(List) ->	base_rest_handle:createToken(List).

rest_createGoogleClientSecretToken(GameId,ISS,IAT) ->	base_rest_handle:createGoogleClientSecretToken(GameId,ISS,IAT).

rest_createGoogleClientSecretToken(GameId,ISS,IAT,EXP) ->	base_rest_handle:createGoogleClientSecretToken(GameId,ISS,IAT,EXP).

rest_createAppleClientSecretToken(ISS,IAT,EXP) ->	base_rest_handle:createAppleClientSecretToken(ISS,IAT,EXP).

rest_createAppleClientSecretToken(ISS,IAT,EXP,ClientId) ->	base_rest_handle:createAppleClientSecretToken(ISS,IAT,EXP,ClientId).

rest_getUserId(Req) ->	base_rest_handle:getUserId(Req).

rest_getUserId() ->	base_rest_handle:getUserId().


rest_getUsername(Req) ->	base_rest_handle:getUsername(Req).

rest_getUsername() ->	base_rest_handle:getUsername().

rest_getEmail(Req) ->	base_rest_handle:getEmail(Req).

rest_getEmail() ->	base_rest_handle:getEmail().

get_url_content_with_auth_key(Url,AuthJwt) -> base_rest_handle:get_url_content_with_auth_key(Url,AuthJwt).

get_url_content_with_header(Url,Header) -> base_rest_handle:get_url_content_with_header(Url,Header).

get_url_content(Url) -> get_url_content(Url,5).

get_url_content(Url,Repeat) -> base_rest_handle:get_url_content(Url,[],Repeat).

post_url_content_with_auth_key(Url,AuthJwt,FormData) -> base_rest_handle:post_url_content_with_auth_key(Url,AuthJwt,FormData).

post_url_content_with_header(Url,Header,FormData) -> base_rest_handle:post_url_content_with_header(Url,Header,FormData).

post_url_content(Url,FormData) -> post_url_content(Url, FormData,5).

post_url_content(Url, FormData, Repeat) ->	base_rest_handle:post_url_content(Url, [],FormData,Repeat).

post_raw_url_content_with_auth_key(Url,AuthJwt,FormData) -> base_rest_handle:post_raw_url_content_with_auth_key(Url,AuthJwt,FormData).

post_raw_url_content_with_header(Url,Header,FormData) -> base_rest_handle:post_raw_url_content_with_header(Url,Header,FormData).

post_raw_url_content(Url,BodyContent) -> post_raw_url_content(Url, BodyContent, 5).

post_raw_url_content(Url, BodyContent, Repeat) ->	base_rest_handle:post_raw_url_content(Url, [],BodyContent,Repeat).

send_mail(Receiver, Subject, Content) ->	base_rest_handle:send_mail(Receiver, Subject, Content).

