import System.IO

main :: IO()
main = do
    f <- openFile "input" ReadMode
    prevText <- hGetLine f
    n <- countLarger f (read prevText)
    print n
    hClose f

countLarger :: Handle -> Int -> IO Int
countLarger f prev = do
    inEOF <- hIsEOF f
    if inEOF
       then return 0
       else do
           text <- hGetLine f
           let num = read text :: Int
           nextNumb <- countLarger f num
           return $ (boolToInt (num > prev)) + nextNumb
               where boolToInt b = if b
                                      then 1
                                      else 0
