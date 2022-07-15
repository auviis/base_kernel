-module(base_kernel_util).

-export([
    get_app/0,
    get/1,
    get_config/1
    ]).

-export ([
    to_list/1,
    to_list_lower/1,
    to_binary/1,
    to_number/1,
    to_timestamp/1,
    to_wei/1,
    from_wei/1,
    unixtime/0,
    longunixtime/0,
    mongotimestamp/0,
    datetime_to_seconds/1,
    unixtime_to_mongotime/1,
    unixtime_to_localtime/1,
    mongotime_to_unixtime/1,
    current_time_in_seconds/0,
    get_secs_from_midnight/0,
    rnd_chars_numbers/1,
    sleep/1
]).

-export([
    getIpFromCowboyRequest/1,
    getLocationFromIP/1
]).

-export([
    md5/1,
    sha512/1,
    ifelse/3,
    random/2,
    rm_str_space/1
]).

-export([
    safe_create_ets/2
]).

-export([
    create_process_name/2,
    whereis_name/1,
    is_process_alive/1
]).
get_app()->  base_config:get_app().
get(Key) ->  base_config:get(Key).
get_config(Key) ->  base_config:get(Key).

to_list(L) -> base_util:to_list(L).
to_list_lower(L) -> base_util:to_list_lower(L).
to_binary(L) -> base_util:to_binary(L).
to_number(L) -> base_util:to_number(L).
to_timestamp(L) -> base_util:to_timestamp(L).
to_wei(M) -> base_util:to_wei(M).
from_wei(W) -> base_util:from_wei(W).
unixtime() -> base_util:unixtime().
longunixtime() -> base_util:longunixtime().
mongotimestamp() -> base_util:mongotimestamp().
%% DateTime = {{2011,11,15},{16,14,57}} = {{Y, M, D}, {h, m, s}}
datetime_to_seconds(DateTime) -> base_util:datetime_to_seconds(DateTime).
mongotime_to_unixtime(MongoTime) -> base_util:mongotime_to_unixtime(MongoTime).
unixtime_to_mongotime(UnixTime)  -> base_util:unixtime_to_mongotime(UnixTime).
unixtime_to_localtime(UnixTime)  -> base_util:unixtime_to_localtime(UnixTime).
current_time_in_seconds() -> base_util:current_time_in_seconds().
get_secs_from_midnight() -> base_util:get_secs_from_midnight().
rnd_chars_numbers(Len) -> base_util:rnd_chars_numbers(Len).
sleep(Milliseconds) -> base_util:sleep(Milliseconds).

md5(String) -> base_util:md5(String).
sha512(String) -> base_util:sha512(String).
ifelse(A, B, C) -> base_util:ifelse(A, B, C).
random(Min,Max) -> base_util:random(Min,Max).

getIpFromCowboyRequest(Req) -> base_util:getIpFromCowboyRequest(Req).
getLocationFromIP(IP) -> base_util:getLocationFromIP(IP).
rm_str_space(String) -> base_util:rm_str_space(String).

safe_create_ets(Name, Args) -> base_util:safe_create_ets(Name, Args).

create_process_name(Prefix,List) -> base_misc:create_process_name(Prefix,List).
whereis_name(Name) -> base_misc:whereis_name(Name).
is_process_alive(Pid) -> base_misc:is_process_alive(Pid).