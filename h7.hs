-- Zahlenspiel: A number guessing game where the computer guesses your number

import Data.Char (toLower)  -- Import for case-insensitive input handling

-- Main function to start the game
main :: IO ()
main = do
    putStrLn "Choose a number between 1 and 100!"
    guessNumber 1 100 1 -- Start guessing with the range 1 to 100 and attempt count 1

-- Function to guess the number
guessNumber :: Int -> Int -> Int -> IO ()
guessNumber low high attempts = do
    let mid = (low + high) `div` 2 -- Compute the midpoint
    putStrLn $ "Is it " ++ show mid ++ "?"
    response <- getLine
    case map toLower response of
        "yes" -> putStrLn $ "I won in " ++ show attempts ++ " attempts!"
        "greater" -> guessNumber (mid + 1) high (attempts + 1) -- Adjust range upward
        "smaller" -> guessNumber low (mid - 1) (attempts + 1) -- Adjust range downward
        _ -> do
            putStrLn "Please respond with 'greater', 'smaller', or 'yes'."
            guessNumber low high attempts -- Retry on invalid input
