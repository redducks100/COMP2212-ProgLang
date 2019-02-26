{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,171) ([16384,4231,5,2164,81,1792,512,0,0,16384,0,0,128,0,0,0,0,0,0,0,0,2164,81,8192,0,0,2,0,32,0,0,0,12480,192,3072,3075,49152,49200,0,0,0,34624,1297,3072,3075,0,520,0,0,0,1792,512,1024,0,16384,0,0,512,0,8192,0,0,0,49152,49200,0,0,0,48,2,0,0,0,0,0,780,12,12480,192,0,0,0,0,0,0,0,0,0,768,4,12288,64,0,1027,0,12480,192,3072,3075,0,512,0,2164,81,34624,1296,768,4,0,0,0,0,0,48,2,28672,0,0,7,0,1024,0,64,0,0,4,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,29696,20744,0,128,0,16384,0,32768,0,29696,20744,0,7,0,2164,81,0,0,29696,20872,0,0,0,6260,81,0,0,3072,3075,12288,512,0,4096,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Program","MethodDeclList","Statement","VarDeclr","MethodDecl","FormalList","StatementList","Expr","Type","op","compop","ident","intLit","\"int\"","\"string\"","\"bool\"","\"=\"","\"not\"","\"(\"","\")\"","\"{\"","\"}\"","\";\"","\",\"","\"return\"","\"if\"","\"else\"","\"true\"","\"false\"","\"while\"","\"void\"","\"print\"","%eof"]
        bit_start = st * 36
        bit_end = (st + 1) * 36
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..35]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (15) = happyShift action_5
action_0 (17) = happyShift action_6
action_0 (18) = happyShift action_7
action_0 (19) = happyShift action_8
action_0 (24) = happyShift action_9
action_0 (29) = happyShift action_10
action_0 (33) = happyShift action_11
action_0 (35) = happyShift action_12
action_0 (4) = happyGoto action_13
action_0 (6) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (12) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (15) = happyShift action_5
action_1 (17) = happyShift action_6
action_1 (18) = happyShift action_7
action_1 (19) = happyShift action_8
action_1 (24) = happyShift action_9
action_1 (29) = happyShift action_10
action_1 (33) = happyShift action_11
action_1 (35) = happyShift action_12
action_1 (6) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 (12) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (17) = happyShift action_6
action_2 (18) = happyShift action_7
action_2 (19) = happyShift action_8
action_2 (34) = happyShift action_24
action_2 (5) = happyGoto action_21
action_2 (8) = happyGoto action_22
action_2 (12) = happyGoto action_23
action_2 _ = happyReduce_4

action_3 _ = happyReduce_10

action_4 (15) = happyShift action_20
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (20) = happyShift action_19
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_28

action_7 _ = happyReduce_29

action_8 _ = happyReduce_27

action_9 (15) = happyShift action_5
action_9 (17) = happyShift action_6
action_9 (18) = happyShift action_7
action_9 (19) = happyShift action_8
action_9 (24) = happyShift action_9
action_9 (29) = happyShift action_10
action_9 (33) = happyShift action_11
action_9 (35) = happyShift action_12
action_9 (6) = happyGoto action_17
action_9 (7) = happyGoto action_3
action_9 (10) = happyGoto action_18
action_9 (12) = happyGoto action_4
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (22) = happyShift action_16
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (22) = happyShift action_15
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (22) = happyShift action_14
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (36) = happyAccept
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (15) = happyShift action_31
action_14 (16) = happyShift action_32
action_14 (21) = happyShift action_33
action_14 (22) = happyShift action_34
action_14 (31) = happyShift action_35
action_14 (32) = happyShift action_36
action_14 (11) = happyGoto action_41
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (15) = happyShift action_31
action_15 (16) = happyShift action_32
action_15 (21) = happyShift action_33
action_15 (22) = happyShift action_34
action_15 (31) = happyShift action_35
action_15 (32) = happyShift action_36
action_15 (11) = happyGoto action_40
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_31
action_16 (16) = happyShift action_32
action_16 (21) = happyShift action_33
action_16 (22) = happyShift action_34
action_16 (31) = happyShift action_35
action_16 (32) = happyShift action_36
action_16 (11) = happyGoto action_39
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_17

action_18 (15) = happyShift action_5
action_18 (17) = happyShift action_6
action_18 (18) = happyShift action_7
action_18 (19) = happyShift action_8
action_18 (24) = happyShift action_9
action_18 (25) = happyShift action_38
action_18 (29) = happyShift action_10
action_18 (33) = happyShift action_11
action_18 (35) = happyShift action_12
action_18 (6) = happyGoto action_37
action_18 (7) = happyGoto action_3
action_18 (12) = happyGoto action_4
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (15) = happyShift action_31
action_19 (16) = happyShift action_32
action_19 (21) = happyShift action_33
action_19 (22) = happyShift action_34
action_19 (31) = happyShift action_35
action_19 (32) = happyShift action_36
action_19 (11) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (20) = happyShift action_28
action_20 (26) = happyShift action_29
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_1

action_22 (17) = happyShift action_6
action_22 (18) = happyShift action_7
action_22 (19) = happyShift action_8
action_22 (34) = happyShift action_24
action_22 (36) = happyReduce_4
action_22 (5) = happyGoto action_27
action_22 (8) = happyGoto action_22
action_22 (12) = happyGoto action_23
action_22 _ = happyReduce_4

action_23 (15) = happyShift action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (15) = happyShift action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (22) = happyShift action_52
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (22) = happyShift action_51
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_3

action_28 (15) = happyShift action_31
action_28 (16) = happyShift action_32
action_28 (21) = happyShift action_33
action_28 (22) = happyShift action_34
action_28 (31) = happyShift action_35
action_28 (32) = happyShift action_36
action_28 (11) = happyGoto action_50
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_11

action_30 (13) = happyShift action_42
action_30 (14) = happyShift action_43
action_30 (26) = happyShift action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_23

action_32 _ = happyReduce_22

action_33 (15) = happyShift action_31
action_33 (16) = happyShift action_32
action_33 (21) = happyShift action_33
action_33 (22) = happyShift action_34
action_33 (31) = happyShift action_35
action_33 (32) = happyShift action_36
action_33 (11) = happyGoto action_48
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (15) = happyShift action_31
action_34 (16) = happyShift action_32
action_34 (21) = happyShift action_33
action_34 (22) = happyShift action_34
action_34 (31) = happyShift action_35
action_34 (32) = happyShift action_36
action_34 (11) = happyGoto action_47
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_24

action_36 _ = happyReduce_25

action_37 _ = happyReduce_18

action_38 _ = happyReduce_5

action_39 (13) = happyShift action_42
action_39 (14) = happyShift action_43
action_39 (23) = happyShift action_46
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (13) = happyShift action_42
action_40 (14) = happyShift action_43
action_40 (23) = happyShift action_45
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (13) = happyShift action_42
action_41 (14) = happyShift action_43
action_41 (23) = happyShift action_44
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (15) = happyShift action_31
action_42 (16) = happyShift action_32
action_42 (21) = happyShift action_33
action_42 (22) = happyShift action_34
action_42 (31) = happyShift action_35
action_42 (32) = happyShift action_36
action_42 (11) = happyGoto action_62
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (15) = happyShift action_31
action_43 (16) = happyShift action_32
action_43 (21) = happyShift action_33
action_43 (22) = happyShift action_34
action_43 (31) = happyShift action_35
action_43 (32) = happyShift action_36
action_43 (11) = happyGoto action_61
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (26) = happyShift action_60
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (15) = happyShift action_5
action_45 (17) = happyShift action_6
action_45 (18) = happyShift action_7
action_45 (19) = happyShift action_8
action_45 (24) = happyShift action_9
action_45 (29) = happyShift action_10
action_45 (33) = happyShift action_11
action_45 (35) = happyShift action_12
action_45 (6) = happyGoto action_59
action_45 (7) = happyGoto action_3
action_45 (12) = happyGoto action_4
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (15) = happyShift action_5
action_46 (17) = happyShift action_6
action_46 (18) = happyShift action_7
action_46 (19) = happyShift action_8
action_46 (24) = happyShift action_9
action_46 (29) = happyShift action_10
action_46 (33) = happyShift action_11
action_46 (35) = happyShift action_12
action_46 (6) = happyGoto action_58
action_46 (7) = happyGoto action_3
action_46 (12) = happyGoto action_4
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (13) = happyShift action_42
action_47 (14) = happyShift action_43
action_47 (23) = happyShift action_57
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (13) = happyShift action_42
action_48 (14) = happyShift action_43
action_48 _ = happyReduce_21

action_49 _ = happyReduce_9

action_50 (13) = happyShift action_42
action_50 (14) = happyShift action_43
action_50 (26) = happyShift action_56
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (17) = happyShift action_6
action_51 (18) = happyShift action_7
action_51 (19) = happyShift action_8
action_51 (9) = happyGoto action_55
action_51 (12) = happyGoto action_54
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (17) = happyShift action_6
action_52 (18) = happyShift action_7
action_52 (19) = happyShift action_8
action_52 (9) = happyGoto action_53
action_52 (12) = happyGoto action_54
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (23) = happyShift action_66
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (15) = happyShift action_65
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (23) = happyShift action_64
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_12

action_57 _ = happyReduce_26

action_58 (30) = happyShift action_63
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_7

action_60 _ = happyReduce_8

action_61 (13) = happyShift action_42
action_61 (14) = happyShift action_43
action_61 _ = happyReduce_20

action_62 (13) = happyShift action_42
action_62 (14) = happyShift action_43
action_62 _ = happyReduce_19

action_63 (15) = happyShift action_5
action_63 (17) = happyShift action_6
action_63 (18) = happyShift action_7
action_63 (19) = happyShift action_8
action_63 (24) = happyShift action_9
action_63 (29) = happyShift action_10
action_63 (33) = happyShift action_11
action_63 (35) = happyShift action_12
action_63 (6) = happyGoto action_70
action_63 (7) = happyGoto action_3
action_63 (12) = happyGoto action_4
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (24) = happyShift action_69
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (27) = happyShift action_68
action_65 _ = happyReduce_15

action_66 (24) = happyShift action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (15) = happyShift action_5
action_67 (17) = happyShift action_6
action_67 (18) = happyShift action_7
action_67 (19) = happyShift action_8
action_67 (24) = happyShift action_9
action_67 (29) = happyShift action_10
action_67 (33) = happyShift action_11
action_67 (35) = happyShift action_12
action_67 (6) = happyGoto action_17
action_67 (7) = happyGoto action_3
action_67 (10) = happyGoto action_73
action_67 (12) = happyGoto action_4
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (17) = happyShift action_6
action_68 (18) = happyShift action_7
action_68 (19) = happyShift action_8
action_68 (9) = happyGoto action_72
action_68 (12) = happyGoto action_54
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (15) = happyShift action_5
action_69 (17) = happyShift action_6
action_69 (18) = happyShift action_7
action_69 (19) = happyShift action_8
action_69 (24) = happyShift action_9
action_69 (29) = happyShift action_10
action_69 (33) = happyShift action_11
action_69 (35) = happyShift action_12
action_69 (6) = happyGoto action_17
action_69 (7) = happyGoto action_3
action_69 (10) = happyGoto action_71
action_69 (12) = happyGoto action_4
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_6

action_71 (15) = happyShift action_5
action_71 (17) = happyShift action_6
action_71 (18) = happyShift action_7
action_71 (19) = happyShift action_8
action_71 (24) = happyShift action_9
action_71 (28) = happyShift action_75
action_71 (29) = happyShift action_10
action_71 (33) = happyShift action_11
action_71 (35) = happyShift action_12
action_71 (6) = happyGoto action_37
action_71 (7) = happyGoto action_3
action_71 (12) = happyGoto action_4
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_16

action_73 (15) = happyShift action_5
action_73 (17) = happyShift action_6
action_73 (18) = happyShift action_7
action_73 (19) = happyShift action_8
action_73 (24) = happyShift action_9
action_73 (25) = happyShift action_74
action_73 (29) = happyShift action_10
action_73 (33) = happyShift action_11
action_73 (35) = happyShift action_12
action_73 (6) = happyGoto action_37
action_73 (7) = happyGoto action_3
action_73 (12) = happyGoto action_4
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_14

action_75 (15) = happyShift action_31
action_75 (16) = happyShift action_32
action_75 (21) = happyShift action_33
action_75 (22) = happyShift action_34
action_75 (31) = happyShift action_35
action_75 (32) = happyShift action_36
action_75 (11) = happyGoto action_76
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (13) = happyShift action_42
action_76 (14) = happyShift action_43
action_76 (26) = happyShift action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (25) = happyShift action_78
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_13

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 (MethodDeclList happy_var_1 MEmpty
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 (MethodDeclList happy_var_1 happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_0  5 happyReduction_4
happyReduction_4  =  HappyAbsSyn5
		 (MEmpty
	)

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (StatementLList happy_var_2
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 7 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (StatementIfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 5 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (StatementWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 5 6 happyReduction_8
happyReduction_8 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (StatementPrint happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (StatementAssign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (StatementVarDeclr happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 _
	(HappyTerminal (TokenIdent _ happy_var_2))
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn7
		 (VarDeclrOnly happy_var_1 happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 7 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (VarDeclrAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 11 8 happyReduction_13
happyReduction_13 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (MethodDecl happy_var_1 happy_var_2 happy_var_4 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 8 8 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (MethodDeclVoid happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyTerminal (TokenIdent _ happy_var_2))
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (FormalList happy_var_1 happy_var_2 FEmpty
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 9 happyReduction_16
happyReduction_16 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (FormalList happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (StatementList Empty happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  10 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (StatementList happy_var_1 happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	(HappyTerminal (TokenOp _ happy_var_2))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExprOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
	(HappyTerminal (TokenCompareOp _ happy_var_2))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (ExprCompareOp happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  11 happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (ExprNot happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyTerminal (TokenIntLit _ happy_var_1))
	 =  HappyAbsSyn11
		 (ExprInt happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 (HappyTerminal (TokenIdent _ happy_var_1))
	 =  HappyAbsSyn11
		 (ExprIdent happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn11
		 (ExprBool True
	)

happyReduce_25 = happySpecReduce_1  11 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn11
		 (ExprBool False
	)

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (ExprExpr happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  12 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn12
		 (TypeBool
	)

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn12
		 (TypeInt
	)

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn12
		 (TypeString
	)

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenOp _ happy_dollar_dollar -> cont 13;
	TokenCompareOp _ happy_dollar_dollar -> cont 14;
	TokenIdent _ happy_dollar_dollar -> cont 15;
	TokenIntLit _ happy_dollar_dollar -> cont 16;
	TokenInt _ -> cont 17;
	TokenString _ -> cont 18;
	TokenBool _ -> cont 19;
	TokenEquals _ -> cont 20;
	TokenNegate _ -> cont 21;
	TokenLeftParen _ -> cont 22;
	TokenRightParen _ -> cont 23;
	TokenLeftBrace _ -> cont 24;
	TokenRightBrace _ -> cont 25;
	TokenSemiColon _ -> cont 26;
	TokenColon _ -> cont 27;
	TokenReturn _ -> cont 28;
	TokenIf _ -> cont 29;
	TokenElse  _ -> cont 30;
	TokenTrue  _ -> cont 31;
	TokenFalse _ -> cont 32;
	TokenWhile _ -> cont 33;
	TokenVoid _ -> cont 34;
	TokenPrint _ -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
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
