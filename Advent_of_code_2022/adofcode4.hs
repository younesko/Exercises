--advent of code day 4

-- clean the string from ',' and '-' chars

cc :: [Char] -> [Char]
cc [] = []
cc (x:xs) 
    | x ==',' = ' ':(cc xs)
    | x =='-' = ' ':(cc xs)
    | otherwise = x:(cc xs)

-- transforms the cleaned string to list of numbers
s_to_int :: String ->[Int]
s_to_int stringa = map (\x -> read x ::Int) (words stringa)

-- check if elements (x,y) and (z, w) are included in each others range
checknum :: [Int] -> Bool

checknum [] = False
checknum (_:[]) = False
checknum (_:_:[])= False
checknum (_:_:_:[]) = False
checknum (x:y:z:w:xs) 
    | (x >= z) && (w >= y) = True  -- the second pair contains the first one
    | (x<=z) && (y>=w) = True     -- opposite of above
    | otherwise = False



main = do
    myinput <- readFile "mypath\\input4.txt"
    let aa = map checknum (map s_to_int (map cc (words myinput)))
    let rix = length (filter (\x -> x==True) aa)
    print (rix)
	