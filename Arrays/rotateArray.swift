// Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

// Example 1:

// Input: nums = [1,2,3,4,5,6,7], k = 3
// Output: [5,6,7,1,2,3,4]
// Explanation:
// rotate 1 steps to the right: [7,1,2,3,4,5,6]
// rotate 2 steps to the right: [6,7,1,2,3,4,5]
// rotate 3 steps to the right: [5,6,7,1,2,3,4]
// Example 2:

// Input: nums = [-1,-100,3,99], k = 2
// Output: [3,99,-1,-100]
// Explanation: 
// rotate 1 steps to the right: [99,-1,-100,3]
// rotate 2 steps to the right: [3,99,-1,-100]
 

// Constraints:

// 1 <= nums.length <= 105
// -231 <= nums[i] <= 231 - 1
// 0 <= k <= 105
 

// Follow up:

// Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
// Could you do it in-place with O(1) extra space?

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let rotations = k % n
        
        func reverse(_ array: inout [Int], _ start: Int, _ end: Int) {
            var left = start, right = end
            while left < right {
                array.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        // reverse the entire array
        reverse(&nums, 0, n - 1)
        // reverse the first k elements
        reverse(&nums, 0, rotations - 1)
        // reverse the remaining n - k elements
        reverse(&nums, rotations, n - 1)
    }
}

// This solution makes the most sense when you need to rotate an array in-place with O(1) extra space and O(n) time complexity. In practical terms, you’d choose this reversal method when:
// 	•	Memory Constraints:
// You’re not allowed to use additional arrays or extra memory, as required by many interview challenges.
// 	•	Performance:
// The method runs in linear time, so even for large arrays, it’s efficient.
// 	•	Simplicity & Clarity:
// Once you understand the reversal trick, it provides a clear and elegant solution that’s easy to explain in an interview setting.
// 	•	Handling Edge Cases:
// The solution naturally handles cases where k is larger than the array length by using k % n.

// Overall, this approach is ideal for interviews and production scenarios where an in-place, efficient rotation is required.