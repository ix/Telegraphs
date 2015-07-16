{-# LANGUAGE DeriveGeneric #-}
module Telegram.Location where

import Data.Aeson
import GHC.Generics

data Location =
  Location { longitude :: Float
           , latitude  :: Float }
  deriving (Read, Show, Generic)

instance FromJSON Location
instance ToJSON Location
