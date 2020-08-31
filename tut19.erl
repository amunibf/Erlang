-module(tut19).
-export([start_ping/1, start_pong/0, ping/2,pong/0]).


ping(0, Pong_node)->
    io:format("Ping finished~n",[]);
ping(N, Pong_node)->
    {pong, Pong_node} ! {ping, self()},
    receive
        pong->
            io:format("Ping received pong~n",[])
    end,
    ping(N-1, Pong_node).
pong()->
    receive
        {ping, Ping_ID}->
            io:format("Pong received ping~n",[]),
            Ping_ID ! pong,
            pong()
        after 5000 ->
            io:format("Pong time out~n",[])
    end.

start_pong()->
    register(pong, spawn(tut19, pong, [])).
start_ping(Pong_node)->
    spawn(tut19, ping, [3, Pong_node]).
