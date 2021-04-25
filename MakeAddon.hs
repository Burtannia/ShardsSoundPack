import System.Directory (listDirectory)
import System.Environment (getArgs)

title, dir :: String
title = "Shards Sound Pack"
dir = filter (not . (==) ' ') title

main :: IO ()
main = genLua

genLua :: IO ()
genLua = do
    fs <- listDirectory "sound"
    let contents = luaString fs
    writeFile "main.lua" contents

luaString :: [FilePath] -> String
luaString fs = "local LSM = LibStub(\"LibSharedMedia-3.0\")\n\n" ++ regs
    where
        regs = concatMap mkRegister fs

mkRegister :: String -> String
mkRegister fname =
    "LSM:Register(\"sound\", \"|cff7f58dbYeti|r\", [[Interface\\Addons\\" ++ dir ++ "\\sound\\" ++ fname ++ "]])\n"