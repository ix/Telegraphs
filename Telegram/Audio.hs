{-# LANGUAGE DeriveGeneric #-}
module Telegram.Audio where

import Data.Aeson
import GHC.Generics

data Audio =
  Audio { file_id   :: String
        , duration  :: Integer
        , mime_type :: Maybe String
        , file_size :: Maybe Integer }
  deriving (Read, Show, Generic)

instance FromJSON Audio
instance ToJSON Audio
