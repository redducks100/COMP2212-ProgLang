{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }

%token 
  op          { TokenOp _ $$ }
  compop      { TokenCompareOp _ $$ }
  ident       { TokenIdent _ $$ }
  intLit      { TokenIntLit _ $$ } 
  "int"       { TokenInt _ }
  "string"    { TokenString _ }
  "bool"      { TokenBool _ }
  "="         { TokenEquals _ }
  "not"       { TokenNegate _ }         
  "("         { TokenLeftParen _ }
  ")"         { TokenRightParen _ }
  "{"         { TokenLeftBrace _ }
  "}"         { TokenRightBrace _ }
  ";"         { TokenSemiColon _ }
  ","         { TokenColon _}
  "return"    { TokenReturn _}
  "if"        { TokenIf _ }
  "else"      { TokenElse  _}
  "true"      { TokenTrue  _}
  "false"     { TokenFalse _ }
  "while"     { TokenWhile _ }
  "void"      { TokenVoid _} 
  "print"     { TokenPrint _}


%left 'and' 'or'
%nonassoc '>' '<' '>=' '<=' '=='
%left '+' '-'  
%left '*' '/'
%left '^' 
%left 'not' 
 

%% 

Program : 
        Statement MethodDeclList { Program $1 $2 }

MethodDeclList :
     MethodDecl                   { MethodDeclList $1 MEmpty }
     | MethodDecl MethodDeclList  { MethodDeclList $1 $2 }
     |                            { MEmpty }

Statement : "{" StatementList "}"                        { StatementLList $2 }
          | "if" "(" Expr ")" Statement "else" Statement  { StatementIfElse $3 $5 $7 }
          | "while" "(" Expr ")" Statement                { StatementWhile $3 $5 }
          | "print" "(" Expr ")" ";"                      { StatementPrint $3 }
          | ident "=" Expr ";"                            { StatementAssign $1 $3 }
          | VarDeclr                                     { StatementVarDeclr $1}

VarDeclr : Type ident ";"           {VarDeclrOnly $1 $2}
         | Type ident "=" Expr ";"  {VarDeclrAssign $1 $2 $4}

MethodDecl : Type ident "(" FormalList ")" "{" StatementList "return" Expr ";" "}" { MethodDecl $1 $2 $4 $7 $9}
           | "void" ident "(" FormalList ")" "{" StatementList "}" { MethodDeclVoid $2 $4 $7}

FormalList : Type ident                { FormalList $1 $2 FEmpty }
           | Type ident "," FormalList { FormalList $1 $2 $4 }
 



 
StatementList : Statement               { StatementList Empty $1 }
              | StatementList Statement   { StatementList $1 $2 }

Expr : Expr op Expr           { ExprOp $1 $2 $3}
     | Expr compop Expr       { ExprCompareOp $1 $2 $3 } 
     | "not" Expr             { ExprNot $2 } 
     | intLit                 { ExprInt $1 } 
     | ident                  { ExprIdent $1 } 
     | "true"                 { ExprBool True}
     | "false"                { ExprBool False}
     | "(" Expr ")"           { ExprExpr $2}  

Type : "bool"          { TypeBool }
     | "int"           { TypeInt }
     | "string"        { TypeString }


{ 
parseError :: [Token] -> a
parseError [] = error " Unknown parse error"
parseError (x:xs) = error ("Parse error at line:column " ++ (token_posn x))

data Program 
    = Program Statement MethodDeclList
      deriving (Show, Eq)

data MethodDeclList
    = MethodDeclList MethodDecl MethodDeclList
    | MEmpty
    deriving (Show, Eq)

    
data MethodDecl
    = MethodDecl Type Ident FormalList StatementList Expr
    | MethodDeclVoid Ident FormalList StatementList
    deriving (Show, Eq)
 

data FormalList 
    = FormalList Type Ident FormalList
    | FEmpty
  deriving (Show, Eq)

data VarDeclr
    = VarDeclrOnly Type Ident
    | VarDeclrAssign Type Ident Expr
    deriving (Show, Eq)

data Statement
    = Statement String
    | StatementLList StatementList
    | StatementIfElse Expr Statement Statement
    | StatementWhile Expr Statement
    | StatementPrint Expr
    | StatementAssign Ident Expr
    | StatementVarDeclr VarDeclr
    | StatementArrayEqual Ident Expr Expr
    | StatementError
    deriving (Show, Eq)

data StatementList
    = StatementList StatementList Statement
    | Empty
    deriving (Show, Eq)


data Expr 
    = Expr String 
    | ExprOp Expr Char Expr 
    | ExprCompareOp Expr String Expr 
    | ExprInt Int 
    | ExprBool Bool 
    | ExprIdent Ident 
    | ExprExpr Expr 
    | ExprNot Expr 
    | ExprError
    deriving (Show, Eq)


      
data Type 
    =   TypeInt
    |   TypeBool
    |   TypeString 
    deriving (Show,Eq) 

data Op
    =  Minus 
    |  Plus 
    |  Times 
    |  Divide
    |  Power 
    deriving (Show, Eq)

data CompareOp
    =  LessThan 
    |  GreaterThan 
    |  LessOrEqualThan 
    |  GreaterOrEqualThan 
    |  Equals
    |  And
    |  Or 
    deriving (Show, Eq)

type Ident = String
type IntegerLit = Int


} 