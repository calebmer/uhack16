module Crawl where

import Native.Crawl
import App.Model exposing (SiteMetadata)

getSiteMetadata : String -> SiteMetadata
getSiteMetadata = Native.Crawl.getSiteMetadata
