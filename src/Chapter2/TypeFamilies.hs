{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Chapter2.TypeFamilies where

import GHC.TypeLits

type SymCmp = CmpSymbol "test" "test"
type SymCmp' = 'EQ

type NatArith = (Div 128 8) ^ 2

type SymbolList = "foo" ': "bar" ': '[]
type SymbolListSugared = ["foo", "bar"]

type BoolList = '[True]

type PromotedTuple = '(2, "tuple")

type family Or (x :: Bool) :: Bool where
    Or True = False
    Or False = True

type family Foo (x :: Bool) (y :: Bool) :: Bool

type family Bar x y :: Bool -> Bool -> Bool
