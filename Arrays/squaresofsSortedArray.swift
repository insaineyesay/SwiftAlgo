// Squares of a Sorted Array

// Solution
// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

 

// Example 1:

// Input: nums = [-4,-1,0,3,10]
// Output: [0,1,9,16,100]
// Explanation: After squaring, the array becomes [16,1,0,9,100].
// After sorting, it becomes [0,1,9,16,100].
// Example 2:

// Input: nums = [-7,-3,2,3,11]
// Output: [4,9,9,49,121]
 

// Constraints:

// 1 <= nums.length <= 104
// -104 <= nums[i] <= 104
// nums is sorted in non-decreasing order.
 

// Follow up: Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }

        var result = Array(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        var position = nums.count - 1

        while left <= right {
            if abs(nums[left]) > abs(nums[right]) {
                var squaredValue = nums[left] * nums[left]
                result[position] = squaredValue
                left += 1
            } else {
                var squaredValue = nums[right] * nums[right]
                result[position] = squaredValue
                right -= 1
            }

            position -= 1
        }
        return result
    }
}

// When to Use the Two-Pointer Approach
// 	•	Sorted Arrays:
// The two-pointer technique is particularly effective when the array is already sorted or nearly sorted. Here, even though the original array is sorted, squaring the elements disturbs the order (especially with negatives). By using two pointers (one at each end), you can efficiently find the largest square without needing to re-sort the array.
// 	•	Processing from Both Ends:
// When the problem involves making decisions based on elements at both the beginning and the end of the array—like merging two sorted arrays, or in this case, comparing absolute values—it’s a good hint that a two-pointer strategy might be effective.
// 	•	In-Place or Linear Solutions:
// Many array problems ask for solutions with O(n) time complexity and O(1) or O(n) extra space. The two-pointer method is a common tool in your toolkit for such constraints.