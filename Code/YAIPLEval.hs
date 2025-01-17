module YAIPLEval where
  import YAIPLGrammar
  import System.Environment
  import Control.Exception
  import System.IO
  
  type Environment = [(String, Type, Expr)]

  typeOfList :: [Expr] -> Maybe Type -> Type
  typeOfList [] Nothing = TypeEmpty
  typeOfList [] (Just t) = t 
  typeOfList (x:xs) Nothing = typeOfList xs (Just (typeOf x))
  typeOfList (x:xs) (Just t) | t == typeOf x = typeOfList xs (Just t)
                             | otherwise = error "You cannot have multiple type in an array!"

  typeOf :: Expr -> Type
  typeOf (ExprInt _) = TypeInt
  typeOf (ExprBool _) = TypeBool
  typeOf (ExprString _) = TypeString
  typeOf (ExprArrayAssign xs) = typeOfList xs Nothing
  typeOf _ = error "Cannot get type"

  prettyPrint :: Expr -> String
  prettyPrint (ExprInt x) = show x
  prettyPrint (ExprBool x) = show x
  prettyPrint (ExprString x) = read $ "\"" ++ x ++ "\""
  prettyPrint e = show e 

  getFirstInput :: [[Int]] -> Int
  getFirstInput [] = error "There is no input left."
  getFirstInput xs = head (head xs)
  

  getLineInput :: [[Int]] -> [Int]
  getLineInput [] = []
  getLineInput xs = head xs
  
  getInputAfterReadLine :: [[Int]] -> [[Int]]
  getInputAfterReadLine xs = tail xs

  getInputAfterRead :: [[Int]] -> [[Int]]
  getInputAfterRead xs | f == [] = (tail xs)
                       | otherwise = f : (tail xs)
                       where f = tail (head xs)
  
  convertIntListToExpr :: [Int] -> [Expr]
  convertIntListToExpr [] = [] 
  convertIntListToExpr (x:xs) = (ExprInt x) : convertIntListToExpr xs

  addEnv :: Environment -> [Environment] -> [Environment]
  addEnv e env = e : env

  checkIfNothing :: Expr -> Bool
  checkIfNothing ExprNothing = True
  checkIfNothing _ = False

  getValueBinding :: String -> [Environment] -> Expr
  getValueBinding x [] = error ("Get: Variable binding '" ++ x ++ "' not found")
  getValueBinding x (e:env) | checkIfNothing currentFoundBinding = getValueBinding x env
                            | otherwise = currentFoundBinding 
                            where currentFoundBinding = getValueBindingInd x e
  
  getValueBindingInd :: String -> Environment -> Expr
  getValueBindingInd x [] = ExprNothing 
  getValueBindingInd x ((y,t,e):env) | x == y && isEmpty e == False = e
                                     | x == y && isEmpty e = error ("Variable '" ++ x ++ "' is not initialised with a value!")
                                     | otherwise = getValueBindingInd x env
  
  addBinding :: [Environment] -> String -> Type -> Expr -> [Environment]
  addBinding env x t e = ((x,t,e) : (head env)) : tail env
  
  getListValueBinding :: String -> Expr -> [Environment] -> Expr
  getListValueBinding x index [] = error ("Get list value: Value binding '" ++ x ++ "' not found!")
  getListValueBinding x index (e:env) | checkIfNothing currentFoundBinding = getListValueBinding x index env
                                      | otherwise = currentFoundBinding 
                                      where currentFoundBinding = getListValueBindingInd x index e

  getListValueBindingInd :: String -> Expr -> Environment -> Expr
  getListValueBindingInd x e [] = ExprNothing
  getListValueBindingInd x (ExprInt index) ((y,t,e):env) | x == y && isArray e = (getExprList e) !! index
                                                         | x == y && (isArray e) == False = error ("Variable '" ++ x ++ "' is not a list")
                                                         | otherwise = getListValueBindingInd x (ExprInt index) env
  getListValueBindingInd x _ _ = error ("Index is not type of integer!")  
                                                  

  updateValueBinding :: String -> Expr -> [Environment] -> [Environment]
  updateValueBinding x ne [] = error ("Update: Value binding '" ++ x ++ "' not found!")
  updateValueBinding x ne (e:env) | snd lastEnvCheck == False = e : updateValueBinding x ne env
                                  | otherwise = (fst lastEnvCheck) : env
                                  where lastEnvCheck = updateValueBindingInd x ne e 
  
  updateValueBindingInd :: String -> Expr -> Environment -> (Environment, Bool)
  updateValueBindingInd x ne [] = ([], False)
  updateValueBindingInd x ne ((y,t,e):env) | x == y && isArray ne && isArray e && typeOf ne == t = ((x,t,ne) : env, True)
                                           | x == y && (isArray ne) == False && (isArray e) == False && typeOf ne == t = ((x,t,ne) : env, True)
                                           | x /= y = ((y,t,e) : (fst nextOne), snd nextOne) 
                                           | (isArray ne) == False && isArray e = error ("'" ++ x ++ "': You cannot assign a single expression to a list!")                             
                                           | isArray ne && (isArray e) == False = error ("'" ++ x ++ "': You cannot assign an expression list to a variable!")
                                           | otherwise = error ("'" ++ x ++ "': You cannot assign a value of type '" ++ (show (typeOf ne)) ++ "' to a variable of type: '" ++ show t ++ "'")
                                         where nextOne = updateValueBindingInd x ne env

  updateListValueBinding :: String -> Expr -> Expr -> [Environment] -> [Environment]
  updateListValueBinding x ne index [] = error ("Update list value: Value binding '" ++ x ++ "' not found!")
  updateListValueBinding x ne index (e:env) | snd lastEnvCheck == False = e : updateListValueBinding x ne index env
                                            | otherwise = (fst lastEnvCheck) : env
                                            where lastEnvCheck = updateListValueBindingInd x ne index e 

  updateListValueBindingInd :: String -> Expr -> Expr -> Environment -> (Environment, Bool)
  updateListValueBindingInd x ne index [] = ([], False)
  updateListValueBindingInd x ne (ExprInt index) ((y,t,e): env) | x == y && (isArray ne) == False && isArray e && typeOf ne == t = ((x,t,ExprArrayAssign (replaceNth index ne (getExprList e))) : env, True)
                                                              | x == y && (isArray ne) == False && (isArray e) == False = error ("'" ++ x ++ "': Variable is not a list!") 
                                                              | x == y && isArray ne && isArray e = error ("'" ++ x ++ "': You cannot assign a list to a variable!") 
                                                              | x /= y = ((y,t,e) : (fst nextOne), (snd nextOne))
                                                              | otherwise = error ("'" ++ x ++ "': You cannot assign a value of type '" ++ (show (typeOf ne)) ++ "' to a member of a list of type: '" ++ show t ++ "'")
                                                              where nextOne = updateListValueBindingInd x ne (ExprInt index) env
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

  getArrayLength :: Expr -> Int
  getArrayLength (ExprArrayAssign e) = length e
  getArrayLength _ = -1

  isEmpty :: Expr -> Bool
  isEmpty ExprEmpty = True
  isEmpty _ = False

  isValueFree :: String -> [Environment] -> Bool
  isValueFree x [] = True
  isValueFree x (e:env) | lastEnvCheck = isValueFree x env
                        | otherwise = False
                        where lastEnvCheck = isValueFreeInd x e

  isValueFreeInd :: String -> Environment -> Bool
  isValueFreeInd x [] = True
  isValueFreeInd x ((y,t,e):env) | x == y = False
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

  evaluateExprList :: [Expr] -> [[Int]] -> [Environment] -> ([Expr], [[Int]])
  evaluateExprList [] input _ = ([], input)
  evaluateExprList (e:es) input env = ((fst evaluatedExpr) : (fst evaluatedExprList), snd evaluatedExprList) 
                                    where evaluatedExpr = evaluateExpr e input env
                                          evaluatedExprList = evaluateExprList es (snd evaluatedExpr) env

  evaluateExpr :: Expr -> [[Int]] -> [Environment] -> (Expr, [[Int]])
  --evaluate expressions with operations (+,-,/,*,^)
  evaluateExpr (ExprArrayAssign e) input env = (ExprArrayAssign (fst evaluatedExpr), snd evaluatedExpr)
                                             where evaluatedExpr = evaluateExprList e input env

  evaluateExpr (ExprOp (ExprIdent x1) p (ExprIdent x2)) input env = evaluateExpr (ExprOp (getValueBinding x1 env) p (getValueBinding x2 env)) input env
  evaluateExpr (ExprOp x1 p x2) input env | isValue x1 && isValue x2 = (evaluateExprOp x1 p x2, input)
                                          | otherwise = (evaluateExprOp (fst evaluatedExpr1) p (fst evaluatedExprComb), snd evaluatedExprComb)
                                          where evaluatedExpr1 = evaluateExpr x1 input env
                                                evaluatedExpr2 = evaluateExpr x2 input env 
                                                evaluatedExprComb = evaluateExpr x2 (snd evaluatedExpr1) env  
  --evaluate expressions with compare operations (<,>,<=,>=,==,and,or)
  evaluateExpr (ExprCompareOp (ExprIdent x1) p (ExprIdent x2)) input env = evaluateExpr (ExprCompareOp (getValueBinding x1 env) p (getValueBinding x2 env)) input env
  evaluateExpr (ExprCompareOp (ExprIdent x1) p x2) input env = evaluateExpr (ExprCompareOp (getValueBinding x1 env) p x2) input env
  evaluateExpr (ExprCompareOp x1 p (ExprIdent x2)) input env = evaluateExpr (ExprCompareOp x1 p (getValueBinding x2 env)) input env
  evaluateExpr (ExprCompareOp x1 p x2) input env | isValue x1 && isValue x2 = (evaluateExprComp x1 p x2, input)
                                                 | otherwise = (evaluateExprComp (fst evaluatedExpr1) p (fst evaluatedExprComb), snd evaluatedExprComb)
                                                 where evaluatedExpr1 = evaluateExpr x1 input env
                                                       evaluatedExpr2 = evaluateExpr x2 input env 
                                                       evaluatedExprComb = evaluateExpr x2 (snd evaluatedExpr1) env    
  --evaluate not expressions
  evaluateExpr (ExprNot (ExprIdent x1)) input env = evaluateExpr (ExprNot (getValueBinding x1 env)) input env
  evaluateExpr (ExprNot x1) input env | isValue x1 = (evaluateExprNot x1, input)
                                      | otherwise = (evaluateExprNot (fst evaluatedExpr), snd evaluatedExpr)
                                      where evaluatedExpr = evaluateExpr x1 input env

  --evaluate expressions surrounded by paranthesises
  evaluateExpr (ExprExpr (ExprIdent x1)) input env = evaluateExpr (getValueBinding x1 env) input env
  evaluateExpr (ExprExpr x1) input env = evaluateExpr x1 input env
                                
  evaluateExpr (ExprArrayValue i e) input env = (getListValueBinding i (fst evaluatedExpr) env, snd evaluatedExpr)
                                              where evaluatedExpr = evaluateExpr e input env
  evaluateExpr (ExprIdent i) input env = (getValueBinding i env, input)
  evaluateExpr ExprRead input env = (ExprInt (getFirstInput input), getInputAfterRead input)
  evaluateExpr ExprReadLine input env = (ExprArrayAssign (convertIntListToExpr (getLineInput input)), getInputAfterReadLine input)
  
  evaluateExpr (ExprLength e) input env | isArray (fst evaluatedExpr) = (ExprInt (getArrayLength (fst evaluatedExpr)), snd evaluatedExpr)
                                        | otherwise = error ("Couldn't apply the method length on a variable. (List expected as parameter)")
                                        where evaluatedExpr = evaluateExpr e input env

  evaluateExpr x input env | isValue x = (x, input)
                           | otherwise = error ("Not implemented");
  


  checkIfBoolAndTrue :: Expr -> Bool
  checkIfBoolAndTrue (ExprBool True) = True
  checkIfBoolAndTrue (ExprBool False) = False
  checkIfBoolAndTrue _ = error ("Couldn't match the given expression with the bool type!");

  evaluateStatementPrint :: Statement -> [[Int]] -> [Environment] -> IO(([Environment],[[Int]]))
  evaluateStatementPrint (StatementPrint e) input env = do let evaluatedExpr = evaluateExpr e input env
                                                           putStr (prettyPrint (fst evaluatedExpr))
                                                           return (env, snd evaluatedExpr)
  
  evaluateProgram :: Program -> [[Int]] -> IO([Environment])
  evaluateProgram (Program ss) input = do evaluatedStatements <- evaluateStatementList ss input [[]]
                                          return (fst evaluatedStatements)

  evaluateStatementList :: [Statement] -> [[Int]] -> [Environment] -> IO(([Environment],[[Int]]))
  evaluateStatementList [] input env = return (env, input)
  evaluateStatementList (s:ss) input env = do newEnv <- evaluateStatement s input env
                                              evaluateStatementList ss (snd newEnv) (fst newEnv)

  evaluateStatement :: Statement -> [[Int]] -> [Environment] -> IO(([Environment], [[Int]]))
  evaluateStatement (StatementVarDeclr (VarDeclrOnly t i)) input env = do if isValueFree i env 
                                                                          then return (addBinding env i t ExprEmpty, input)
                                                                          else error "Variable name is in use."

  evaluateStatement (StatementVarDeclr (VarDeclrAssign t i e)) input env = do if isValueFree i env
                                                                              then do let evaluatedExpr = evaluateExpr e input env
                                                                                      if typeOf (fst evaluatedExpr) == t
                                                                                      then do let binding = addBinding env i t (fst evaluatedExpr)
                                                                                              return (binding, snd evaluatedExpr)
                                                                                      else error ("'" ++ i ++ "': You cannot assign a value of type '" ++ (show (typeOf e)) ++ "' to a variable of type: '" ++ show t ++ "'")
                                                                              else error "Variable name is in use."
  
  evaluateStatement (StatementArrayDeclr (ArrayDeclrOnly t i)) input env = do if isValueFree i env
                                                                              then return (addBinding env i t (ExprArrayAssign []), input)
                                                                              else error "Variable name is in use."
  
  evaluateStatement (StatementArrayDeclr (ArrayDeclrAssign t i e)) input env = do if isValueFree i env
                                                                                  then do let evaluatedExpr = evaluateExpr e input env
                                                                                          if typeOf (fst evaluatedExpr) == TypeEmpty || typeOf (fst evaluatedExpr) == t
                                                                                          then do let evaluatedEnv = addBinding env i t (fst evaluatedExpr)
                                                                                                  return (evaluatedEnv, snd evaluatedExpr)
                                                                                          else error ("'" ++ i ++ "': You cannot assign a value of type '" ++ (show (typeOf e)) ++ "' to a list of type: '" ++ show t ++ "'")
                                                                                  else error "Variable name is in use."

  evaluateStatement (StatementArrayAssign i index e) input env = do let evaluatedExpr = evaluateExpr e input env
                                                                    let evaluatedIndex = evaluateExpr index (snd evaluatedExpr) env
                                                                    return ((updateListValueBinding i (fst evaluatedExpr) (fst evaluatedIndex) env), snd evaluatedIndex)

  evaluateStatement (StatementAssign i e) input env = do let evaluatedExpr = evaluateExpr e input env
                                                         return (updateValueBinding i (fst (evaluatedExpr)) env, snd (evaluatedExpr))
  
  evaluateStatement (StatementIf (ExprBool expr) s) input env = do if expr
                                                                    then do sEval <- evaluateStatementList s input ([]:env)
                                                                            return (tail (fst sEval), snd sEval)
                                                                    else return (env, input)

  evaluateStatement (StatementIf (ExprInt e) _ ) _ _ = error ("Couldn't match the given expression with the bool type!");
  evaluateStatement (StatementIf (ExprString e) _ ) _ _  = error ("Couldn't match the given expression with the bool type!");

  evaluateStatement (StatementIf e s) input env = let evaluatedExpr = evaluateExpr e input env in
                                                  evaluateStatement (StatementIf (fst evaluatedExpr) s) (snd evaluatedExpr) env

  evaluateStatement (StatementIfElse (ExprBool expr) s1 s2) input env = do if expr 
                                                                           then do s1Eval <- evaluateStatementList s1 input ([]:env)
                                                                                   return (tail (fst s1Eval), snd s1Eval)
                                                                           else do s2Eval <- evaluateStatementList s2 input ([]:env)
                                                                                   return (tail (fst s2Eval), snd s2Eval)
  evaluateStatement (StatementIfElse (ExprInt e) _ _) _ _ = error ("Couldn't match the given expression with the bool type!");
  evaluateStatement (StatementIfElse (ExprString e) _ _) _ _  = error ("Couldn't match the given expression with the bool type!");                                                         

  evaluateStatement (StatementIfElse e s1 s2) input env = let evaluatedExpr = (evaluateExpr e input env) in
                                                          evaluateStatement (StatementIfElse (fst evaluatedExpr) s1 s2) (snd evaluatedExpr) env

  evaluateStatement (StatementWhile e s) input env = do let evaluatedExpr = evaluateExpr e input env
                                                        if checkIfBoolAndTrue (fst evaluatedExpr)
                                                        then do sEval <- evaluateStatementList s (snd evaluatedExpr) ([]:env)
                                                                evaluateStatement (StatementWhile e s) (snd sEval) (tail (fst sEval)) 
                                                        else return (env, snd evaluatedExpr)

  evaluateStatement (StatementPrint e) input env = evaluateStatementPrint (StatementPrint e) input env