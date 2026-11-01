module Wiki.Generators

import public QuickCheck
import Stage0.Biology.BiophysicalAggregation
import Stage0.Biology.BiologyScaleTransforms
import Stage0.BoxInt
import Stage0.Multiset

%default total

public export
Show DnaDoubleHelix where
  show (MkDnaDoubleHelix _ hb) = "DnaDoubleHelix(HBonds=" ++ show hb ++ ")"

public export
Arbitrary DnaDoubleHelix where
  arbitrary = do
    hb <- arbitrary {a = Nat}
    pure (MkDnaDoubleHelix emptyBox hb)

  coarbitrary (MkDnaDoubleHelix _ hb) gen = coarbitrary hb gen
