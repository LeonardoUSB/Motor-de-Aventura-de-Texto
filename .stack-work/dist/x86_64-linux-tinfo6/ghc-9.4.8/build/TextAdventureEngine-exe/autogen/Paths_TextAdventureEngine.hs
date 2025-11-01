{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_TextAdventureEngine (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/leokoto/Escritorio/Haskel/base_proyecto1/.stack-work/install/x86_64-linux-tinfo6/0aa10e5e3100801a80515b75873d8a1632330f503c075d226870baeb3ef533e6/9.4.8/bin"
libdir     = "/home/leokoto/Escritorio/Haskel/base_proyecto1/.stack-work/install/x86_64-linux-tinfo6/0aa10e5e3100801a80515b75873d8a1632330f503c075d226870baeb3ef533e6/9.4.8/lib/x86_64-linux-ghc-9.4.8/TextAdventureEngine-0.1.0.0-KHCfN7tAF6sGPKtcNuffM-TextAdventureEngine-exe"
dynlibdir  = "/home/leokoto/Escritorio/Haskel/base_proyecto1/.stack-work/install/x86_64-linux-tinfo6/0aa10e5e3100801a80515b75873d8a1632330f503c075d226870baeb3ef533e6/9.4.8/lib/x86_64-linux-ghc-9.4.8"
datadir    = "/home/leokoto/Escritorio/Haskel/base_proyecto1/.stack-work/install/x86_64-linux-tinfo6/0aa10e5e3100801a80515b75873d8a1632330f503c075d226870baeb3ef533e6/9.4.8/share/x86_64-linux-ghc-9.4.8/TextAdventureEngine-0.1.0.0"
libexecdir = "/home/leokoto/Escritorio/Haskel/base_proyecto1/.stack-work/install/x86_64-linux-tinfo6/0aa10e5e3100801a80515b75873d8a1632330f503c075d226870baeb3ef533e6/9.4.8/libexec/x86_64-linux-ghc-9.4.8/TextAdventureEngine-0.1.0.0"
sysconfdir = "/home/leokoto/Escritorio/Haskel/base_proyecto1/.stack-work/install/x86_64-linux-tinfo6/0aa10e5e3100801a80515b75873d8a1632330f503c075d226870baeb3ef533e6/9.4.8/etc"

getBinDir     = catchIO (getEnv "TextAdventureEngine_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "TextAdventureEngine_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "TextAdventureEngine_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "TextAdventureEngine_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "TextAdventureEngine_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "TextAdventureEngine_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
