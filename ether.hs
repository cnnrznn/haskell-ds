data Event = Event { ident :: Int,
                     msg :: String
                   } deriving(Eq, Show)

-- Place an event in the ether
send :: [Event] -> Event -> [Event]
send ls e = ls ++ [e]

-- Remove a message for process p from the ether
-- Messages are FIFO for a process p
-- TODO consider selecting a message for p at random
receive :: Int -> [Event] -> (Event, [Event])
receive p ls = let forp = filter (\x -> ident x == p) ls
                   event = head forp
                   newls = tail forp ++ filter (/= event) ls
               in (event, newls)
