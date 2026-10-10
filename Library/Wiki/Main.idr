module Wiki.Main

import Wiki.BiologyScaleTransformSpec
import Stage0.Biology.EnzymeKinetics
import System

%default total

export
runBiologyWikiSuite : IO ()
runBiologyWikiSuite = do
  putStrLn "=========================================================================="
  putStrLn "   🧬 IDRIS2 DISCRETE SYSTEMS BIOLOGY WIKI VERIFICATION RUNNER 🧬"
  putStrLn "=========================================================================="
  putStrLn ""
  putStrLn "--- PART 1: BIOLOGY ScaleTransform & HYDROGEN BOND COUNT HOMOMORPHISM ---"
  p <- auditBiologyScaleTransformSpecProof
  if p
     then putStrLn "   -> PASS: DNA ScaleTransform -> Hydrogen Bond Count & Homomorphism verified (QuickCheck)."
     else do
       putStrLn "   -> FAIL: Biology ScaleTransform check failed."
       exitWith (ExitFailure 1)

  putStrLn ""
  putStrLn "--- PART 2: OBSERVER EPOCH (k=38) ENZYMATIC METABOLISM (TRANSITION NETWORK) ---"
  if auditEnzymeKineticsFullProof
     then putStrLn "   -> PASS: Observer Epoch enzymatic catalysis and ATP hydrolysis conservation verified."
     else do
       putStrLn "   -> FAIL: Enzyme kinetics conservation check failed."
       exitWith (ExitFailure 1)

  putStrLn ""
  putStrLn "=========================================================================="
  putStrLn "   ✨ ALL DISCRETE BIOLOGY SUITES PASSED WITH 100% TOTALITY! ✨"
  putStrLn "=========================================================================="
