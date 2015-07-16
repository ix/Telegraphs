{-# LANGUAGE DeriveGeneric #-}
module Telegram.Contact where

import Data.Aeson
import GHC.Generics

data Contact =
  Contact { phone_number :: String
        , first_name   :: String
        , last_name    :: Maybe String
        , user_id      :: Maybe String }
  deriving (Read, Show, Generic)

instance FromJSON Contact
instance ToJSON Contact
