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

getBaseURL :: String -> String
getBaseURL token = "https://api.telegram.org/bot" ++ token ++ "/"

getEndpoint :: String -> String -> String
getEndpoint token method = getBaseURL token ++ method

performGET :: String -> IO B.ByteString
performGET url = simpleHttp $ url

newUpdateId :: Update -> Int
newUpdateId up = succ . last . (map update_id) . result $ up
