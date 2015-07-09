{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Telegram where

import Network.HTTP.Conduit
import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as B
import GHC.Generics
import Data.Maybe

import Telegram.Message
import Telegram.Update

token :: String
token = "your bot token here"

getBaseURL :: String
getBaseURL = "https://api.telegram.org/bot" ++ token ++ "/"

getEndpoint :: String -> String
getEndpoint method = getBaseURL ++ method

performGET :: String -> IO B.ByteString
performGET url = simpleHttp $ url
