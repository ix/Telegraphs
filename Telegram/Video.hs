{-# LANGUAGE DeriveGeneric #-}
module Telegram.Video where

import Data.Aeson
import GHC.Generics

import Telegram.PhotoSize

data Video =
  Video { file_id   :: String
        , width     :: Integer
        , height    :: Integer
        , duration  :: Integer
        , thumb     :: PhotoSize
        , mime_type :: Maybe String
        , file_size :: Maybe Integer
        , caption   :: Maybe String }
  deriving (Read, Show, Generic)

instance FromJSON Video
instance ToJSON Video
