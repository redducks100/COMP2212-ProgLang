{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
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

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,133) ([0,0,0,34845,24,0,0,0,0,0,0,53248,34945,32769,256,0,128,0,0,0,0,0,0,0,0,0,0,256,0,2048,0,16384,0,0,0,24576,49432,0,2243,6,17944,48,1856,1574,34304,3089,0,514,0,512,0,0,0,32,0,49920,1544,0,0,12288,2048,0,0,0,0,0,24960,772,3072,6179,24576,49432,0,0,0,0,0,0,0,384,2,3072,16,24576,128,0,8972,24,6240,193,0,32,59392,50240,16384,8711,6,8192,0,12,4,32864,0,0,0,0,0,49152,8192,0,256,1,12480,386,0,0,0,0,0,0,0,8972,24,0,0,0,256,0,0,0,0,0,0,0,0,0,3712,3140,0,0,6144,1024,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Program","Statement","VarDeclr","ExprList","ArrayDeclr","StatementList","Expr","Type","op","compop","ident","intLit","\"int\"","\"string\"","\"bool\"","\"=\"","\"not\"","\"(\"","\")\"","\"[\"","\"]\"","\"{\"","\"}\"","\";\"","\",\"","\"if\"","\"else\"","\"true\"","\"false\"","\"while\"","\"print\"","%eof"]
        bit_start = st * 35
        bit_end = (st + 1) * 35
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..34]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (14) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (25) = happyShift action_11
action_0 (29) = happyShift action_12
action_0 (33) = happyShift action_13
action_0 (34) = happyShift action_14
action_0 (4) = happyGoto action_15
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (8) = happyGoto action_4
action_0 (9) = happyGoto action_5
action_0 (11) = happyGoto action_6
action_0 _ = happyReduce_17

action_1 (14) = happyShift action_7
action_1 (16) = happyShift action_8
action_1 (17) = happyShift action_9
action_1 (18) = happyShift action_10
action_1 (25) = happyShift action_11
action_1 (29) = happyShift action_12
action_1 (33) = happyShift action_13
action_1 (34) = happyShift action_14
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (8) = happyGoto action_4
action_1 (9) = happyGoto action_5
action_1 (11) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_15

action_3 _ = happyReduce_7

action_4 _ = happyReduce_8

action_5 (14) = happyShift action_7
action_5 (16) = happyShift action_8
action_5 (17) = happyShift action_9
action_5 (18) = happyShift action_10
action_5 (25) = happyShift action_11
action_5 (29) = happyShift action_12
action_5 (33) = happyShift action_13
action_5 (34) = happyShift action_14
action_5 (5) = happyGoto action_23
action_5 (6) = happyGoto action_3
action_5 (8) = happyGoto action_4
action_5 (11) = happyGoto action_6
action_5 _ = happyReduce_1

action_6 (14) = happyShift action_21
action_6 (23) = happyShift action_22
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (19) = happyShift action_20
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_28

action_9 _ = happyReduce_29

action_10 _ = happyReduce_27

action_11 (14) = happyShift action_7
action_11 (16) = happyShift action_8
action_11 (17) = happyShift action_9
action_11 (18) = happyShift action_10
action_11 (25) = happyShift action_11
action_11 (29) = happyShift action_12
action_11 (33) = happyShift action_13
action_11 (34) = happyShift action_14
action_11 (5) = happyGoto action_2
action_11 (6) = happyGoto action_3
action_11 (8) = happyGoto action_4
action_11 (9) = happyGoto action_19
action_11 (11) = happyGoto action_6
action_11 _ = happyReduce_17

action_12 (21) = happyShift action_18
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (21) = happyShift action_17
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (21) = happyShift action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (35) = happyAccept
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (14) = happyShift action_28
action_16 (15) = happyShift action_29
action_16 (20) = happyShift action_30
action_16 (21) = happyShift action_31
action_16 (25) = happyShift action_32
action_16 (31) = happyShift action_33
action_16 (32) = happyShift action_34
action_16 (10) = happyGoto action_38
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (14) = happyShift action_28
action_17 (15) = happyShift action_29
action_17 (20) = happyShift action_30
action_17 (21) = happyShift action_31
action_17 (25) = happyShift action_32
action_17 (31) = happyShift action_33
action_17 (32) = happyShift action_34
action_17 (10) = happyGoto action_37
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (14) = happyShift action_28
action_18 (15) = happyShift action_29
action_18 (20) = happyShift action_30
action_18 (21) = happyShift action_31
action_18 (25) = happyShift action_32
action_18 (31) = happyShift action_33
action_18 (32) = happyShift action_34
action_18 (10) = happyGoto action_36
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (14) = happyShift action_7
action_19 (16) = happyShift action_8
action_19 (17) = happyShift action_9
action_19 (18) = happyShift action_10
action_19 (25) = happyShift action_11
action_19 (26) = happyShift action_35
action_19 (29) = happyShift action_12
action_19 (33) = happyShift action_13
action_19 (34) = happyShift action_14
action_19 (5) = happyGoto action_23
action_19 (6) = happyGoto action_3
action_19 (8) = happyGoto action_4
action_19 (11) = happyGoto action_6
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (14) = happyShift action_28
action_20 (15) = happyShift action_29
action_20 (20) = happyShift action_30
action_20 (21) = happyShift action_31
action_20 (25) = happyShift action_32
action_20 (31) = happyShift action_33
action_20 (32) = happyShift action_34
action_20 (10) = happyGoto action_27
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (19) = happyShift action_25
action_21 (27) = happyShift action_26
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (24) = happyShift action_24
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_16

action_24 (14) = happyShift action_50
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (14) = happyShift action_28
action_25 (15) = happyShift action_29
action_25 (20) = happyShift action_30
action_25 (21) = happyShift action_31
action_25 (25) = happyShift action_32
action_25 (31) = happyShift action_33
action_25 (32) = happyShift action_34
action_25 (10) = happyGoto action_49
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_9

action_27 (12) = happyShift action_39
action_27 (13) = happyShift action_40
action_27 (27) = happyShift action_48
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_22

action_29 _ = happyReduce_21

action_30 (14) = happyShift action_28
action_30 (15) = happyShift action_29
action_30 (20) = happyShift action_30
action_30 (21) = happyShift action_31
action_30 (25) = happyShift action_32
action_30 (31) = happyShift action_33
action_30 (32) = happyShift action_34
action_30 (10) = happyGoto action_47
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (14) = happyShift action_28
action_31 (15) = happyShift action_29
action_31 (20) = happyShift action_30
action_31 (21) = happyShift action_31
action_31 (25) = happyShift action_32
action_31 (31) = happyShift action_33
action_31 (32) = happyShift action_34
action_31 (10) = happyGoto action_46
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (14) = happyShift action_28
action_32 (15) = happyShift action_29
action_32 (20) = happyShift action_30
action_32 (21) = happyShift action_31
action_32 (25) = happyShift action_32
action_32 (31) = happyShift action_33
action_32 (32) = happyShift action_34
action_32 (7) = happyGoto action_44
action_32 (10) = happyGoto action_45
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_23

action_34 _ = happyReduce_24

action_35 _ = happyReduce_2

action_36 (12) = happyShift action_39
action_36 (13) = happyShift action_40
action_36 (22) = happyShift action_43
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (12) = happyShift action_39
action_37 (13) = happyShift action_40
action_37 (22) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (12) = happyShift action_39
action_38 (13) = happyShift action_40
action_38 (22) = happyShift action_41
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (14) = happyShift action_28
action_39 (15) = happyShift action_29
action_39 (20) = happyShift action_30
action_39 (21) = happyShift action_31
action_39 (25) = happyShift action_32
action_39 (31) = happyShift action_33
action_39 (32) = happyShift action_34
action_39 (10) = happyGoto action_61
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (14) = happyShift action_28
action_40 (15) = happyShift action_29
action_40 (20) = happyShift action_30
action_40 (21) = happyShift action_31
action_40 (25) = happyShift action_32
action_40 (31) = happyShift action_33
action_40 (32) = happyShift action_34
action_40 (10) = happyGoto action_60
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (27) = happyShift action_59
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (14) = happyShift action_7
action_42 (16) = happyShift action_8
action_42 (17) = happyShift action_9
action_42 (18) = happyShift action_10
action_42 (25) = happyShift action_11
action_42 (29) = happyShift action_12
action_42 (33) = happyShift action_13
action_42 (34) = happyShift action_14
action_42 (5) = happyGoto action_58
action_42 (6) = happyGoto action_3
action_42 (8) = happyGoto action_4
action_42 (11) = happyGoto action_6
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (14) = happyShift action_7
action_43 (16) = happyShift action_8
action_43 (17) = happyShift action_9
action_43 (18) = happyShift action_10
action_43 (25) = happyShift action_11
action_43 (29) = happyShift action_12
action_43 (33) = happyShift action_13
action_43 (34) = happyShift action_14
action_43 (5) = happyGoto action_57
action_43 (6) = happyGoto action_3
action_43 (8) = happyGoto action_4
action_43 (11) = happyGoto action_6
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (26) = happyShift action_56
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (12) = happyShift action_39
action_45 (13) = happyShift action_40
action_45 (28) = happyShift action_55
action_45 _ = happyReduce_11

action_46 (12) = happyShift action_39
action_46 (13) = happyShift action_40
action_46 (22) = happyShift action_54
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (12) = happyShift action_39
action_47 (13) = happyShift action_40
action_47 _ = happyReduce_20

action_48 _ = happyReduce_6

action_49 (12) = happyShift action_39
action_49 (13) = happyShift action_40
action_49 (27) = happyShift action_53
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (19) = happyShift action_51
action_50 (27) = happyShift action_52
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (14) = happyShift action_28
action_51 (15) = happyShift action_29
action_51 (20) = happyShift action_30
action_51 (21) = happyShift action_31
action_51 (25) = happyShift action_32
action_51 (31) = happyShift action_33
action_51 (32) = happyShift action_34
action_51 (10) = happyGoto action_64
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_13

action_53 _ = happyReduce_10

action_54 _ = happyReduce_25

action_55 (14) = happyShift action_28
action_55 (15) = happyShift action_29
action_55 (20) = happyShift action_30
action_55 (21) = happyShift action_31
action_55 (25) = happyShift action_32
action_55 (31) = happyShift action_33
action_55 (32) = happyShift action_34
action_55 (7) = happyGoto action_63
action_55 (10) = happyGoto action_45
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_26

action_57 (30) = happyShift action_62
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_4

action_59 _ = happyReduce_5

action_60 (12) = happyShift action_39
action_60 (13) = happyShift action_40
action_60 _ = happyReduce_19

action_61 (12) = happyShift action_39
action_61 (13) = happyShift action_40
action_61 _ = happyReduce_18

action_62 (14) = happyShift action_7
action_62 (16) = happyShift action_8
action_62 (17) = happyShift action_9
action_62 (18) = happyShift action_10
action_62 (25) = happyShift action_11
action_62 (29) = happyShift action_12
action_62 (33) = happyShift action_13
action_62 (34) = happyShift action_14
action_62 (5) = happyGoto action_66
action_62 (6) = happyGoto action_3
action_62 (8) = happyGoto action_4
action_62 (11) = happyGoto action_6
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_12

action_64 (12) = happyShift action_39
action_64 (13) = happyShift action_40
action_64 (27) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_14

action_66 _ = happyReduce_3

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (StatementLList happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 7 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (StatementIfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 5 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (StatementWhile happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 5 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (StatementPrint happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 5 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (StatementAssign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (StatementVarDeclr happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn5
		 (StatementArrayDeclr happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 _
	(HappyTerminal (TokenIdent _ happy_var_2))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (VarDeclrOnly happy_var_1 happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_2)) `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDeclrAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn7
		 (ExprList happy_var_1 EEmpty
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn7
		 (ExprList happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 5 8 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ArrayDeclrOnly happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 7 8 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdent _ happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ArrayDeclrAssign happy_var_1 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn9
		 (StatementList Empty happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  9 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (StatementList happy_var_1 happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_0  9 happyReduction_17
happyReduction_17  =  HappyAbsSyn9
		 (Empty
	)

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

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (ExprArrayAssign happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  11 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn11
		 (TypeBool
	)

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn11
		 (TypeInt
	)

happyReduce_29 = happySpecReduce_1  11 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn11
		 (TypeString
	)

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenOp _ happy_dollar_dollar -> cont 12;
	TokenCompareOp _ happy_dollar_dollar -> cont 13;
	TokenIdent _ happy_dollar_dollar -> cont 14;
	TokenIntLit _ happy_dollar_dollar -> cont 15;
	TokenInt _ -> cont 16;
	TokenString _ -> cont 17;
	TokenBool _ -> cont 18;
	TokenEquals _ -> cont 19;
	TokenNegate _ -> cont 20;
	TokenLeftParen _ -> cont 21;
	TokenRightParen _ -> cont 22;
	TokenLeftBracket _ -> cont 23;
	TokenRightBracket _ -> cont 24;
	TokenLeftBrace _ -> cont 25;
	TokenRightBrace _ -> cont 26;
	TokenSemiColon _ -> cont 27;
	TokenColon _ -> cont 28;
	TokenIf _ -> cont 29;
	TokenElse  _ -> cont 30;
	TokenTrue  _ -> cont 31;
	TokenFalse _ -> cont 32;
	TokenWhile _ -> cont 33;
	TokenPrint _ -> cont 34;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 35 tk tks = happyError' (tks, explist)
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
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc15460_0/ghc_2.h" #-}














































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

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

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
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

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
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

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
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
