{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs.User where

import Data.Aeson
import GHC.Generics

data User =
  User { id         :: Integer
       , first_name :: String
       , last_name  :: Maybe String
       , username   :: Maybe String }
  deriving (Read, Show, Generic)

instance FromJSON User
instance ToJSON User
