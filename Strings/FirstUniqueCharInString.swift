// First Unique Character in a String

// Solution
// Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

 

// Example 1:

// Input: s = "leetcode"

// Output: 0

// Explanation:

// The character 'l' at index 0 is the first character that does not occur at any other index.

// Example 2:

// Input: s = "loveleetcode"

// Output: 2

// Example 3:

// Input: s = "aabb"

// Output: -1

 

// Constraints:

// 1 <= s.length <= 105
// s consists of only lowercase English letters.

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        var result = 0
        var sum = 0
        
        for char in s {
            dict[char, default: 0] += 1
            sum += 1
        }

        for (index, char) in s.enumerated() {
            if let freq = dict[char] {
                if freq >= 2 {
                result = -1
                return result
            }
            
            if freq == 1 {
                result = index
                return result 
            }
            }
        }
        if sum % 2 == 0 {
            result = -1
        }
        return result
    }
}