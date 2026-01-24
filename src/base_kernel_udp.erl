-module(base_kernel_udp).
-export([
  start_udp_service/2,
  start_udp_service/3,
  start_enet_service/2,
  start_enet_service/3,
  start_kcp_service/2,
  start_kcp_service/3
]).
-export([
  set_kcp_connection_limit/1,
  set_kcp_connection_limit/2
]).
-export(
    [
        byte/1
        ,string/1
        ,binary/1
        ,int8/1
        ,uint8/1
        ,int16/1
        ,uint16/1
        ,int32/1
        ,uint32/1
        ,float/1
        ,array/2
        ,read/2
        ,read/3
        ,read_fields/2
        ,pack/2
    ]
).

byte(L) -> base_tcp_encoder:byte(L).
string(L) -> base_tcp_encoder:string(L).
binary(L) -> base_tcp_encoder:binary(L).
int8(L) -> base_tcp_encoder:int8(L).
uint8(L) -> base_tcp_encoder:uint8(L).
int16(L) -> base_tcp_encoder:int16(L).
uint16(L) -> base_tcp_encoder:uint16(L).
int32(L) -> base_tcp_encoder:int32(L).
uint32(L) -> base_tcp_encoder:uint32(L).
float(L) -> base_tcp_encoder:float(L).
array(L,M) -> base_tcp_encoder:array(L,M).
read(L,M) -> base_tcp_encoder:read(L,M).
read(L,M,N) -> base_tcp_encoder:read(L,M,N).
read_fields(L,M) -> base_tcp_encoder:read_fields(L,M).
pack(L,M) -> base_tcp_encoder:pack(L,M).

start_udp_service(Module,UDPKey) ->
  base_kernel_helper:start_udp_service(Module,UDPKey).
start_udp_service(Module,UDPKey,Port) ->
  base_kernel_helper:start_udp_service(Module,UDPKey,Port).

start_enet_service(Module,UDPKey) ->
base_kernel_helper:start_enet_service(Module,UDPKey).
start_enet_service(Module,UDPKey,Port) ->
  base_kernel_helper:start_enet_service(Module,UDPKey,Port).

start_kcp_service(Module,UDPKey) ->
  base_kernel_helper:start_kcp_service(Module,UDPKey).
start_kcp_service(Module,UDPKey,Port) ->
  base_kernel_helper:start_kcp_service(Module,UDPKey,Port).
set_kcp_connection_limit(MaxConn) ->
  set_kcp_connection_limit(MaxConn, MaxConn).
set_kcp_connection_limit(MaxConn, MaxWarn) ->
  base_kernel_helper:set_kcp_connection_limit(MaxConn, MaxWarn).

