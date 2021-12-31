import System.IO

main :: IO ()
main = do
    f <- openFile "input" ReadMode
    measurements <- readMeasurInput f
    let packs = createWindow measurements
    let _sum = map (\(x, y, z) -> x+y+z) packs
    print $ countLarger _sum
        where createWindow arr = zip3 arr (tail arr) (tail $ tail arr)

readMeasurInput :: Handle -> IO [Int]
readMeasurInput f = do
    isEOF <- hIsEOF f
    if isEOF
       then return []
       else do
           text <- hGetLine f
           restMeasur <- readMeasurInput f
           return $ (read text) : restMeasur

countLarger :: [Int] -> Int
countLarger [] = 0
countLarger [_] = 0
countLarger (x1 : x2 : xs) = boolToInt (x2 > x1) + countLarger (x2 : xs)
    where boolToInt b = if b
                            then 1
                            else 0
