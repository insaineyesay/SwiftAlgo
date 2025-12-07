// 557. Reverse Words in a String III
// Solved
// Easy

// Topics

// Companies
// Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

 

// Example 1:

// Input: s = "Let's take LeetCode contest"
// Output: "s'teL ekat edoCteeL tsetnoc"
// Example 2:

// Input: s = "Mr Ding"
// Output: "rM gniD"
 

// Constraints:

// 1 <= s.length <= 5 * 104
// s contains printable ASCII characters.
// s does not contain any leading or trailing spaces.
// There is at least one word in s.
// All the words in s are separated by a single space.

class Solution {
    func reverseWords(_ s: String) -> String {
        // create the pointers
        var start = 0, end = 0
        //create array from given string
        var chars = Array(s)

        // while the end is less than the total string count
        while end < chars.count {
            // if the current char is not an " ""
            // continue
            if chars[end] != " " {
                // iterate end
                end += 1
            // otherwise
            } else {
                // var tempArray = Array(repeating: String, count: end - start)
                // tempArray.reverse()
                chars[start..<end].reverse()
                end += 1
                start = end + 1
            }

            if end == chars.count - 1 {
                chars[start..<end].reverse()
            }
        }


        return chars
        
    }
}