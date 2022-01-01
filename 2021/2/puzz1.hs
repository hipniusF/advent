import System.IO
main :: IO ()
main = do
    f <- openFile "input" ReadMode
    movs <- getMoves f
    let hor = foldl foldHor 0 movs
    let ver = foldl foldVer 0 movs
    putStrLn $ "Hor=" ++ (show hor)
    putStrLn $ "Vor=" ++ (show ver)
    putStrLn $ "MUL=" ++ (show $ ver*hor)

foldHor :: Int -> (String, Int) -> Int
foldHor prev (dir,val) = case dir of
                         "forward" -> prev + val
                         otherwise -> prev

foldVer :: Int -> (String, Int) -> Int
foldVer prev (dir,val) = case dir of
                         "down" -> prev + val
                         "up" -> prev - val
                         otherwise -> prev

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

