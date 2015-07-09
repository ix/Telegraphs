{-# LANGUAGE DeriveGeneric #-}
module Telegram.Message where

import Data.Aeson
import GHC.Generics

import Telegram.User
import Telegram.GroupChat

data Message =
  Message { message_id :: Integer
          , from       :: User
          , date       :: Integer
          , chat       :: User }
  deriving (Read, Show, Generic)

instance FromJSON Message
instance ToJSON Message

-- Dummy message.
dummyMessage :: Message
dummyMessage = Message 1 (User 123 "Dummy") 12345678 (User 456 "Dummy2")
