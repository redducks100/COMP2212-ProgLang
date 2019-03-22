module Eval where
  import Grammar
  import System.Environment
  import Control.Exception
  import System.IO
  import Data.List
  
  --data Expr 
  --    = ExprString String 
   ---- | ExprNot Expr 
   --   | ExprOp Expr Op Expr 
   --   | ExprCompareOp Expr CompareOp Expr 
   --   | ExprInt Int 
    --  | ExprBool Bool 
    --  | ExprIdent Ident 
   --   | ExprExpr Expr
   --   | ExprArrayAssign ExprList 
   --   | ExprArrayValue Ident Int
   --   | ExprError
    --  deriving (Show, Eq)
  
  -- data Statement
  -- = Statement String
  -- | StatementIfElse Expr StatementList StatementList---------
  -- | StatementWhile Expr StatementList---------------------
  -- | StatementPrint Expr-----------------------------------
  -- | StatementAssign Ident Expr
  -- | StatementArrayAssign Ident Int Expr
  -- | StatementVarDeclr VarDeclr
  -- | StatementArrayDeclr ArrayDeclr
  -- | StatementError
  -- deriving (Show, Eq)

  type Environment = [(String, Expr)]
  
  prettyPrint :: Expr -> String
  prettyPrint (ExprInt x) = show x
  prettyPrint (ExprBool x) = show x
  prettyPrint (ExprString x) = read $ "\"" ++ x ++ "\""
  prettyPrint e = show e 


  addEnv :: Environment -> [Environment] -> [Environment]
  addEnv e env = e : env

  checkIfNothing :: Expr -> Bool
  checkIfNothing ExprNothing = True
  checkIfNothing _ = False

  getValueBinding :: String -> [Environment] -> Expr
  getValueBinding x [] = error ("Variable binding '" ++ x ++ "' not found")
  getValueBinding x (e:env) | checkIfNothing currentFoundBinding = getValueBinding x env
                            | otherwise = currentFoundBinding 
                            where currentFoundBinding = getValueBindingInd x e
  
  getValueBindingInd :: String -> Environment -> Expr
  getValueBindingInd x [] = ExprNothing
  getValueBindingInd x ((y,e):env) | x == y && isEmpty e == False = e
                                   | x == y && isEmpty e = error ("Variable '" ++ x ++ "' is not initialised with a value!")
                                   | otherwise = getValueBindingInd x env

  addBinding :: [Environment] -> String -> Expr -> [Environment]
  addBinding env x e = ((x,e) : (head env)) : tail env
  
  getListValueBinding :: String -> Expr -> [Environment] -> Expr
  getListValueBinding x index [] = error ("Value binding '" ++ x ++ "' not found!")
  getListValueBinding x index (e:env) | checkIfNothing currentFoundBinding = getListValueBinding x index env
                                      | otherwise = currentFoundBinding 
                                      where currentFoundBinding = getListValueBindingInd x index e

  getListValueBindingInd :: String -> Expr -> Environment -> Expr
  getListValueBindingInd x e [] = ExprNothing
  getListValueBindingInd x (ExprInt index) ((y,e):env) | x == y && isArray e = (getExprList e) !! index
                                                       | x == y && (isArray e) == False = error ("Variable '" ++ x ++ "' is not a list")
                                                       | otherwise = getListValueBindingInd x (ExprInt index) env
  getListValueBindingInd x _ _ = error ("Index is not type of integer!")  
                                                  

  updateValueBinding :: String -> Expr -> [Environment] -> [Environment]
  updateValueBinding x ne [] = error ("Value binding '" ++ x ++ "' not found!")
  updateValueBinding x ne (e:env) | lastEnvCheck == e = e : updateValueBinding x ne env
                                  | otherwise = lastEnvCheck : env
                                  where lastEnvCheck = updateValueBindingInd x ne e 
  
  updateValueBindingInd :: String -> Expr -> Environment -> Environment
  updateValueBindingInd x ne [] = []
  updateValueBindingInd x ne ((y,e):env) | x == y && isArray ne && isArray e = (x,ne) : env
                                         | x == y && (isArray ne) == False && (isArray e) == False = (x,ne) : env
                                         | x /= y = (y,e) : (updateValueBindingInd x ne env)
                                         | (isArray ne) == False && isArray e = error ("'" ++ x ++ "': You cannot assign a single expression to a list!")                             
                                         | isArray ne && (isArray e) == False = error ("'" ++ x ++ "': You cannot assign an expression list to a variable!")

  updateListValueBinding :: String -> Expr -> Expr -> [Environment] -> [Environment]
  updateListValueBinding x ne index [] = error ("Value binding '" ++ x ++ "' not found!")
  updateListValueBinding x ne index (e:env) | lastEnvCheck == e = e : updateListValueBinding x ne index env
                                            | otherwise = lastEnvCheck : env
                                            where lastEnvCheck = updateListValueBindingInd x ne index e 

  updateListValueBindingInd :: String -> Expr -> Expr -> Environment -> Environment
  updateListValueBindingInd x ne index [] = []
  updateListValueBindingInd x ne (ExprInt index) ((y,e): env) | x == y && (isArray ne) == False && isArray e = (x, ExprArrayAssign (replaceNth index ne (getExprList e))) : env
                                                              | x == y && (isArray ne) == False && (isArray e) == False = error ("'" ++ x ++ "': Variable is not a list!") 
                                                              | x == y && isArray ne && isArray e = error ("'" ++ x ++ "': You cannot assign a list to a variable!") 
                                                              | x /= y = (y,e) : (updateListValueBindingInd x ne (ExprInt index) env)
  updateListValueBindingInd x ne _ _ = error ("Index is not type of integer!")  

  replaceNth :: Int -> a -> [a] -> [a]
  replaceNth _ _ [] = error ("Index out of range!")
  replaceNth n newVal (x:xs) | n == 0 = newVal:xs
                             | otherwise = x:replaceNth (n-1) newVal xs

  getExprList :: Expr -> [Expr]
  getExprList (ExprArrayAssign x) = x
  getExprList _ = []                                

  isArray :: Expr -> Bool
  isArray (ExprArrayAssign _) = True
  isArray _ = False
  
  isEmpty :: Expr -> Bool
  isEmpty (ExprArrayAssign []) = True
  isEmpty ExprEmpty = True
  isEmpty _ = False

  isValueFree :: String -> [Environment] -> Bool
  isValueFree x [] = True
  isValueFree x (e:env) | lastEnvCheck = isValueFree x env
                        | otherwise = False
                        where lastEnvCheck = isValueFreeInd x e

  isValueFreeInd :: String -> Environment -> Bool
  isValueFreeInd x [] = True
  isValueFreeInd x ((y,e):env) | x == y = False
                               | otherwise = isValueFreeInd x env

  isValue :: Expr -> Bool
  isValue (ExprInt _) = True
  isValue (ExprBool _) = True
  isValue (ExprString _) = True
  isValue _ = False


  evaluateExprNot :: Expr -> Expr
  evaluateExprNot (ExprBool x) = ExprBool (not x)
  evaluateExprNot _ = error "EvaluateExprNot: Invalid type"

  evaluateExprOp :: Expr -> Op -> Expr -> Expr
  evaluateExprOp (ExprInt x1) Plus (ExprInt x2) = ExprInt (x1+x2)
  evaluateExprOp (ExprInt x1) Minus (ExprInt x2) = ExprInt (x1-x2)
  evaluateExprOp (ExprInt x1) Multiply (ExprInt x2) = ExprInt (x1*x2)
  evaluateExprOp (ExprInt x1) Divide (ExprInt x2) = ExprInt (x1 `div` x2)
  evaluateExprOp (ExprInt x1) Power (ExprInt x2) = ExprInt (x1 ^ x2)
  evaluateExprOp (ExprString x1) Plus (ExprString x2) = ExprString (x1 ++ x2)
  evaluateExprOp (ExprArrayAssign x1) Plus (ExprArrayAssign x2) = ExprArrayAssign (x1 ++ x2)
  evaluateExprOp _ _ _ = error "EvaluateExprOp: Invalid type (Expected type INT or STRING/LIST { only concatenation works: '+'})"

  evaluateExprComp :: Expr -> CompareOp -> Expr -> Expr
  evaluateExprComp (ExprInt x1) GreaterThan (ExprInt x2) = ExprBool (x1 > x2)
  evaluateExprComp (ExprInt x1) LessThan (ExprInt x2) = ExprBool (x1 < x2)
  evaluateExprComp (ExprInt x1) GreaterOrEqualThan (ExprInt x2) = ExprBool (x1 >= x2)
  evaluateExprComp (ExprInt x1) LessOrEqualThan (ExprInt x2) = ExprBool (x1 <= x2)
  evaluateExprComp (ExprInt x1) Equals (ExprInt x2) = ExprBool (x1 == x2)


  evaluateExprComp (ExprBool x1) And (ExprBool x2) = ExprBool (x1 && x2)
  evaluateExprComp (ExprBool x1) Or (ExprBool x2) = ExprBool (x1 || x2)

  evaluateExprComp (ExprString x1) GreaterThan (ExprString x2) = ExprBool (length x1 > length x2)
  evaluateExprComp (ExprString x1) LessThan (ExprString x2) = ExprBool (length x1 < length x2)
  evaluateExprComp (ExprString x1) GreaterOrEqualThan (ExprString x2) = ExprBool (length x1 >= length x2)
  evaluateExprComp (ExprString x1) LessOrEqualThan (ExprString x2) = ExprBool (length x1 <= length x2)
  evaluateExprComp (ExprString x1) Equals (ExprString x2) = ExprBool (x1 == x2)

  evaluateExprComp _ _ _ = error "EvaluateExprComp: Cannot compare different types"

  evaluateExprList :: [Expr] -> [Environment] -> [Expr]
  evaluateExprList [] _ = []
  evaluateExprList (e:es) env = (evaluateExpr e env) : evaluateExprList es env

  evaluateExpr :: Expr -> [Environment] -> Expr
  --evaluate expressions with operations (+,-,/,*,^)
  evaluateExpr (ExprArrayAssign e) env = ExprArrayAssign (evaluateExprList e env)  

  evaluateExpr (ExprOp (ExprIdent x1) p (ExprIdent x2)) env = evaluateExpr (ExprOp (getValueBinding x1 env) p (getValueBinding x2 env)) env
  evaluateExpr (ExprOp (ExprIdent x1) p x2) env = evaluateExpr (ExprOp (getValueBinding x1 env) p x2) env
  evaluateExpr (ExprOp x1 p (ExprIdent x2)) env = evaluateExpr (ExprOp x1 p (getValueBinding x2 env)) env

  evaluateExpr (ExprOp x1 p x2) env | isValue x1 && isValue x2 = evaluateExprOp x1 p x2
                                    | isValue x1 == False && isValue x2 = evaluateExprOp (evaluateExpr x1 env) p x2
                                    | isValue x2 == False && isValue x1 = evaluateExprOp x1 p (evaluateExpr x2 env)
                                    | otherwise = evaluateExprOp (evaluateExpr x1 env) p (evaluateExpr x2 env)
  --evaluate expressions with compare operations (<,>,<=,>=,==,and,or)
  evaluateExpr (ExprCompareOp (ExprIdent x1) p (ExprIdent x2)) env = evaluateExpr (ExprCompareOp (getValueBinding x1 env) p (getValueBinding x2 env)) env
  evaluateExpr (ExprCompareOp (ExprIdent x1) p x2) env = evaluateExpr (ExprCompareOp (getValueBinding x1 env) p x2) env
  evaluateExpr (ExprCompareOp x1 p (ExprIdent x2)) env = evaluateExpr (ExprCompareOp x1 p (getValueBinding x2 env)) env
  evaluateExpr (ExprCompareOp x1 p x2) env | isValue x1 && isValue x2 = evaluateExprComp x1 p x2
                                    | isValue x1 == False && isValue x2 = evaluateExprComp (evaluateExpr x1 env) p x2
                                    | isValue x2 == False && isValue x1 = evaluateExprComp x1 p (evaluateExpr x2 env)
                                    | otherwise = evaluateExprComp (evaluateExpr x1 env) p (evaluateExpr x2 env)    
  --evaluate not expressions
  evaluateExpr (ExprNot (ExprIdent x1)) env = evaluateExpr (ExprNot (getValueBinding x1 env)) env
  evaluateExpr (ExprNot x1) env | isValue x1 = evaluateExprNot x1
                                | otherwise = evaluateExprNot (evaluateExpr x1 env) 
  --evaluate expressions surrounded by paranthesises
  evaluateExpr (ExprExpr (ExprIdent x1)) env = evaluateExpr (getValueBinding x1 env) env
  evaluateExpr (ExprExpr x1) env = evaluateExpr x1 env
                                
  evaluateExpr (ExprArrayValue i e) env = getListValueBinding i (evaluateExpr e env) env
  evaluateExpr (ExprIdent i) env = getValueBinding i env
  evaluateExpr x env | isValue x = x
                     | otherwise = error ("Not implemented");


  checkIfBoolAndTrue :: Expr -> Bool
  checkIfBoolAndTrue (ExprBool True) = True
  checkIfBoolAndTrue (ExprBool False) = False
  checkIfBoolAndTrue _ = error ("Couldn't match the given expression with the bool type!");

  evaluateStatementPrint :: Statement -> [String] -> [Environment] -> IO([Environment])
  evaluateStatementPrint (StatementPrint e) input env = do putStrLn (prettyPrint (evaluateExpr e env))
                                                           return env
  
  evaluateProgram :: Program -> [[Int]] -> IO([Environment])
  evaluateProgram (Program ss) input = evaluateStatementList ss input [[]]

  evaluateStatementList :: [Statement] -> [[Int]] -> [Environment] -> IO([Environment])
  evaluateStatementList [] input env = do return (env)
  evaluateStatementList (s:ss) input env = do newEnv <- evaluateStatement s input env
                                              nextLine <- evaluateStatementList ss input newEnv
                                              return (nextLine)

  evaluateStatement :: Statement -> [[Int]] -> [Environment] -> IO([Environment])
  evaluateStatement (StatementVarDeclr (VarDeclrOnly t i)) input env = do if isValueFree i env 
                                                                          then return (addBinding env i ExprEmpty)
                                                                          else error "Variable name is in use."

  evaluateStatement (StatementVarDeclr (VarDeclrAssign t i e)) input env = do if isValueFree i env
                                                                              then return (addBinding env i (evaluateExpr e env))
                                                                              else error "Variable name is in use."
  
  evaluateStatement (StatementArrayDeclr (ArrayDeclrOnly t i)) input env = do if isValueFree i env
                                                                              then return (addBinding env i (ExprArrayAssign []))
                                                                              else error "Variable name is in use."
  
  evaluateStatement (StatementArrayDeclr (ArrayDeclrAssign t i e)) input env = do if isValueFree i env
                                                                                  then return (addBinding env i (evaluateExpr e env))
                                                                                  else error "Variable name is in use."

  evaluateStatement (StatementArrayAssign i index e) input env = return (updateListValueBinding i (evaluateExpr e env) (evaluateExpr index env) env)

  evaluateStatement (StatementAssign i e) input env = return (updateValueBinding i (evaluateExpr e env) env)
  
  evaluateStatement (StatementIfElse (ExprBool expr) s1 s2) input env = do if expr 
                                                                           then do s1Eval <- evaluateStatementList s1 input ([]:env)
                                                                                   return (tail s1Eval)
                                                                           else do s2Eval <- evaluateStatementList s2 input ([]:env)
                                                                                   return (tail s2Eval)
  evaluateStatement (StatementIfElse (ExprInt e) _ _) _ _ = error ("Couldn't match the given expression with the bool type!");
  evaluateStatement (StatementIfElse (ExprString e) _ _) _ _  = error ("Couldn't match the given expression with the bool type!");                                                         

  evaluateStatement (StatementIfElse e s1 s2) input env = evaluateStatement (StatementIfElse (evaluateExpr e env) s1 s2) input env

  evaluateStatement (StatementWhile e s) input env = do if checkIfBoolAndTrue (evaluateExpr e env)
                                                        then do sEval <- evaluateStatementList s input ([]:env)
                                                                nextEval <- evaluateStatement (StatementWhile e s) input (tail sEval)
                                                                return (nextEval) 
                                                        else return (env)  

  evaluateStatement (StatementPrint e) input env = evaluateStatementPrint (StatementPrint e) input env