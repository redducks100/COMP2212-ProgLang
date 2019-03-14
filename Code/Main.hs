import Tokens
import Grammar
import System.Environment
import Control.Exception
import System.IO


main :: IO ()
main = catch main' noParse

main' = do sourceText <- readFile "lang.txt"
           putStrLn ("Parsing : " ++ sourceText)
           let tokens = alexScanTokens sourceText
           putStrLn ("Tokens: " ++ show tokens)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg))
        

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()