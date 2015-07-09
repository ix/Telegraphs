{-# LANGUAGE DeriveGeneric #-}
module Telegram.GroupChat where

import Data.Aeson
import GHC.Generics

data GroupChat =
  GroupChat { id    :: Integer
            , title :: String }
  deriving (Read, Show, Generic)

instance FromJSON GroupChat
instance ToJSON GroupChat
