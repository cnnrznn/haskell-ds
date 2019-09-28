-- Author: Connor Zanin
--
-- Description:
-- This is an implementation of Bracha's fail-stop asynchronous randomized
-- consensus protocol.
--
-- @article{bracha1985asynchronous,
--   title={Asynchronous consensus and broadcast protocols},
--   author={Bracha, Gabriel and Toueg, Sam},
--   journal={Journal of the ACM (JACM)},
--   volume={32},
--   number={4},
--   pages={824--840},
--   year={1985},
--   publisher={ACM}
-- }
--

data Message = Message { value :: Int
                       , cardinality :: Int
                       , phaseno :: Int
                       } deriving ( Show, Eq)

data Replica = Replica { thot :: Message
                       , witness_count :: [Int]
                       , message_count :: [Int]
                       , recv_buffer :: [Message]
                       , send_buffer :: [Message]
                       } deriving (Show, Eq)

--send :: Replica -> [Message] -> (Replica, [Message])
--recv :: Message -> Replica -> Replica
--actn :: Replica -> Replica

-- A consensus instance.
-- Input:
--  - n: number of peers
--  - k: fault tolerance
--  - l: consensus instance (log position)
-- Output:
--  - b: result of consensus
consensus :: Int -> Int -> Int -> Bool
consensus n k l = True


