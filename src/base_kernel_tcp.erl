-module(base_kernel_tcp).
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