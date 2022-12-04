module Utils
  ( solve,
  sumBy
  )
where

import System.IO
import System.TimeIt

solve :: (Show ans1, Show ans2) => String -> (String -> ans1) -> (String -> ans2) -> IO ()
solve q p1 p2 = do
  let inputFile = "src/inputs/Day" ++ q ++ ".txt"
  handle <- openFile inputFile ReadMode
  contents <- hGetContents handle
  timeIt
    ( do
        putStrLn ("Part 1: " ++ show (p1 contents))
        putStrLn ("Part 2: " ++ show (p2 contents))
    )

  hClose handle

sumBy :: Num a => (b -> a) -> [b] -> a
sumBy f = sum . map f