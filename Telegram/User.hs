{-# LANGUAGE DeriveGeneric #-}
module Telegram.User where

import Data.Aeson
import GHC.Generics

data User =
  User { id         :: Integer
       , first_name :: String }
  deriving (Read, Show, Generic)

instance FromJSON User
instance ToJSON User
