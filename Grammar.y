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
  "["         { TokenLeftBracket _ }
  "]"         { TokenRightBracket _ }
  "{"         { TokenLeftBrace _ }
  "}"         { TokenRightBrace _ }
  ";"         { TokenSemiColon _ }
  ","         { TokenColon _}
  "if"        { TokenIf _ }
  "else"      { TokenElse  _}
  "true"      { TokenTrue  _}
  "false"     { TokenFalse _ }
  "while"     { TokenWhile _ }
  "print"     { TokenPrint _}


%nonassoc 'if' 'while' 
%nonassoc 'else'
%nonassoc 'int' 'string' 'bool' 'true' 'false' '{' '}' '(' ')' '[' ']' ';'
%left 'and' 'or'
%nonassoc '>' '<' '>=' '<=' '=='
%left '+' '-'  
%left '*' '/'
%left '^' 
%left 'not' 
 

%% 

Program : 
        StatementList { Program $1 }

Statement : "{" StatementList "}"                        { StatementLList $2 }
          | "if" "(" Expr ")" Statement "else" Statement  { StatementIfElse $3 $5 $7 }
          | "while" "(" Expr ")" Statement                { StatementWhile $3 $5 }
          | "print" "(" Expr ")" ";"                      { StatementPrint $3 }
          | ident "=" Expr ";"                            { StatementAssign $1 $3 }
          | VarDeclr                                     { StatementVarDeclr $1}
          | ArrayDeclr                                   { StatementArrayDeclr $1}

VarDeclr : Type ident ";"           {VarDeclrOnly $1 $2}
         | Type ident "=" Expr ";"  {VarDeclrAssign $1 $2 $4}

ExprList : Expr {ExprList $1 EEmpty}
         | Expr "," ExprList {ExprList $1 $3}

ArrayDeclr : Type "[" "]" ident ";" {ArrayDeclrOnly $1 $4}
           | Type "[" "]" ident "=" Expr ";" {ArrayDeclrAssign $1 $4 $6}

StatementList : Statement                 { StatementList Empty $1 }
              | StatementList Statement   { StatementList $1 $2 }
              |                           { Empty }

Expr : Expr op Expr           { ExprOp $1 $2 $3}
     | Expr compop Expr       { ExprCompareOp $1 $2 $3 } 
     | "not" Expr             { ExprNot $2 } 
     | intLit                 { ExprInt $1 } 
     | ident                  { ExprIdent $1 } 
     | "true"                 { ExprBool True}
     | "false"                { ExprBool False}
     | "(" Expr ")"           { ExprExpr $2} 
     | "{" ExprList "}"           { ExprArrayAssign $2 }

Type : "bool"          { TypeBool }
     | "int"           { TypeInt }
     | "string"        { TypeString }

{ 
parseError :: [Token] -> a
parseError [] = error " Unknown parse error"
parseError (x:xs) = error ("Parse error at line:column " ++ (token_posn x))

data Program 
    = Program StatementList
      deriving (Show, Eq)

data VarDeclr
    = VarDeclrOnly Type Ident
    | VarDeclrAssign Type Ident Expr
    deriving (Show, Eq)

data ArrayDeclr
    = ArrayDeclrOnly Type Ident
    | ArrayDeclrAssign Type Ident Expr
    deriving (Show,Eq)

data Statement
    = Statement String
    | StatementLList StatementList
    | StatementIfElse Expr Statement Statement
    | StatementWhile Expr Statement
    | StatementPrint Expr
    | StatementAssign Ident Expr
    | StatementVarDeclr VarDeclr
    | StatementArrayDeclr ArrayDeclr
    | StatementError
    deriving (Show, Eq)

data StatementList
    = StatementList StatementList Statement
    | Empty
    deriving (Show, Eq)

data ExprList
    = ExprList Expr ExprList
    | EEmpty
    deriving (Show, Eq)

data Expr 
    = Expr String 
    | ExprOp Expr Char Expr 
    | ExprCompareOp Expr String Expr 
    | ExprInt Int 
    | ExprBool Bool 
    | ExprIdent Ident 
    | ExprExpr Expr
    | ExprArrayAssign ExprList 
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