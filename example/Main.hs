module Main where

import Network.Telegraphs
import System.Posix.Unistd
import Text.Printf

token :: String
token = "token"

group :: Int
group = -1

mainLoop :: Int -> IO ()
mainLoop id = do
  update <- getUpdatesWithOffset id token
  case update of
    Nothing -> do
      printf "[]\n"
      mainLoop id
    Just u  -> do
      print update
      mainLoop $ newUpdateId u
  
main :: IO ()
main = do
  initial <- getUpdatesWithOffset 0 token
  case initial of
    Nothing -> printf "[Trying for initial...]\n" >> main
    Just u  -> mainLoop $ newUpdateId u
