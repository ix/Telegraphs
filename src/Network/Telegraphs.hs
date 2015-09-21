{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs where

import Network.HTTP.Conduit
import Data.Aeson
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as LB
import GHC.Generics
import Data.Maybe

import Network.Telegraphs.Message
import Network.Telegraphs.Update

-- return an endpoint url for a given method & token
getEndpoint :: String -> String -> String
getEndpoint token method = getBaseURL token ++ method
  where
    getBaseURL :: String -> String
    getBaseURL token = "https://api.telegram.org/bot" ++ token ++ "/"

-- convert the body returned from a GET request to an update
convertString :: LB.ByteString -> Maybe Update
convertString bs =
  case result <$> parsed of
   Just [] -> Nothing
   Nothing -> Nothing
   Just x  -> Just x
  where parsed = (decode $ bs) :: Maybe Status

-- getUpdates without an offset
getUpdates :: String -> IO (Maybe Update)
getUpdates token = do
  req <- parseUrl $ getEndpoint token "getUpdates"
  man <- newManager tlsManagerSettings
  response <- httpLbs req man
  return $ convertString $ responseBody response

-- perform the 'getUpdates' method with an offset
getUpdatesWithOffset :: Int -> String -> IO (Maybe Update)
getUpdatesWithOffset offset token = do
  req <- parseUrl $ getEndpoint token "getUpdates"
  man <- newManager tlsManagerSettings
  -- use the offset in the GET request
  reqOffset <- return req { queryString = B.pack ("?offset=" ++ show offset) }
  -- perform the request
  response <- httpLbs reqOffset man
  return $ convertString $ responseBody response

-- send a given message to a chat
sendMessage :: String -> Int -> String -> IO (Response LB.ByteString)
sendMessage msg chat token = do
  req <- parseUrl $ getEndpoint token "sendMessage"
  man <- newManager tlsManagerSettings
  let query = "?text=" ++ msg ++ "&chat_id=" ++ show chat
  reqText <- return req { method = "POST"
                        , queryString = B.pack query }
  -- perform the request
  httpLbs reqText man

-- given an update, calculate a new update ID
newUpdateId :: Update -> Int
newUpdateId update =
  succ . last . (map update_id) $ update
