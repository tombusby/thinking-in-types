{-# LANGUAGE InstanceSigs #-}

module Chapter3.Variance where

import Data.Char (isSpace)

newtype T1 a = T1 (Int -> a)
newtype T2 a = T2 (a -> Int)
newtype T3 a = T3 (a -> a)
newtype T4 a = T4 ((Int -> a) -> Int)
newtype T5 a = T5 ((a -> Int) -> Int)

instance Functor T1 where
  fmap :: (a -> b) -> T1 a -> T1 b
  fmap g (T1 f) = T1 (g . f)

instance Functor T5 where
  fmap :: (a -> b) -> T5 a -> T5 b
  fmap f (T5 g) = T5 $ \h -> g (h . f)

t5ConcreteString :: T5 String
t5ConcreteString = T5 $ \f -> f "foo"

t5ConcreteBool :: T5 Bool
t5ConcreteBool = all isSpace <$> t5ConcreteString

runT5 :: (a -> Int) -> T5 a -> Int
runT5 f (T5 g) = g f

-- λ> runT5 (\b -> if b then 1 else 2) t5ConcreteBool
-- 2
-- λ> runT5 (length) t5ConcreteString
-- 3
