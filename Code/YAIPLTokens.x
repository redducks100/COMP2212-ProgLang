{ 
module YAIPLTokens where 
}

%wrapper "posn" 

-- digits 
$digit = 0-9     
-- alphabetic characters
$alpha = [a-zA-Z]
$graphic = $printable
@string =  \" ($graphic # \")* \"


tokens :-
  $white+     ; 
  "//".*      ;
  [\+\-\*\/\^] { tok (\p s -> TokenOp p (head s))}
  "<"         { tok (\p s -> TokenCompareOp p s)}
  ">"         { tok (\p s -> TokenCompareOp p s)}
  "<="        { tok (\p s -> TokenCompareOp p s)}
  ">="        { tok (\p s -> TokenCompareOp p s)}
  "and"       { tok (\p s -> TokenCompareOp p s)}
  "or"        { tok (\p s -> TokenCompareOp p s)}
  "=="        { tok (\p s -> TokenCompareOp p s)}
  "not"       { tok (\p s -> TokenNegate p)}
  "int"       {tok(\p s -> TokenInt p)}
  "string"    {tok(\p s -> TokenString p)}
  "bool"      {tok(\p s -> TokenBool p)}
  \=          {tok(\p s -> TokenEquals p)}         
  \(          {tok(\p s -> TokenLeftParen p)}
  \)          {tok(\p s -> TokenRightParen p)}
  \{          {tok(\p s -> TokenLeftBrace p)}
  \}          {tok(\p s -> TokenRightBrace p)}
  \[          {tok(\p s -> TokenLeftBracket p)}
  \]          {tok(\p s -> TokenRightBracket p)}
  \;          {tok(\p s -> TokenSemiColon p)}
  \,          {tok(\p s -> TokenColon p)}
  "if"        {tok(\p s -> TokenIf p)}
  "else"      {tok(\p s -> TokenElse p)}
  "true"      {tok(\p s -> TokenTrue p)}
  "false"     {tok(\p s -> TokenFalse p)}
  "while"     {tok(\p s -> TokenWhile p)}
  "print"     {tok(\p s -> TokenPrint p)}
  "read"      {tok(\p s -> TokenRead p)}
  "readline"  {tok(\p s -> TokenReadLine p)}
  "length"    {tok(\p s -> TokenLength p)}
  $alpha [$alpha $digit \_ \’]*   { tok(\p s -> TokenIdent p s) }
  @string     {tok(\p s -> TokenStringLit p (init (tail s))) } 
  $digit+     {tok(\p s -> TokenIntLit p (read s)) } 

{ 

tok f p s = f p s

-- Each action has type :: String -> Token 
-- The token type: 
data YAIPLToken = 
  TokenOp         AlexPosn Char |
  TokenCompareOp  AlexPosn String |
  TokenIdent      AlexPosn String |
  TokenStringLit  AlexPosn String |
  TokenIntLit     AlexPosn Int    |
  TokenInt        AlexPosn  |
  TokenString     AlexPosn  |
  TokenBool       AlexPosn  |
  TokenEquals     AlexPosn  |
  TokenNegate     AlexPosn  |
  TokenLeftParen  AlexPosn  |
  TokenRightParen AlexPosn  |
  TokenLeftBrace  AlexPosn  |
  TokenRightBrace AlexPosn  |
  TokenLeftBracket  AlexPosn  |
  TokenRightBracket AlexPosn  |
  TokenSemiColon  AlexPosn  |
  TokenColon      AlexPosn  |
  TokenIf         AlexPosn  | 
  TokenElse       AlexPosn  |
  TokenTrue       AlexPosn  |
  TokenFalse      AlexPosn  |
  TokenWhile      AlexPosn  |
  TokenPrint      AlexPosn  |
  TokenRead       AlexPosn  |
  TokenReadLine   AlexPosn  |
  TokenLength     AlexPosn  
  deriving (Eq,Show) 


token_posn (TokenOp (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
token_posn (TokenCompareOp (AlexPn a l c) _) =show(l) ++ ":" ++ show(c)
token_posn (TokenIdent (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
token_posn (TokenStringLit (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
token_posn (TokenIntLit (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
token_posn (TokenInt (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenString (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenEquals (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenNegate (AlexPn a l c)) = show(l)++ ":" ++ show(c)
token_posn (TokenLeftParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenRightParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenLeftBrace (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenRightBrace (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenLeftBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenRightBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
token_posn (TokenIf (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenElse (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenTrue (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenFalse (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenWhile (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenPrint (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenRead (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenReadLine (AlexPn a l c))=show(l) ++ ":" ++ show(c)
token_posn (TokenLength (AlexPn a l c))=show(l) ++ ":" ++ show(c)
  
}