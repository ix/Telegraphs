module Main where

import Network.Telegraphs
import System.Posix.Unistd
import Text.Printf

token :: String
token = "130996555:AAF8v8xO-CLulyjiJhZv4B49PeYmSGrVKlE"

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
    Nothing -> printf "Empty initial update.\n"
    Just x  -> do
      printf "Passing %v to mainLoop...\n" $ newUpdateId x
      mainLoop $ newUpdateId x
