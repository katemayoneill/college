{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_ex1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kate/college/third-year/CSU34016-introduction-to-functional-programming/Exercise1/.stack-work/install/x86_64-linux-tinfo6/b8e0b315989fdca3660fdf8fbfd67c7ea747163095366bdc50e3ed8834cb6f8f/8.10.7/bin"
libdir     = "/home/kate/college/third-year/CSU34016-introduction-to-functional-programming/Exercise1/.stack-work/install/x86_64-linux-tinfo6/b8e0b315989fdca3660fdf8fbfd67c7ea747163095366bdc50e3ed8834cb6f8f/8.10.7/lib/x86_64-linux-ghc-8.10.7/ex1-1.0.0.0-8oxrxAlQlWdB6f4o101HbG-ex1"
dynlibdir  = "/home/kate/college/third-year/CSU34016-introduction-to-functional-programming/Exercise1/.stack-work/install/x86_64-linux-tinfo6/b8e0b315989fdca3660fdf8fbfd67c7ea747163095366bdc50e3ed8834cb6f8f/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/kate/college/third-year/CSU34016-introduction-to-functional-programming/Exercise1/.stack-work/install/x86_64-linux-tinfo6/b8e0b315989fdca3660fdf8fbfd67c7ea747163095366bdc50e3ed8834cb6f8f/8.10.7/share/x86_64-linux-ghc-8.10.7/ex1-1.0.0.0"
libexecdir = "/home/kate/college/third-year/CSU34016-introduction-to-functional-programming/Exercise1/.stack-work/install/x86_64-linux-tinfo6/b8e0b315989fdca3660fdf8fbfd67c7ea747163095366bdc50e3ed8834cb6f8f/8.10.7/libexec/x86_64-linux-ghc-8.10.7/ex1-1.0.0.0"
sysconfdir = "/home/kate/college/third-year/CSU34016-introduction-to-functional-programming/Exercise1/.stack-work/install/x86_64-linux-tinfo6/b8e0b315989fdca3660fdf8fbfd67c7ea747163095366bdc50e3ed8834cb6f8f/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ex1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ex1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ex1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ex1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ex1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ex1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
