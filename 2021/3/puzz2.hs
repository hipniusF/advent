import System.IO
import Data.Char (digitToInt)
import Data.Typeable (typeOf)
import Data.List.Split (endBy)
import Data.List (foldl')

main :: IO()
main = do
    f <- openFile "input" ReadMode
    contents <- hGetContents f
    let nums = endBy "\n" contents 
    let oxy = extractNum nums mostFilter 0
    let co2 = extractNum nums leastFilter 0
    print $ "Oxy=" ++ show oxy
    print $ "CO2=" ++ show co2
    print $ "MUL=" ++ show (oxy * co2)
    hClose f

type FilterFn = [String] -> Int -> Int -> [String]

extractNum :: [String] -> FilterFn -> Int -> Int
extractNum [a] filter i = toDec a
extractNum nums filter i = extractNum (filter nums ones i) filter (i + 1)
   where ones = countOnes (map (\x -> x !! i) nums)

mostFilter :: FilterFn
mostFilter nums ones i = filter (\x -> (x!!i) == (if ones*2 >= length nums then '1' else '0')) nums

leastFilter :: FilterFn
leastFilter nums ones i = filter (\x -> (x!!i) == (if ones*2 < length nums then '1' else '0')) nums

countOnes :: String -> Int
countOnes = foldr (\x acc -> acc + if (x == '1') then 1 else 0) 0

toDec :: String -> Int
toDec = foldl' (\acc x -> acc * 2 + digitToInt x) 0
