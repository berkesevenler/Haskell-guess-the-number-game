import Data.Char (toLower) 
main :: IO ()
main = do
    putStrLn "Choose a number between 1 and 100!"
    guessNumber 1 100 1 
guessNumber :: Int -> Int -> Int -> IO ()
guessNumber low high attempts = do
    let mid = (low + high) `div` 2
    putStrLn $ "Is it " ++ show mid ++ "?"
    response <- getLine
    case map toLower response of
        "yes" -> putStrLn $ "I won in " ++ show attempts ++ " attempts!"
        "greater" -> guessNumber (mid + 1) high (attempts + 1) 
        "smaller" -> guessNumber low (mid - 1) (attempts + 1) 
        _ -> do
            putStrLn "Please respond with 'greater', 'smaller', or 'yes'."
            guessNumber low high attempts 
