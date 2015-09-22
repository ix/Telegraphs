{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs.Voice where

import Data.Aeson
import GHC.Generics

data Voice =
  Voice { file_id   :: String
        , duration  :: Integer
        , mime_type :: Maybe String
        , file_size :: Maybe Integer }
  deriving (Read, Show, Generic)

instance FromJSON Voice
instance ToJSON Voice
