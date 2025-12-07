// Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

// You must implement a solution with a linear runtime complexity and use only constant extra space.

 

// Example 1:

// Input: nums = [2,2,1]

// Output: 1

// Example 2:

// Input: nums = [4,1,2,1,2]

// Output: 4

// Example 3:

// Input: nums = [1]

// Output: 1

 

// Constraints:

// 1 <= nums.length <= 3 * 104
// -3 * 104 <= nums[i] <= 3 * 104
// Each element in the array appears twice except for one element which appears only once.

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result  = 0
        for num in nums {
            result  = result ^ num
        }       
        return result 
    }
}

// Here are some guidelines to help you recognize when the XOR approach might be the right tool for a problem:
// 	•	Pair Cancellation Clues:
// If the problem states that every element appears twice (or an even number of times) except for one, that’s a strong hint. The XOR operation naturally cancels out numbers that appear in pairs since a \oplus a = 0.
// 	•	Constant Extra Space Requirement:
// When the problem explicitly requires O(1) extra space, that rules out solutions involving extra data structures like sets or dictionaries. XOR, which uses a single accumulator, is a good candidate in these cases.
// 	•	Linear Time Complexity Constraint:
// If the problem demands an O(n) solution, XOR is often a natural fit because you can process each element exactly once.
// 	•	Bit-Level or Integer Array Hints:
// Problems that involve integer arrays and hint at bit manipulation (sometimes mentioned explicitly in interview questions) may be well-suited for an XOR solution.
// 	•	Unique Element Identification:
// When the goal is to identify a unique element among duplicates (or when the uniqueness pattern fits the XOR cancellation idea), consider using XOR.

// These cues should help you decide if the XOR trick is applicable. It’s all about spotting that pattern of pair cancellation and the need for an efficient, in-place solution.