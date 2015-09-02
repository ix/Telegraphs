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

-- given an update, calculate a new update ID
newUpdateId :: Maybe Update -> Int
newUpdateId update =
  case update of
   Nothing -> 0
   (Just n) -> succ . last . (map update_id) $ n
