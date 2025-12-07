// Minimum Window Substring

// Solution
// Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

// The testcases will be generated such that the answer is unique.

 

// Example 1:

// Input: s = "ADOBECODEBANC", t = "ABC"
// Output: "BANC"
// Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
// Example 2:

// Input: s = "a", t = "a"
// Output: "a"
// Explanation: The entire string s is the minimum window.
// Example 3:

// Input: s = "a", t = "aa"
// Output: ""
// Explanation: Both 'a's from t must be included in the window.
// Since the largest window of s only has one 'a', return empty string.
 

// Constraints:

// m == s.length
// n == t.length
// 1 <= m, n <= 105
// s and t consist of uppercase and lowercase English letters.
 

// Follow up: Could you find an algorithm that runs in O(m + n) time?

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // Edge case: if either string is empty, return empty string.
        if s.isEmpty || t.isEmpty {
            return ""
        }
        
        // Build a dictionary to count the frequency of each character in t.
        var dictT: [Character: Int] = [:]
        for char in t {
            dictT[char, default: 0] += 1
        }
        // Number of unique characters in t that must be present in the window.
        let required = dictT.count
        
        // Convert s to an array of characters for easier indexing.
        let sArray = Array(s)
        
        // Two pointers for the sliding window.
        var left = 0, right = 0
        
        // Formed counts how many characters in the current window match the required frequency in t.
        var formed = 0
        
        // Dictionary to count the frequency of characters in the current window.
        var windowCounts: [Character: Int] = [:]
        
        // (window length, left, right) tuple for the best (smallest) window.
        var ans = (Int.max, 0, 0)
        
        // Start sliding the window using the right pointer.
        while right < sArray.count {
            let char = sArray[right]
            windowCounts[char, default: 0] += 1
            
            // If the current character's frequency in the window matches the required count in t, increment formed.
            if let requiredCount = dictT[char], windowCounts[char] == requiredCount {
                formed += 1
            }
            
            // Try and contract the window till it ceases to be 'desirable'
            while left <= right && formed == required {
                let charLeft = sArray[left]
                
                // Save the smallest window until now.
                if right - left + 1 < ans.0 {
                    ans = (right - left + 1, left, right)
                }
                
                // The character at the position pointed by the `left` pointer is no longer a part of the window.
                windowCounts[charLeft, default: 0] -= 1
                if let requiredCount = dictT[charLeft], windowCounts[charLeft]! < requiredCount {
                    formed -= 1
                }
                
                left += 1
            }
            
            // Expand the window.
            right += 1
        }
        
        // Return the smallest window or an empty string if no window is found.
        return ans.0 == Int.max ? "" : String(sArray[ans.1...ans.2])
    }
}