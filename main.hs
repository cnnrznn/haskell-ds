import Network.Socket

makesock = do
             addr:_ <- getAddrInfo Nothing (Just "127.0.0.1") (Just "3333")
             sock <- socket (addrFamily addr) (addrSocketType addr) (addrProtocol addr)
             bind sock $ addrAddress addr
             return sock

printsock iosock =
    do sock <- iosock
       name <- getSocketName sock
       print name

main = withSocketsDo $ printsock $ makesock

