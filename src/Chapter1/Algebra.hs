module Chapter1.Algebra where

t1, t2, t3, t4, t5, t6, t7, t8 :: Either Bool (Bool, Maybe Bool)
t1 = Left False
t2 = Left True
t3 = Right (False, Nothing)
t5 = Right (False, Just False)
t6 = Right (False, Just True)
t4 = Right (True, Nothing)
t7 = Right (True, Just False)
t8 = Right (True, Just True)
