%%%-------------------------------------------------------------------
%%% @author nhnhat
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Aug 2024 11:37
%%%-------------------------------------------------------------------
-module(base_kernel_queue).
-author("nhnhat").
%% API
-export([
  produce_message/3,
  consume_message_once/3,
  consume_message_once_last/2,
  consume_message_last/2,
  consume_message/3,
  consume_message/4,
  ack_message/3,
  ack_message_once/3
]).
-export([
  global_subscribe/4,
  global_un_subscribe/3,
  global_produce_message/4,
  global_consume_message_once/3,
  global_consume_message/3,
  global_consume_message/4,
  global_consume_message/5,
  global_ack_message/4,
  global_ack_message_once/4
]).
-export([
  subscribe/4,
  un_subscribe/3
]).

produce_message(Topic,Key,Content) ->
  lib_base_message_queue:produce_message(Topic,Key,Content).

subscribe(Node,Topic,Key, {M,F}) ->
  lib_base_message_queue:subscribe(Node,Topic,Key, {M,F});

subscribe(Node,Topic,Key, {M,F,Args}) ->
  lib_base_message_queue:subscribe(Node,Topic,Key, {M,F,Args}).

un_subscribe(Node,Topic,Key) ->
  lib_base_message_queue:un_subscribe(Node,Topic,Key).

consume_message_once_last(Topic,Key) ->
  lib_base_message_queue:consume_message_once_last(Topic,Key).

consume_message_once(Topic,Key,Idx) ->
  lib_base_message_queue:consume_message_once(Topic,Key,Idx).

consume_message_last(Topic,Key) ->
  lib_base_message_queue:consume_message_last(Topic,Key).

consume_message(Topic,Key,FromIdx,ToIdx) ->
  lib_base_message_queue:consume_message(Topic,Key,FromIdx,ToIdx).

consume_message(Topic,Key,Idx) ->
  lib_base_message_queue:consume_message(Topic,Key,Idx).

ack_message(Topic,Key,Idx) ->
  lib_base_message_queue:ack_message(Topic,Key,Idx).

ack_message_once(Topic,Key,Idx) ->
  lib_base_message_queue:ack_message_once(Topic,Key,Idx).

%% global
global_subscribe(Service,Topic,Key, {M,F}) ->
  lib_base_message_queue:global_subscribe(Service,Topic,Key, {M,F});

global_subscribe(Service,Topic,Key, {M,F,Args}) ->
  lib_base_message_queue:global_subscribe(Service,Topic,Key, {M,F,Args}).

global_un_subscribe(Service,Topic,Key) ->
  lib_base_message_queue:global_un_subscribe(Service,Topic,Key).

global_produce_message(Service,Topic,Key,Content) ->
  lib_base_message_queue:global_produce_message(Service,Topic,Key,Content).

global_consume_message_once(Service,Topic,Key) ->
  lib_base_message_queue:global_consume_message_once(Service,Topic,Key).

global_consume_message(Service,Topic,Key) ->
  lib_base_message_queue:global_consume_message(Service,Topic,Key).

global_consume_message(Service,Topic,Key,FromIdx) ->
  lib_base_message_queue:global_consume_message(Service,Topic,Key,FromIdx).

global_consume_message(Service,Topic,Key,FromIdx,ToIdx) ->
  lib_base_message_queue:global_consume_message(Service,Topic,Key,FromIdx,ToIdx).

global_ack_message(Service,Topic,Key,Idx) ->
  lib_base_message_queue:global_ack_message(Service,Topic,Key,Idx).

global_ack_message_once(Service,Topic,Key,Idx) ->
  lib_base_message_queue:global_ack_message_once(Service,Topic,Key,Idx).