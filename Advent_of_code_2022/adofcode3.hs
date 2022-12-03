
-- Part one day 3 Advent of code

-- divide first element in two
first_p :: [Char] -> [Char]
first_p s = take (div (length s )2) s 

last_p :: [Char] -> [Char]
last_p s = drop (div (length s )2) s

-- gives the element in common

comn :: [Char] -> Char
comn s = filter (\x -> elem x (first_p s) ) (last_p s)!! 0

--create a string with all common letters and then evaluate them

testc :: [(Char, Int)]
testc = zip (['a'..'z']++['A'..'Z']) [1..]

f :: Char -> [(Char, Int)]-> Int

f _ [] = 0

f a ((alfa, beta):xs)
    | (a == alfa)  =  beta
    | otherwise = f a (xs)

main = do 
    myinput <- readFile "mypath\\input.txt"
    let rix = sum ( map (\x -> f x testc) (map  comn  (words myinput)) )
    print (rix)
