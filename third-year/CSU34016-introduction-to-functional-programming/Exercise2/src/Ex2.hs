module Ex2 where

add :: Int -> Int -> Int
add x y = (x+y) `mod` 65563

mul :: Int -> Int -> Int
mul x y
  | p == 0    = 1
  | otherwise = p
  where p = (x*y) `mod` 65563

-- DON'T RENAME THE SPECIFIED FUNCTIONS (f1..fN)
-- DON'T MODIFY ANYTHING ABOVE THIS LINE

-- Q1 (3 marks)
f1 :: [a] -> [a]
-- returns a list of every 162nd element of its input
f1 xs = undefined

-- Q2 (3 marks)
f2 :: [Int] -> Int
-- sums every 249th element of its input
f2 ns = undefined

-- Q3 (4 marks)
f3 :: [Int] -> Int
-- multiplies every 313th element of its input
f3 ns = undefined

-- Q4 (8 marks)
f4 :: [Maybe Int] -> (Int,[Maybe Int])
-- Operation Table (See Exercise2 description on BB)
--    ___________________________________________
--    | opcode | operation | operands | Nothing |
--    -------------------------------------------
--    |   42   |    add    | fixed 5  | term    |
--    |   65   |    add    | fixed 6  | skip    |
--    |   47   |    add    | fixed 5  | 7       |
--    |   22   |    add    | stop@ 3  | term    |
--    |   50   |    add    | stop@ 5  | skip    |
--    |   30   |    add    | stop@ 5  | 8       |
--    |   88   |    mul    | fixed 4  | term    |
--    |   63   |    mul    | fixed 6  | skip    |
--    |   14   |    mul    | fixed 6  | 4       |
--    |   56   |    mul    | stop@ 6  | term    |
--    |   70   |    mul    | stop@ 3  | skip    |
--    |   80   |    mul    | stop@ 5  | 2       |
--    -------------------------------------------
f4 mis = undefined

-- Q5 (2 marks)
f5 :: [Maybe Int] -> [Int]
-- uses f4 to process all the opcodes in the maybe list,
-- by repeatedly applying it to the leftover part
f5 mis = undefined

-- add extra material below here
-- e.g.,  helper functions, test values, etc. ...

