module Eval where
    import Grammar
    
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
    -- | StatementIfElse Expr StatementList StatementList
    -- | StatementWhile Expr StatementList
    -- | StatementPrint Expr
    -- | StatementAssign Ident Expr
    -- | StatementArrayAssign Ident Int Expr
    -- | StatementVarDeclr VarDeclr
    -- | StatementArrayDeclr ArrayDeclr
    -- | StatementError
    -- deriving (Show, Eq)
    
    --data VarDeclr
    -- = VarDeclrOnly Type Ident
    -- | VarDeclrAssign Type Ident Expr
    -- deriving (Show, Eq)
    
    type Environment = [(String, Expr)]
    type Kontinuation = [Statement]
    type State = (Statement, Environment, Kontinuation)
    
    
    update :: Environment -> String -> Expr -> Environment
    update env x e = (x,e) : env
    
    getValueBinding :: String -> Environment -> Expr
    getValueBinding x [] = error "Variable binding not found"
    getValueBinding x ((y,e):env) | x == y  = e
                                  | otherwise = getValueBinding x env
    
    isValue :: Expr -> Bool
    isValue (ExprInt _) = True
    isValue (ExprBool _) = True
    isValue (ExprString _) = True
    isValue _ = False

    evaluateExprOp :: Expr -> Op -> Expr -> Expr
    evaluateExprOp (ExprInt x1) Plus (ExprInt x2) = ExprInt (x1+x2)
    evaluateExprOp (ExprInt x1) Minus (ExprInt x2) = ExprInt (x1-x2)
    evaluateExprOp (ExprInt x1) Multiply (ExprInt x2) = ExprInt (x1*x2)
    evaluateExprOp (ExprInt x1) Divide (ExprInt x2) = ExprInt (x1 `div` x2)
    evaluateExprOp (ExprInt x1) Power (ExprInt x2) = ExprInt (x1 ^ x2)
    evaluateExprOp (ExprString x1) Plus (ExprString x2) = ExprString (x1 ++ x2)
    evaluateExprOp _ _ _ = error "Invalid types"

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

    evaluateExprComp _ _ _ = error "Invalid types"

    evaluateExpr :: Expr -> Environment -> Expr
    evaluateExpr (ExprOp (ExprIdent x1) p (ExprIdent x2)) env = evaluateExpr (ExprOp (getValueBinding x1 env) p (getValueBinding x2 env)) env
    evaluateExpr (ExprOp (ExprIdent x1) p x2) env = evaluateExpr (ExprOp (getValueBinding x1 env) p x2) env
    evaluateExpr (ExprOp x1 p (ExprIdent x2)) env = evaluateExpr (ExprOp x1 p (getValueBinding x2 env)) env

    evaluateExpr (ExprOp x1 p x2) env | isValue x1 && isValue x2 = evaluateExprOp x1 p x2
                                      | isValue x1 == False && isValue x2 = evaluateExprOp (evaluateExpr x1 env) p x2
                                      | isValue x2 == False && isValue x1 = evaluateExprOp x1 p (evaluateExpr x2 env)
                                      | otherwise = evaluateExprOp (evaluateExpr x1 env) p (evaluateExpr x2 env)

    evaluateExpr (ExprCompareOp (ExprIdent x1) p (ExprIdent x2)) env = evaluateExpr (ExprCompareOp (getValueBinding x1 env) p (getValueBinding x2 env)) env
    evaluateExpr (ExprCompareOp (ExprIdent x1) p x2) env = evaluateExpr (ExprCompareOp (getValueBinding x1 env) p x2) env
    evaluateExpr (ExprCompareOp x1 p (ExprIdent x2)) env = evaluateExpr (ExprCompareOp x1 p (getValueBinding x2 env)) env

    evaluateExpr (ExprCompareOp x1 p x2) env | isValue x1 && isValue x2 = evaluateExprComp x1 p x2
                                      | isValue x1 == False && isValue x2 = evaluateExprComp (evaluateExpr x1 env) p x2
                                      | isValue x2 == False && isValue x1 = evaluateExprComp x1 p (evaluateExpr x2 env)
                                      | otherwise = evaluateExprComp (evaluateExpr x1 env) p (evaluateExpr x2 env)    
    
    evaluateExpr x env | isValue x = x
    
    