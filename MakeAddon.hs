import System.Directory (listDirectory)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    case args of
        ["--full-addon"] -> genToc >> genLua
        _ -> genLua

genToc :: IO ()
genToc = writeFile "SharedMedia_Shards.toc" tocString

tocString :: String
tocString =
    "## Interface: 90005\n" ++
    "## Title: SharedMedia Shards\n" ++
    "## Author: James Burton\n" ++
    "## Version: 1.0\n" ++
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
    "LSM:Register(\"sound\", \"|cff7f58dbYeti|r\", [[Interface\\Addons\\SharedMedia_Shards\\sound\\" ++ fname ++ "]])\n"