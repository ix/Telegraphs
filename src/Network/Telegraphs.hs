{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs where

import Network.HTTP.Conduit
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as B
import GHC.Generics
import Data.Maybe

import Network.Telegraphs.Message
import Network.Telegraphs.Update

getEndpoint :: String -> String -> String
getEndpoint token method = getBaseURL token ++ method
  where
    getBaseURL :: String -> String
    getBaseURL token = "https://api.telegram.org/bot" ++ token ++ "/"

getUpdates :: String -> IO Update
getUpdates token = maybe emptyUpdate id <$> update
  where response    = simpleHttp $ getEndpoint token "getUpdates"
        update      = (decode <$> response) :: IO (Maybe Update)
        emptyUpdate = (Update True [])

newUpdateId :: Update -> Int
newUpdateId update = succ . last . (map update_id) . result $ update
