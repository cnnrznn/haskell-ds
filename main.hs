import Control.Monad
import Data.ByteString.Char8
import Network.Socket
import Network.Socket.ByteString

sendudp m ip port =
    do
      addr:_ <- getAddrInfo Nothing (Just ip) (Just port)
      sock <- socket (addrFamily addr) Datagram defaultProtocol
      connect sock (addrAddress addr)
      send sock (pack m)
      close sock

recvudp ip port =
    do addr:_ <- getAddrInfo Nothing ip port 
       sock <- socket (addrFamily addr) Datagram defaultProtocol
       bind sock (addrAddress addr)
       bytes <- recv sock 4096
       close sock
       return (unpack bytes)

serve = forever recvudp

main = withSocketsDo $ serve

