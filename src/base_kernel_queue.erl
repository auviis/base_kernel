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
  consume_message_once/2,
  consume_message/2,
  consume_message/3,
  ack_message/3
]).
-export([
  global_produce_message/4,
  global_consume_message_once/3,
  global_consume_message/3,
  global_consume_message/4,
  global_ack_message/4
]).

%%base_kernel_queue:produce_message("Topic","Key","Content").
produce_message(Topic,Key,Content) ->
  lib_base_message_queue:produce_message(Topic,Key,Content).

%%base_kernel_queue:consume_message_once("Topic","Key").
consume_message_once(Topic,Key) ->
  lib_base_message_queue:consume_message_once(Topic,Key).

%%base_kernel_queue:consume_message("Topic","Key").
consume_message(Topic,Key) ->
  lib_base_message_queue:consume_message(Topic,Key).

%%base_kernel_queue:consume_message("Topic","Key",1).
consume_message(Topic,Key,FromIdx) ->
  lib_base_message_queue:consume_message(Topic,Key,FromIdx).

%%base_kernel_queue:ack_message("Topic","Key",1).
ack_message(Topic,Key,Idx) ->
  lib_base_message_queue:ack_message(Topic,Key,Idx).


%% global
global_produce_message(Service,Topic,Key,Content) ->
  lib_base_message_queue:global_produce_message(Service,Topic,Key,Content).

global_consume_message_once(Service,Topic,Key) ->
  lib_base_message_queue:global_consume_message_once(Service,Topic,Key).

global_consume_message(Service,Topic,Key) ->
  lib_base_message_queue:global_consume_message(Service,Topic,Key).

global_consume_message(Service,Topic,Key,FromIdx) ->
  lib_base_message_queue:global_consume_message(Service,Topic,Key,FromIdx).

global_ack_message(Service,Topic,Key,Idx) ->
  lib_base_message_queue:global_ack_message(Service,Topic,Key,Idx).