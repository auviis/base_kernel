%%%-------------------------------------------------------------------
%%% @author nhnhat
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jul 2022 21:22
%%%-------------------------------------------------------------------
-module(base_process_handle).
-author("nhnhat").

-callback init_callback(Args :: list()) -> State :: term().
-callback handle_callback(Data :: term(),CurrentState ::term()) -> {Result :: term(),State :: term()}.
-callback stop_callback(Data :: term(),CurrentState ::term()) -> State :: term().
-callback exit_callback(Data :: term(),CurrentState ::term()) -> State:: term().
