-module([tut16]).
-export([start/0, ping/1, pong/0]).

ping(0)->
	pong ! finished,
	io:format("ping finished~n"



