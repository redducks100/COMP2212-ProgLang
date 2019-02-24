{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,154) ([49152,32769,0,7,0,1,0,0,0,0,0,0,0,0,0,1024,0,0,8,0,32,0,28,0,112,0,4096,0,64,0,0,1,0,8,0,256,0,128,0,16925,20,112,0,8656,324,64,0,0,0,0,0,53248,17953,1,8,0,16925,20,512,0,2048,0,8192,0,0,0,29696,20760,0,0,0,0,0,195,3,780,12,3120,48,34624,1297,49920,768,3072,3075,0,130,49152,49200,0,0,0,8195,0,0,0,0,0,49920,768,3072,3075,0,0,0,0,49152,2048,0,0,0,4108,0,16432,0,192,1,3072,3075,12288,12300,0,512,0,16925,20,2164,81,0,0,16432,0,0,0,0,16,3072,128,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,16384,4231,5,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","MethodDecl","FormalList","Type","VarDeclr","Statement","StatementList","Expr","op","compop","ident","intLit","\"int\"","\"string\"","\"bool\"","\"=\"","\"not\"","\"(\"","\")\"","\"{\"","\"}\"","\";\"","\",\"","\"return\"","\"if\"","\"else\"","\"true\"","\"false\"","\"while\"","\"void\"","\"print\"","%eof"]
        bit_start = st * 34
        bit_end = (st + 1) * 34
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..33]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (15) = happyShift action_3
action_0 (16) = happyShift action_4
action_0 (17) = happyShift action_5
action_0 (32) = happyShift action_7
action_0 (4) = happyGoto action_6
action_0 (6) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (15) = happyShift action_3
action_1 (16) = happyShift action_4
action_1 (17) = happyShift action_5
action_1 (6) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (13) = happyShift action_9
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_6

action_4 _ = happyReduce_7

action_5 _ = happyReduce_5

action_6 (34) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (13) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (20) = happyShift action_11
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (20) = happyShift action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (15) = happyShift action_3
action_10 (16) = happyShift action_4
action_10 (17) = happyShift action_5
action_10 (5) = happyGoto action_14
action_10 (6) = happyGoto action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (15) = happyShift action_3
action_11 (16) = happyShift action_4
action_11 (17) = happyShift action_5
action_11 (5) = happyGoto action_12
action_11 (6) = happyGoto action_13
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (21) = happyShift action_17
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (13) = happyShift action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (21) = happyShift action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (22) = happyShift action_20
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (25) = happyShift action_19
action_16 _ = happyReduce_3

action_17 (22) = happyShift action_18
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (13) = happyShift action_25
action_18 (15) = happyShift action_3
action_18 (16) = happyShift action_4
action_18 (17) = happyShift action_5
action_18 (22) = happyShift action_26
action_18 (27) = happyShift action_27
action_18 (31) = happyShift action_28
action_18 (33) = happyShift action_29
action_18 (6) = happyGoto action_21
action_18 (7) = happyGoto action_22
action_18 (8) = happyGoto action_23
action_18 (9) = happyGoto action_31
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (15) = happyShift action_3
action_19 (16) = happyShift action_4
action_19 (17) = happyShift action_5
action_19 (5) = happyGoto action_30
action_19 (6) = happyGoto action_13
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (13) = happyShift action_25
action_20 (15) = happyShift action_3
action_20 (16) = happyShift action_4
action_20 (17) = happyShift action_5
action_20 (22) = happyShift action_26
action_20 (27) = happyShift action_27
action_20 (31) = happyShift action_28
action_20 (33) = happyShift action_29
action_20 (6) = happyGoto action_21
action_20 (7) = happyGoto action_22
action_20 (8) = happyGoto action_23
action_20 (9) = happyGoto action_24
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (13) = happyShift action_40
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_15

action_23 _ = happyReduce_16

action_24 (13) = happyShift action_25
action_24 (15) = happyShift action_3
action_24 (16) = happyShift action_4
action_24 (17) = happyShift action_5
action_24 (22) = happyShift action_26
action_24 (26) = happyShift action_39
action_24 (27) = happyShift action_27
action_24 (31) = happyShift action_28
action_24 (33) = happyShift action_29
action_24 (6) = happyGoto action_21
action_24 (7) = happyGoto action_22
action_24 (8) = happyGoto action_32
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (18) = happyShift action_38
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (13) = happyShift action_25
action_26 (15) = happyShift action_3
action_26 (16) = happyShift action_4
action_26 (17) = happyShift action_5
action_26 (22) = happyShift action_26
action_26 (27) = happyShift action_27
action_26 (31) = happyShift action_28
action_26 (33) = happyShift action_29
action_26 (6) = happyGoto action_21
action_26 (7) = happyGoto action_22
action_26 (8) = happyGoto action_23
action_26 (9) = happyGoto action_37
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (20) = happyShift action_36
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (20) = happyShift action_35
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (20) = happyShift action_34
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_4

action_31 (13) = happyShift action_25
action_31 (15) = happyShift action_3
action_31 (16) = happyShift action_4
action_31 (17) = happyShift action_5
action_31 (22) = happyShift action_26
action_31 (23) = happyShift action_33
action_31 (27) = happyShift action_27
action_31 (31) = happyShift action_28
action_31 (33) = happyShift action_29
action_31 (6) = happyGoto action_21
action_31 (7) = happyGoto action_22
action_31 (8) = happyGoto action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_17

action_33 _ = happyReduce_2

action_34 (13) = happyShift action_44
action_34 (14) = happyShift action_45
action_34 (19) = happyShift action_46
action_34 (20) = happyShift action_47
action_34 (29) = happyShift action_48
action_34 (30) = happyShift action_49
action_34 (10) = happyGoto action_54
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (13) = happyShift action_44
action_35 (14) = happyShift action_45
action_35 (19) = happyShift action_46
action_35 (20) = happyShift action_47
action_35 (29) = happyShift action_48
action_35 (30) = happyShift action_49
action_35 (10) = happyGoto action_53
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (13) = happyShift action_44
action_36 (14) = happyShift action_45
action_36 (19) = happyShift action_46
action_36 (20) = happyShift action_47
action_36 (29) = happyShift action_48
action_36 (30) = happyShift action_49
action_36 (10) = happyGoto action_52
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (13) = happyShift action_25
action_37 (15) = happyShift action_3
action_37 (16) = happyShift action_4
action_37 (17) = happyShift action_5
action_37 (22) = happyShift action_26
action_37 (23) = happyShift action_51
action_37 (27) = happyShift action_27
action_37 (31) = happyShift action_28
action_37 (33) = happyShift action_29
action_37 (6) = happyGoto action_21
action_37 (7) = happyGoto action_22
action_37 (8) = happyGoto action_32
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (13) = happyShift action_44
action_38 (14) = happyShift action_45
action_38 (19) = happyShift action_46
action_38 (20) = happyShift action_47
action_38 (29) = happyShift action_48
action_38 (30) = happyShift action_49
action_38 (10) = happyGoto action_50
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (13) = happyShift action_44
action_39 (14) = happyShift action_45
action_39 (19) = happyShift action_46
action_39 (20) = happyShift action_47
action_39 (29) = happyShift action_48
action_39 (30) = happyShift action_49
action_39 (10) = happyGoto action_43
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (18) = happyShift action_41
action_40 (24) = happyShift action_42
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (13) = happyShift action_44
action_41 (14) = happyShift action_45
action_41 (19) = happyShift action_46
action_41 (20) = happyShift action_47
action_41 (29) = happyShift action_48
action_41 (30) = happyShift action_49
action_41 (10) = happyGoto action_64
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_8

action_43 (11) = happyShift action_55
action_43 (12) = happyShift action_56
action_43 (24) = happyShift action_63
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_22

action_45 _ = happyReduce_21

action_46 (13) = happyShift action_44
action_46 (14) = happyShift action_45
action_46 (19) = happyShift action_46
action_46 (20) = happyShift action_47
action_46 (29) = happyShift action_48
action_46 (30) = happyShift action_49
action_46 (10) = happyGoto action_62
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (13) = happyShift action_44
action_47 (14) = happyShift action_45
action_47 (19) = happyShift action_46
action_47 (20) = happyShift action_47
action_47 (29) = happyShift action_48
action_47 (30) = happyShift action_49
action_47 (10) = happyGoto action_61
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_23

action_49 _ = happyReduce_24

action_50 (11) = happyShift action_55
action_50 (12) = happyShift action_56
action_50 (24) = happyShift action_60
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_10

action_52 (11) = happyShift action_55
action_52 (12) = happyShift action_56
action_52 (21) = happyShift action_59
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (11) = happyShift action_55
action_53 (12) = happyShift action_56
action_53 (21) = happyShift action_58
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (11) = happyShift action_55
action_54 (12) = happyShift action_56
action_54 (21) = happyShift action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (13) = happyShift action_44
action_55 (14) = happyShift action_45
action_55 (19) = happyShift action_46
action_55 (20) = happyShift action_47
action_55 (29) = happyShift action_48
action_55 (30) = happyShift action_49
action_55 (10) = happyGoto action_72
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (13) = happyShift action_44
action_56 (14) = happyShift action_45
action_56 (19) = happyShift action_46
action_56 (20) = happyShift action_47
action_56 (29) = happyShift action_48
action_56 (30) = happyShift action_49
action_56 (10) = happyGoto action_71
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (24) = happyShift action_70
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (13) = happyShift action_25
action_58 (15) = happyShift action_3
action_58 (16) = happyShift action_4
action_58 (17) = happyShift action_5
action_58 (22) = happyShift action_26
action_58 (27) = happyShift action_27
action_58 (31) = happyShift action_28
action_58 (33) = happyShift action_29
action_58 (6) = happyGoto action_21
action_58 (7) = happyGoto action_22
action_58 (8) = happyGoto action_69
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (13) = happyShift action_25
action_59 (15) = happyShift action_3
action_59 (16) = happyShift action_4
action_59 (17) = happyShift action_5
action_59 (22) = happyShift action_26
action_59 (27) = happyShift action_27
action_59 (31) = happyShift action_28
action_59 (33) = happyShift action_29
action_59 (6) = happyGoto action_21
action_59 (7) = happyGoto action_22
action_59 (8) = happyGoto action_68
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_14

action_61 (11) = happyShift action_55
action_61 (12) = happyShift action_56
action_61 (21) = happyShift action_67
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (11) = happyShift action_55
action_62 (12) = happyShift action_56
action_62 _ = happyReduce_20

action_63 (23) = happyShift action_66
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (11) = happyShift action_55
action_64 (12) = happyShift action_56
action_64 (24) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_9

action_66 _ = happyReduce_1

action_67 _ = happyReduce_25

action_68 (28) = happyShift action_73
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_12

action_70 _ = happyReduce_13

action_71 (11) = happyShift action_55
action_71 (12) = happyShift action_56
action_71 _ = happyReduce_19

action_72 (11) = happyShift action_55
action_72 (12) = happyShift action_56
action_72 _ = happyReduce_18

action_73 (13) = happyShift action_25
action_73 (15) = happyShift action_3
action_73 (16) = happyShift action_4
action_73 (17) = happyShift action_5
action_73 (22) = happyShift action_26
action_73 (27) = happyShift action_27
action_73 (31) = happyShift action_28
action_73 (33) = happyShift action_29
action_73 (6) = happyGoto action_21
action_73 (7) = happyGoto action_22
action_73 (8) = happyGoto action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_11

happyReduce_1 = happyReduce 11 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (MethodDecl happy_var_1 happy_var_2 happy_var_4 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 8 4 happyReduction_2
happyReduction_2 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (MethodDecl happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyTerminal (TokenIdent _ happy_var_2))
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (FormalList happy_var_1 happy_var_2 FEmpty
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (FormalList happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 _
	 =  HappyAbsSyn6
		 (TypeBoolean
	)

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn6
		 (TypeInt
	)

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn6
		 (TypeString
	)

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 _
	(HappyTerminal (TokenIdent _ happy_var_2))
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (VarDeclrOnly happy_var_1 happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 5 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (VarDeclrAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (StatementLList happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 7 8 happyReduction_11
happyReduction_11 ((HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (StatementIfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (StatementWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 5 8 happyReduction_13
happyReduction_13 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (StatementPrint happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 8 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (StatementAssign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (StatementVarDeclr happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (StatementList Empty happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  9 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (StatementList happy_var_1 happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal (TokenOp _ happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	(HappyTerminal (TokenCompareOp _ happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (ExprCompareOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  10 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (ExprNot happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 (HappyTerminal (TokenIntLit _ happy_var_1))
	 =  HappyAbsSyn10
		 (ExprInt happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  10 happyReduction_22
happyReduction_22 (HappyTerminal (TokenIdent _ happy_var_1))
	 =  HappyAbsSyn10
		 (ExprIdent happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn10
		 (ExprBool True
	)

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn10
		 (ExprBool False
	)

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (ExprExpr happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 34 34 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenOp _ happy_dollar_dollar -> cont 11;
	TokenCompareOp _ happy_dollar_dollar -> cont 12;
	TokenIdent _ happy_dollar_dollar -> cont 13;
	TokenIntLit _ happy_dollar_dollar -> cont 14;
	TokenInt _ -> cont 15;
	TokenString _ -> cont 16;
	TokenBool _ -> cont 17;
	TokenEquals _ -> cont 18;
	TokenNegate _ -> cont 19;
	TokenLeftParen _ -> cont 20;
	TokenRightParen _ -> cont 21;
	TokenLeftBrace _ -> cont 22;
	TokenRightBrace _ -> cont 23;
	TokenSemiColon _ -> cont 24;
	TokenColon _ -> cont 25;
	TokenReturn _ -> cont 26;
	TokenIf _ -> cont 27;
	TokenElse  _ -> cont 28;
	TokenTrue  _ -> cont 29;
	TokenFalse _ -> cont 30;
	TokenWhile _ -> cont 31;
	TokenVoid _ -> cont 32;
	TokenPrint _ -> cont 33;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 34 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error " Unknown parse error"
parseError (x:xs) = error ("Parse error at line:column " ++ (token_posn x))


data MethodDecl
    = MethodDecl Type Ident FormalList StatementList Expr
    | MethodDeclVoid Ident FormalList StatementList
    deriving (Show, Eq)
 

data FormalList 
    = FormalList Type Ident FormalList
    | FEmpty
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

data VarDeclr
    = VarDeclrOnly Type Ident
    | VarDeclrAssign Type Ident Expr
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
      
data Type 
    =   TypeInt
    |   TypeBool
    |   TypeString 
    deriving (Show,Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}








































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
