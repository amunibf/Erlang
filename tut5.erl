% this module is file tut5.erl
-module(tut5).
-export([format_temps/1]).

% only this function is exported
format_temps([])->
    ok;
format_temps([City|Rest])->
    print_temp(convert_to_celcius(City)),
    format_temps(Rest).

convert_to_celcius({Name, {c, Temp}})->
    {Name, {c, Temp}};
convert_to_celcius({Name, {f, Temp}})->
    {Name, {c, (Temp-32)*5/9}}.

print_temp({Name, {c, Temp}})->
    io:format("~-15w ~w c~n", [Name, Temp]).


