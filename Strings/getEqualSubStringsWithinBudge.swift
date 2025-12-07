// 1208. Get Equal Substrings Within Budget
// Solved
// Medium

// Hint
// You are given two strings s and t of the same length and an integer maxCost.

// You want to change s to t. Changing the ith character of s to ith character of t costs |s[i] - t[i]| (i.e., the absolute difference between the ASCII values of the characters).

// Return the maximum length of a substring of s that can be changed to be the same as the corresponding substring of t with a cost less than or equal to maxCost. If there is no substring from s that can be changed to its corresponding substring from t, return 0.

 

// Example 1:

// Input: s = "abcd", t = "bcdf", maxCost = 3
// Output: 3
// Explanation: "abc" of s can change to "bcd".
// That costs 3, so the maximum length is 3.
// Example 2:

// Input: s = "abcd", t = "cdef", maxCost = 3
// Output: 1
// Explanation: Each character in s costs 2 to change to character in t,  so the maximum length is 1.
// Example 3:

// Input: s = "abcd", t = "acde", maxCost = 0
// Output: 1
// Explanation: You cannot make any change, so the maximum length is 1.
 

// Constraints:

// 1 <= s.length <= 105
// t.length == s.length
// 0 <= maxCost <= 106
// s and t consist of only lowercase English letters.

class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        // create the left pointer for the window
        var left = 0
        var currCost = 0
        var ans = 0

        // convert to ascii 
        var sChar = Array(s.utf8)
        var tChar = Array(t.utf8)

        for (i, (sc, tc)) in zip(sChar, tChar).enumerated() {
            currCost += abs(Int(sc) - Int(tc))
            // if currCost exceeds max cost
            while currCost > maxCost {
                // reduce window from the left
                currCost -= abs(Int(sChar[left]) - Int(tChar[left]))
                // increment left pointer
                left += 1
            }
            
            ans = max(ans, i - left + 1)
        }
        return ans
    }
}

// ChatGPT Suggestiosn: 

// Build a “cost” array up front
// Instead of subtracting inside the loop, you can map all of your per‑character costs into an [Int] once, then just slide over that array:
let costs = zip(s.utf8, t.utf8).map { abs(Int($0) - Int($1)) }
var left = 0, curr = 0, best = 0
for (i, cost) in costs.enumerated() {
  curr += cost
  while curr > maxCost {
    curr -= costs[left]
    left += 1
  }
  best = max(best, i - left + 1)
}
return best

// Using Character.asciiValue instead of UTF‑8 directly
// If you ever want to handle non‑ASCII input safely, you can iterate characters:
let sChars = Array(s)
let tChars = Array(t)
let costs = zip(sChars, tChars).map { 
  abs(Int($0.asciiValue ?? 0) - Int($1.asciiValue ?? 0)) 
}