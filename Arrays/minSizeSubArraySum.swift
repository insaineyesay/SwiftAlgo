// 209. Minimum Size Subarray Sum

// Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.
// Example 1:

// Input: target = 7, nums = [2,3,1,2,4,3]
// Output: 2
// Explanation: The subarray [4,3] has the minimal length under the problem constraint.
// Example 2:

// Input: target = 4, nums = [1,4,4]
// Output: 1
// Example 3:

// Input: target = 11, nums = [1,1,1,1,1,1,1,1]
// Output: 0
 

// Constraints:

// 1 <= target <= 109
// 1 <= nums.length <= 105
// 1 <= nums[i] <= 104
 

// Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        // use this to track ans because since we're looking at min..
        // as soon as it updates, it will be lower than this, and most likely
        // never go higher.
        var ans = Int.max
        var n = nums.count
        var sum = 0
        // catch an edge case
        if nums[0] == target { return 1 }

        for i in 0..<n {
            sum += nums[i]

            while sum >= target {
                // here, use the formula to track the min WINDOW SIZE not the sum
                ans = min(ans, i - left + 1)
                // be sure to subtract the left pointer, not i
                sum -= nums[left]
                left += 1
            }
        }
        
        return ans == Int.max ? 0 : ans
    }
}