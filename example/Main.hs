module Main where

import Network.Telegraphs
import System.Posix.Unistd
import Text.Printf

token :: String
token = "token"

mainLoop :: Int -> IO ()
mainLoop id = do
  newUpdate <- getUpdatesWithOffset id token
  case newUpdate of
    Nothing -> printf "Empty update.\n" >> mainLoop id
    Just x  -> do
      print x
      mainLoop $ newUpdateId x

main :: IO ()
main = do
  initial <- getUpdates token
  case initial of
    Nothing -> printf "Empty update.\n"
    Just x  -> do
      printf "Passing %v to mainLoop...\n" $ newUpdateId x
      mainLoop $ newUpdateId x
