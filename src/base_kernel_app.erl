%%%-------------------------------------------------------------------
%% @doc id_base_app public API
%% @end
%%%-------------------------------------------------------------------

-module(base_kernel_app).
-behaviour(application).
-export([start/2, stop/1]).

-export([
  start_net_service/1,
  pause_net_service/0,
  resume_net_service/0,
  stop_network_service/0
]).

-export([
  init_db_connection/0,
  init_db_connection/1,
  connect_database/0,
  connect_database/1,
  get_db_connection/0,
  get_db_connection/1,
  db_disconnect/0,
  db_disconnect/1,
  verify_blockchain_signed/3
]).
-export([
  set_app/1,
  call_service/3,
  enable_protect/2,
  enable_protect/3,
  run_with_protect/2,
  run_with_protect/3,
  create_process/2,
  create_process/3,
  create_unlink_process/2,
  create_unlink_process/3,
  create_protect_process/2,
  create_protect_process/3,
  process_apply/3,
  process_apply/4,
  execute_template/2,
  execute_template/3,
  execute_template_sync/2,
  execute_template_sync/3,
  execute_template_sync/4,
  execute_template_sync_with_timeout/3,
  execute_template_sync_with_timeout/4,
  execute_template_sync_with_timeout/5,
  get_process/1,
  get_process/2,
  stop_process/2,
  stop_process/3,
  preparing_stop/0
]).
-export([
  getCache/1,
  setCache/2,
  setCache/3,
  removeCache/1,
  removeCacheAll/0,
  getCacheGlobal/2,
  setCacheGlobal/3,
  setCacheGlobal/4,
  removeCacheGlobal/2
]).
-export([
  getDiskCache/1,
  setDiskCache/2,
  setDiskCache/3,
  removeDiskCache/1,
  removeDiskCacheAll/0,
  getDiskCacheGlobal/2,
  setDiskCacheGlobal/3,
  setDiskCacheGlobal/4,
  removeDiskCacheGlobal/2
]).
-export([
  initCachePool/2,
  updateCacheToPool/2,
  getCacheOfPool/2,
  removeCacheFromPool/2,
  clearCachePool/1,
  deleteCachePool/1,
  getAllCacheOfPool/1
]).
-export([enable_ip_local_lookup/1]).
-export([
  stop_server/0
]).

start(StartType, App) ->
%%  ?INF_VERBOSE("starting base_kernel ~n"),
  base_kernel_helper:start(StartType,App).

stop(State) ->
  base_kernel_helper:stop(State).

preparing_stop() ->
  base_kernel_helper:preparing_stop().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      http service   %%%%%%%%%%%%%%%%%%%%%%%%%
start_net_service(Routing) ->
  base_kernel_helper:start_net_service(Routing).

pause_net_service() ->
  base_kernel_helper:pause_net_service().

resume_net_service() ->
  base_kernel_helper:resume_net_service().

stop_network_service() ->
  base_kernel_helper:stop_net_service().

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     supervise pool       %%%%%%%%%%%%%%%%%%%%
enable_protect(Module,Pool)->
  base_kernel_helper:enable_protect(Module,Pool,[]).

enable_protect(Module,Pool,Args)->
  base_kernel_helper:enable_protect(Module,Pool,Args).

run_with_protect(Module,Pool)->
  base_kernel_helper:run_with_protect(Module,Pool,[]).

run_with_protect(Module,Pool,Args)->
  base_kernel_helper:run_with_protect(Module,Pool,Args).

create_process(Module,Args) ->
  base_kernel_helper:create_link_process(Module,Args).

create_process(Module,Id,Args) ->
  base_kernel_helper:create_link_process(Module,Id,Args).

create_unlink_process(Module,Args) ->
  base_kernel_helper:create_unlink_process(Module,Args).

create_unlink_process(Module,Id,Args) ->
  base_kernel_helper:create_unlink_process(Module,Id,Args).

create_protect_process(Module,Args) ->
  base_kernel_helper:create_protect_process(Module,[],Args).
create_protect_process(Module,Id,Args) ->
    base_kernel_helper:create_protect_process(Module,Id,Args).

process_apply(sync, Module, MFA) ->
  base_kernel_helper:process_apply(sync, Module,[], MFA);
process_apply(async, Module, MFA) ->
  base_kernel_helper:process_apply(async, Module,[], MFA).

process_apply(sync, Module,Id, MFA) ->
  base_kernel_helper:process_apply(sync, Module,Id, MFA);
process_apply(async, Module,Id, MFA) ->
  base_kernel_helper:process_apply(async, Module,Id, MFA).


execute_template(Module,Template) ->
  base_kernel_helper:execute_template(Module,Template).
execute_template(Module,Id,Template) ->
  base_kernel_helper:execute_template(Module,Id,Template).

execute_template_sync(Module,Template) ->
  base_kernel_helper:execute_template_sync(Module,Template).
execute_template_sync(Module,Id,Template) ->
  base_kernel_helper:execute_template_sync(Module,Id,Template).
execute_template_sync(Module,Id,Template,State) ->
  base_kernel_helper:execute_template_sync(Module,Id,Template,State).

execute_template_sync_with_timeout(Module,Template,TimeOut) ->
  base_kernel_helper:execute_template_sync_with_timeout(Module,Template,TimeOut).
execute_template_sync_with_timeout(Module,Id,Template,TimeOut) ->
  base_kernel_helper:execute_template_sync_with_timeout(Module,Id,Template,TimeOut).
execute_template_sync_with_timeout(Module,Id,Template,State,TimeOut) ->
  base_kernel_helper:execute_template_sync_with_timeout(Module,Id,Template,State,TimeOut).

get_process(Module) ->
  base_kernel_process:getProcess(Module).

get_process(Module,Id) ->
  base_kernel_helper:get_process(Module,Id).

stop_process(Module,Reason) ->
  base_kernel_helper:stop_process(Module,Reason).

stop_process(Module,Id,Reason) ->
  base_kernel_helper:stop_process(Module,Id,Reason).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     db service       %%%%%%%%%%%%%%%%%%%%%%%%
init_db_connection() ->
  base_kernel_helper:init_db_connection(default).
init_db_connection(DatabaseId) ->
  base_kernel_helper:init_db_connection(DatabaseId).

connect_database() ->
  base_kernel_helper:connect_database().

connect_database(Database) ->
  base_kernel_helper:connect_database(Database).

get_db_connection()->
  base_kernel_helper:get_db_connection().

get_db_connection(Database) ->
  base_kernel_helper:get_db_connection(Database).

db_disconnect()->
  base_kernel_helper:db_disconnect(default).

db_disconnect(Database) ->
  base_kernel_helper:db_disconnect(Database).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% interface functions %%%%%%%%%%%%%%%%%%%%%%%%%
set_app(App) ->
  base_kernel_helper:set_app(App).

call_service(Service, async, {M,F,A}) ->
  base_kernel_helper:call_service(Service, async, {M,F,A});

call_service(Service, sync, {M,F,A}) ->
  base_kernel_helper:call_service(Service, sync, {M,F,A}).

verify_blockchain_signed(Address, UnixTime, SignedTx) ->
  base_kernel_helper:verify_blockchain_signed(Address, UnixTime, SignedTx).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %% %% %% %% %% cache %% %% %% %% %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
getCache(Key) ->
  base_kernel_helper:getCache(Key).

setCache(Key,Val) ->
  base_kernel_helper:setCache(Key,Val).

setCache(Key,Val,Expire) ->
  base_kernel_helper:setCache(Key,Val,Expire).

removeCache(Key) ->
  base_kernel_helper:removeCache(Key).

removeCacheAll() ->
  base_kernel_helper:removeCacheAll().

getDiskCache(Key) ->
  base_kernel_helper:getDiskCache(Key).

setDiskCache(Key,Val) ->
  base_kernel_helper:setDiskCache(Key,Val).

setDiskCache(Key,Val,Expire) ->
  base_kernel_helper:setDiskCache(Key,Val,Expire).

removeDiskCache(Key) ->
  base_kernel_helper:removeDiskCache(Key).

removeDiskCacheAll() ->
  base_kernel_helper:removeDiskCacheAll().

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% %% %% %% cache global %% %% %% %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
getCacheGlobal(CacheService,Key) ->
  base_kernel_helper:getCacheGlobal(CacheService,Key).

setCacheGlobal(CacheService,Key,Val) ->
  base_kernel_helper:setCacheGlobal(CacheService,Key,Val).

setCacheGlobal(CacheService,Key,Val,Expire) ->
  base_kernel_helper:setCacheGlobal(CacheService,Key,Val,Expire).

removeCacheGlobal(CacheService,Key) ->
  base_kernel_helper:removeCacheGlobal(CacheService,Key).

getDiskCacheGlobal(CacheService,Key) ->
  base_kernel_helper:getDiskCacheGlobal(CacheService,Key).

setDiskCacheGlobal(CacheService,Key,Val) ->
  base_kernel_helper:setDiskCacheGlobal(CacheService,Key,Val).

setDiskCacheGlobal(CacheService,Key,Val,Expire) ->
  base_kernel_helper:setCacheGlobal(CacheService,Key,Val,Expire).

removeDiskCacheGlobal(CacheService,Key) ->
  base_kernel_helper:removeDiskCacheGlobal(CacheService,Key).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initCachePool(EtsName, RecordKey) ->
  base_kernel_helper:initCachePool(EtsName, RecordKey).
updateCacheToPool(EtsName, RecordData) ->
  base_kernel_helper:insertCacheToPool(EtsName, RecordData).
getCacheOfPool(EtsName,Key) ->
  base_kernel_helper:getCacheOfPool(EtsName, Key).
getAllCacheOfPool(EtsName) ->
  base_kernel_helper:getAllCacheOfPool(EtsName).
removeCacheFromPool(EtsName,Key) ->
  base_kernel_helper:removeCacheFromPool(EtsName, Key).
clearCachePool(EtsName) ->
  base_kernel_helper:clearCachePool(EtsName).
deleteCachePool(EtsName) ->
  base_kernel_helper:deleteCachePool(EtsName).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% %% %% %% nif %% %% %% %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
enable_ip_local_lookup(IpToCountryDataFile) ->
  svr_base_service:enable_ip_local_lookup(IpToCountryDataFile).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% %% %% %% nif %% %% %% %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stop_server() ->
  base_kernel_helper:stop_server().