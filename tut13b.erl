-module(tut13b).
-export([convert_list_to_c/1]).

convert_to_c({Name, {f, Temp}})->
	{Name, {c, trunc((Temp-32)*5/9)}};
	
convert_to_c({Name, {c, Temp}})->
	{Name, {c, Temp}}.

convert_list_to_c(List)->
    New_list = lists:map(fun convert_to_c/1, List),
    lists:sort(fun({_, {c, Temp1}}, {_, {c, Temp2}})-> 
        Temp1<Temp2 end, New_list).

% tut13b:convert_list_to_c([{ng, {f,32}},{bn,{f,100}}]).


    

    