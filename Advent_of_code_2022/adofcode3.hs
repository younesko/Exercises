
-- Part one and two Advent of code day 3
import Data.List


-- divide a single rucksack in two
first_p :: [Char] -> [Char]
first_p s = take (div (length s )2) s 

last_p :: [Char] -> [Char]
last_p s = drop (div (length s )2) s

-- Element in common in the same rucksack

comn :: [Char] -> Char
comn s = nub (filter (\x -> elem x (first_p s) ) (last_p s))

-- Element in common among the 3 elfs
comn2 :: [[Char]] -> [Char]
comn2 [] = []
comn2 (_:[]) = []
comn2 (_:_:[])=[]
comn2 (x:y:z:xs)=  nub (filter (\j -> elem j z) (filter (\i -> elem i x) y)) ++ (comn2 xs)

--create a string with all common letters and then evaluate them

testc :: [(Char, Int)]
testc = zip (['a'..'z']++['A'..'Z']) [1..]

f :: Char -> [(Char, Int)]-> Int

f _ [] = 0

f a ((alfa, beta):xs)
    | (a == alfa)  =  beta
    | otherwise = f a (xs)
    
mypath = "input" -- filepath

main = do 
    myinput <- readFile mypath
    let rix1 = sum ( map (\x -> f x testc) (map  comn  (words myinput)) ) -- Solving the first problem
    let rix2 = sum ( map (\x -> f x testc) (comn2 (words myinput))) -- Solving the second problem
    print (rix)
    print (rix)
