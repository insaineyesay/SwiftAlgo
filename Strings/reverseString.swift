// Reverse String

// Solution
// Write a function that reverses a string. The input string is given as an array of characters s.

// You must do this by modifying the input array in-place with O(1) extra memory.

 

// Example 1:

// Input: s = ["h","e","l","l","o"]
// Output: ["o","l","l","e","h"]
// Example 2:

// Input: s = ["H","a","n","n","a","h"]
// Output: ["h","a","n","n","a","H"]
 

// Constraints:

// 1 <= s.length <= 105
// s[i] is a printable ascii character.

class Solution {
    func reverseString(_ s: inout [Character]) {
        // create pointers
        var left = 0
        var right = s.count - 1

        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }       
    }
}

// Exactly! The two-pointer approach is ideal here because:
// 	•	In-Place Modification:
// It swaps elements directly within the array, so no additional array is created.
// 	•	Constant Extra Space:
// It uses only two pointer variables, which meets the O(1) extra memory requirement.
// 	•	Linear Time Complexity:
// Each element is visited at most once, giving an O(n) time complexity.

// This combination of in-place changes and minimal memory usage makes the two-pointer method the best fit for reversing a string in this problem.