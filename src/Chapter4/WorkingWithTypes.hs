{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Chapter4.WorkingWithTypes where

import Data.Typeable

-- broken :: (a -> b) -> a -> b
-- broken f a = apply
--   where
--     apply :: b
--     apply = f a

working :: forall a b. (a -> b) -> a -> b
working f a = apply
  where
    apply :: b
    apply = f a

maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap = fmap @Maybe

typeName :: forall a. (Typeable a) => String
typeName = show . typeRep $ Proxy @a

maybeStringName :: String
maybeStringName = typeName @(Maybe String)
