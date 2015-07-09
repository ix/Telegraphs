{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Telegram.Update where

import Data.Aeson
import GHC.Generics

import Telegram.Message

data TResult =
  TResult { update_id :: Int
          , message   :: Message }
  deriving (Read, Show, Generic)

data Update =
  Update { ok     :: Bool
         , result :: [TResult] }
  deriving (Read, Show, Generic)

instance FromJSON TResult
instance ToJSON TResult

instance FromJSON Update
instance ToJSON Update
