// “Remove Duplicates from Sorted Array III” (Hypothetical LeetCode-style)
// Difficulty: Medium
// Topic Tags: Arrays, Two Pointers, In-place Modification

// ⸻

// 💬 Prompt:

// You are given an integer array nums sorted in non-decreasing order. Remove some duplicates in-place such that each unique element appears at most three times.

// Return the integer k — the number of elements in the resulting array — and modify nums in-place such that the first k elements of nums contain the final result. It does not matter what you leave beyond k.

// Your algorithm must run with O(1) extra memory.

// ⸻

// 🧪 Custom Judge:

// The judge will test your solution with this setup:

// var nums = [...]        // Input array
// let expectedNums = [...] // Expected array with correct length

// let k = removeDuplicates(&nums) // Your function

// assert(k == expectedNums.count)
// for i in 0..<k {
//     assert(nums[i] == expectedNums[i])
// }



// ⸻

// 📘 Example 1:

// Input:

// nums = [1,1,1,1,2,2,3]

// Output:
// k = 6, nums = [1,1,1,2,2,3,_]
// Explanation:
// You must keep at most three 1s. The extra 1 is removed.

// ⸻

// 📘 Example 2:

// Input:

// nums = [0,0,0,0,1,1,1,1,2,3,3]

// Output:
// k = 9, nums = [0,0,0,1,1,1,2,3,3,_,_]
// Explanation:
// Only three 0s and three 1s should be kept.

// ⸻

// ⚠️ Constraints:
// 	•	1 <= nums.length <= 3 * 10⁴
// 	•	-10⁴ <= nums[i] <= 10⁴
// 	•	nums is sorted in non-decreasing order

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // set count to var 
        var n = nums.count
        // set a placeholder for the answer
        var writer = 3

        // loop through the array
        for i in 3..<n {
            if nums[i] != nums[writer - 3] {
                nums[writer] = nums[i]
                writer += 1
            }
        }
        return writer
    }
}

// Generic Pattern to study
let maxAllowed = 3
var writer = maxAllowed

for i in maxAllowed..<nums.count {
    if nums[i] != nums[writer - maxAllowed] {
        nums[writer] = nums[i]
        writer += 1
    }
}   