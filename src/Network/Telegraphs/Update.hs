{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs.Update where

import Data.Aeson
import GHC.Generics

import Network.Telegraphs.Message

data Update =
  Update { update_id :: Int
         , message   :: Maybe Message }
  deriving (Read, Show, Generic)
           
data Status =
  Status { ok     :: Bool
         , result :: [Update] }
  deriving (Read, Show, Generic)

instance FromJSON Update 
instance ToJSON Update

instance FromJSON Status
instance ToJSON Status
