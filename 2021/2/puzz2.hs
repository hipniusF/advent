import System.IO
main :: IO ()
main = do
    f <- openFile "input" ReadMode
    movs <- getMoves f
    let hor = foldl foldHor 0 movs
    let ver = calcVer movs 0
    putStrLn $ "Hor=" ++ (show hor)
    putStrLn $ "Vor=" ++ (show ver)
    putStrLn $ "MUL=" ++ (show $ ver*hor)

foldHor :: Int -> (String, Int) -> Int
foldHor prev (dir,val) = case dir of
                         "forward" -> prev + val
                         otherwise -> prev

calcVer [] _ = 0
calcVer ((dir, val) : xs) aim
  | dir == "forward" = val * aim + calcVer xs aim
  | dir == "down" = calcVer xs (aim + val)
  | dir == "up" = calcVer xs (aim - val)

getMoves :: Handle -> IO [(String, Int)]
getMoves f = do
    isEOF <- hIsEOF f
    if isEOF
       then return []
       else do
           text <- hGetLine f
           rest <- getMoves f
           let (dir : val : _) = words text
           return $ [(dir, read val)] ++ rest

