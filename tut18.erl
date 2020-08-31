-module(tut18).
-export([start/1, ping/2, pong/0]).

ping(0, Pong_node)->
    {pong, Pong_node} ! finished,
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
        finished->
            io:format("Pong finished~n",[]);
        {ping, Ping_ID}->
            io:format("Pong received ping~n",[]),
            Ping_ID ! pong,
            pong()
    end.

start(Ping_Node)->
    register(pong, spawn(tut18, pong, [])),
    spawn(Ping_Node, tut18, ping, [3, node()]).



