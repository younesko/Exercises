-- Advent of code day 5 
-- cerca di scoprire perchè rico da liste innestate 

-- parse the ship cargo to 

fun1 s = map (\x -> take 3 x) s
fun2 s = map (\x -> drop 4 x) s

r s = (map  fun1 (iterate fun2 s)) -- vertical cargos stored as infinite list (read documentation of iterate)



--returns a list on ints [numb_of_items, src, dst]
comd (_:x:_:y:_:z:xs) = map (\x -> read x ::Int) [x,y,z] 

-- execute comand on cargo

extract_in (x:y:z:[]) cargo = (reverse (take x (cargo!!(y-1))))++(cargo!!(z-1)) --crane destination
extract_out (x:y:z:[]) cargo = drop x (cargo!!(y-1)) -- crane source

--rico(mbine) together the lists of the cargo that are moved (works only if y<z), first function acts on 
--first part that goes out and the second function on the part that goes in

rico1 (x:y:z:[]) cargo = (init(fst(splitAt y cargo)))++[(extract_out (x:y:z:[]) cargo)]++(snd(splitAt y cargo))

rico2 (x:y:z:[]) cargo = (init(fst(splitAt z cargo)))++[(extract_in (x:y:z:[]) cargo)]++(snd(splitAt z cargo))

-- is y bigger than z? to ensure the rico(mbination) functions work properly
isyBz (x:y:z:[]) 
    | y>z = (x:z:y:[])
    | otherwise = (x:y:z:[])


main = do
    myinput <- readFile "path\\input5.txt"
    let aa = lines myinput
    let rix = map (filter (/= "   ")) (take 9 (r (take 8 aa))) --this has the cargo listed vertically with no spaces
    let inst = map (isyBz) (map comd (map words (drop 10 aa))) -- apply instruction that now are a list on Int
    --let test1 = rico1 [1,3,4] rix 
    let finale = map (\x -> rico2 x (rico1 x rix)) inst 
    mapM_ print (last finale)

