module Ex3 where

--required for all Qs:
data GExpr -- the expression datatype
  = Number Float -- floating-point value
  | Variable String -- variable/identifier name
  | Div GExpr GExpr -- divide first by second
  | Diff GExpr GExpr -- subtracts second from first
  | Absolute GExpr -- absolute value
  -- the following are boolean expressions (using numbers)
  -- the number 0.0 represents False, all others represent True.
  | Not GExpr -- logical not
  | Smaller GExpr GExpr -- True if first is less than second
  | IsZero GExpr -- True if numeric value is zero
  deriving (Eq,Ord,Show)

type Dict = [(String,Float)]
insert :: String -> Float -> Dict -> Dict
insert s f d = (s,f):d
find :: String -> Dict -> Maybe Float
find s [] = Nothing
find s ((t,f):d)
  | s==t       =  Just f
  | otherwise  =  find s d

-- DON'T RENAME THE SPECIFIED TYPES OR FUNCTIONS
-- DON'T MODIFY ANYTHING ABOVE THIS LINE

-- Q1 (8 marks)
-- implement the following function (which may have runtime errors):
eval :: Dict -> GExpr -> Float
eval _ _ = error "Ex3Q1: eval not yet defined"

-- Q2 (8 marks)
-- implement the following function (which always returns a value):
meval :: Dict -> GExpr -> Maybe Float
meval _ _ = error "Ex3Q2: meval not yet defined"

-- Q3 (4 marks)
-- Laws of Arithmetic for this question:
--    x + 0 = x
--    0 + x = x
--    x - 0 = x
--    x - x = 0
--    x * 0 = 0
--    1 * x = x
-- The following function should implement the two laws applicable
-- for *your* GExpr datatype.
simp :: GExpr -> GExpr
simp _ = error "Ex3Q3: simp not yet defined"

-- add extra material below here
-- e.g.,  helper functions, test values, etc. ...

