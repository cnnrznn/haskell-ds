-- Author: Connor Zanin
--
-- Purpose: simulate a reliable, finite delay network
--
-- Operations:
--   send
--   receive
-- 
-- Semantics
-- An event is defined as 'e = (p, m)' where m is a message received by p. m
-- could be some data, or a null value. Under the classical model, the network
-- is only allowed to return the null value a finite number of times to p while
-- there is a non-null value present in the network.

data Event = Event { ident :: Int,
                     msg :: Maybe String
                   } deriving(Eq, Show)

send :: [Event] -> Event -> [Event]
send ls e = ls ++ [e]

headornah :: Int -> [Event] -> Event
headornah p [] = Event { ident = p, msg = Nothing }
headornah p (x:xs) = Event { ident = p, msg = msg x }

receive :: Int -> [Event] -> (Event, [Event])
receive p ls =
    let forp = filter (\x -> ident x == p) ls
        event = headornah p forp
        newls = filter (/= event) ls
    in (event, newls)

