module Eval where
  import Grammar
  import System.Environment
  import Control.Exception
  import System.IO
  
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
  -- | StatementIfElse Expr StatementList StatementList----------
  -- | StatementWhile Expr StatementList---------------------
  -- | StatementPrint Expr-----------------------------------
  -- | StatementAssign Ident Expr
  -- | StatementArrayAssign Ident Int Expr------------
  -- | StatementVarDeclr VarDeclr
  -- | StatementArrayDeclr ArrayDeclr--------------------------
  -- | StatementError
  -- deriving (Show, Eq)
  
  --data VarDeclr
  -- = VarDeclrOnly Type Ident
  -- | VarDeclrAssign Type Ident Expr
  -- deriving (Show, Eq)

  
  --data ArrayDeclr 
  -- = ArrayDeclrOnly Type Ident
  -- | ArrayDeclrAssign Type Ident Expr
  --deriving (Show,Eq)
  
  type Environment = [(String, [Expr])]
  
  prettyPrint :: Expr -> String
  prettyPrint (ExprInt x) = show x
  prettyPrint (ExprBool x) = show x
  prettyPrint (ExprString x) = x
  prettyPrint e = show e 
  
  addBinding :: Environment -> String -> Expr -> Environment
  addBinding env x (ExprArrayAssign e) = (x, e) : env
  addBinding env x e = (x,[e]) : env
  
  getValueBinding :: String -> Environment -> [Expr]
  getValueBinding x [] = error "Variable binding not found!"
  getValueBinding x ((y,e):env) | x == y && isEmpty e == False = e
                                | x == y && isEmpty e = error "Variable is not initialised with a value!"
                                | otherwise = getValueBinding x env
                                
  -- lst = val (replace all values from env under lst with val)
  -- lst = exprlist ( = {ex,ex,ex})
  updateValueBinding :: String -> Expr -> Environment -> Environment
  updateValueBinding x ne [] = error "Value binding not found!"
  updateValueBinding x ne ((y,[e]):env) | x == y =  (x,[ne]) : env
                                      | otherwise = (y,[e]) : (updateValueBinding x ne env)                              
    
  isEmpty :: [Expr] -> Bool
  isEmpty [] = True
  isEmpty [ExprEmpty] = True
  isEmpty _ = False

  isValueFree :: String -> Environment -> Bool
  isValueFree x [] = True
  isValueFree x ((y,e):env) | x == y = False
                            | otherwise = isValueFree x env

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
  evaluateExprOp _ _ _ = error "EvaluateExprOp: Invalid type (Expected type INT or STRING { only concatenation works: '+'})"

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
  evaluateExprComp (ExprString x1) Equals (ExprString x2) = ExprBool (length x1 == length x2)

  evaluateExprComp _ _ _ = error "EvaluateExprComp: Cannot compare different types"

  evaluateExpr :: Expr -> Environment -> Expr
  --evaluate expressions with operations (+,-,/,*,^)
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

  evaluateExpr x env | isValue x = x


  evaluateStatementPrint :: Statement -> Environment -> IO (Environment)
  evaluateStatementPrint (StatementPrint e) env = do let evalE = evaluateExpr e env
                                                     putStrLn (prettyPrint evalE)
                                                     return ( env) 

  -- helperPrint :: 

  evaluateStatement :: Statement -> Environment -> Environment
  evaluateStatement (StatementVarDeclr (VarDeclrOnly t i)) env | isValueFree i env = addBinding env i ExprEmpty
                                                               | otherwise = error "Variable name is in use."

  evaluateStatement (StatementVarDeclr (VarDeclrAssign t i e)) env | isValueFree i env = addBinding env i (evaluateExpr e env)
                                                                   | otherwise = error "Variable name is in use."
  
  evaluateStatement (StatementAssign i e) env = updateValueBinding i (evaluateExpr e env) env
  