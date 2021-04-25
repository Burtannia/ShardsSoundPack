import System.Directory (listDirectory)
import System.Environment (getArgs)

interface, title, author, version :: String
interface = "90005"
title = "Shards Sound Pack"
author = "James Burton"
version = "1.0"

dir :: String
dir = filter (not . (==) ' ') title

main :: IO ()
main = do
    args <- getArgs
    case args of
        ["--full-addon"] -> genToc >> genLua
        _ -> genLua

genToc :: IO ()
genToc = writeFile tocName tocString
    where
        tocName = dir ++ ".toc"

tocString :: String
tocString =
    "## Interface: " ++ interface ++ "\n" ++
    "## Title: " ++ title ++ "\n" ++
    "## Author: " ++ author ++ "\n" ++
    "## Version: " ++ version ++ "\n" ++
    "\n" ++
    "main.lua\n"

genLua :: IO ()
genLua = do
    fs <- listDirectory "sound"
    let contents = luaString fs
    writeFile "main.lua" contents

luaString :: [FilePath] -> String
luaString fs = "local LSM = LibStub(\"LibSharedMedia-3.0\")\n\n" ++ regs
    where
        regs = map mkRegister fs

mkRegister :: String -> String
mkRegister fname =
    "LSM:Register(\"sound\", \"|cff7f58dbYeti|r\", [[Interface\\Addons\\" ++ dir ++ "\\sound\\" ++ fname ++ "]])\n"