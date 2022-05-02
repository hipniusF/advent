import System.IO
import Data.Char(digitToInt)

main :: IO ()
main = do
    f <- openFile "input" ReadMode
    nums <- getNumbs f
    hClose f
    let accs = foldr foldNumbs [0 | x <- nums !! 0] nums
    let ones = [ round $ (fromIntegral acc) / (fromIntegral $ length nums) | acc <- accs]
    let gamm_rate = binToInt (reverse ones) 1
    let eps_rate = binToInt (reverse $ getComplement ones) 1
    print $ "Gamma=" ++ (show gamm_rate)
    print $ "Epsil=" ++ (show eps_rate)
    print $ "MUL=" ++ (show $ eps_rate * gamm_rate)

binToInt :: [Int] -> Int -> Int
binToInt [] _ = 0
binToInt (bit : xs) mul = bit * mul + binToInt xs (mul*2)

getComplement :: [Int] -> [Int]
getComplement arr = [1 - x | x <- arr]

foldNumbs :: String -> [Int] -> [Int]
foldNumbs arr prev = map (\(acc, x) -> acc + digitToInt x) (zip prev arr)

getNumbs :: Handle -> IO [String]
getNumbs f = do
    isEOF <- hIsEOF f
    if isEOF
       then return []
       else do
            text <- hGetLine f
            next <- getNumbs f
            return $ text : next
