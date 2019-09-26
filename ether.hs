data Event = Event { ident :: Int,
                     msg :: String
                   } deriving(Eq, Show)

-- Place an event in the ether
send :: [Event] -> Event -> [Event]
send ls e = ls ++ [e]

headornah [] = Nothing
headornah (x:xs) = Just x

-- Remove a message for process p from the ether
-- Messages are FIFO for a process p
-- TODO consider selecting a message for p at random
-- TODO make this shit safe
receive :: Int -> [Event] -> (Maybe Event, [Event])
receive p ls =
    let forp = filter (\x -> ident x == p) ls
        event = headornah forp
        newls = filter (/= event) ls
    in (event, newls)
