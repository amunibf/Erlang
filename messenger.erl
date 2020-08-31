-module(messenger).
-export([start_server/0, server/1, logon/1, logoff/0, message/2, client/2]).


server_node()->
    messenger@amunibf.

server(User_List)->
    receive
        {From, logon, Name}->
            New_User_List = server_logon(From, Name, User_List),
            server(New_User_List);
        {From, logon, Name}->
            New_User_List = server_logon(From, Name, User_List),
            server(New_User_List);
        {From, logon, Name}->
            New_User_List = server_logon(From, Name, User_List),
            server(New_User_List);
