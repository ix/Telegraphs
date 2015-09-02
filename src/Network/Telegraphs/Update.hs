{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs.Update where

import Data.Aeson
import GHC.Generics

import Network.Telegraphs.Message

data TResult =
  TResult { update_id :: Int
          , message   :: Message }
  deriving (Read, Show, Generic)

type Update = [TResult]
           
data Status =
  Status { ok     :: Bool
         , result :: Update }
  deriving (Read, Show, Generic)

instance FromJSON TResult
instance ToJSON TResult

instance FromJSON Status
instance ToJSON Status
