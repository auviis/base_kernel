%%%-------------------------------------------------------------------
%%% @author nhnhat
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jul 2022 21:22
%%%-------------------------------------------------------------------
-module(base_rest_implement).
-author("nhnhat").

-callback init(Req:: term(), Opts:: term()) -> Any :: term().
-callback allowed_methods(Req:: term(), State :: term()) -> Any :: term().
-callback is_authorized(Req:: term(), State :: term()) -> Any :: term().
-callback content_types_provided(Req:: term(), State :: term()) -> Any :: term().
-callback content_types_accepted(Req:: term(), State :: term()) -> Any :: term().
-callback terminate(Reason::term, Req:: term(), State :: term()) -> ok.

-callback get_handle(Req:: term(), State :: term()) -> Any :: term().
-callback post_handle(Req:: term(), State :: term()) -> Any :: term().

