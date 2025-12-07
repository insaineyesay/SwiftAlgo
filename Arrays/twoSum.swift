// Two Sum

// Solution
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// You can return the answer in any order.

 

// Example 1:

// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
// Example 2:

// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// Example 3:

// Input: nums = [3,3], target = 6
// Output: [0,1]
 

// Constraints:

// 2 <= nums.length <= 104
// -109 <= nums[i] <= 109
// -109 <= target <= 109
// Only one valid answer exists.
 

// Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // create a dictionary to reference values
        var dict: [Int:Int] = [nums[0]:0]
        // create a pointer
        var i = 1
        // create something to store the result
        var result = [Int]()

        // loop through but stop at the end
        while i < nums.count {
            // unwrap the dictionary value if it exists
            if let complement = dict[target - nums[i]] {
                // if it does, then add both indices to the result array
                result += [complement, i]
                // and exit
                break
            // otherwise
            } else {
                // add the index to the dictoary
                dict[nums[i]] = i
            }
            // and iterate the pointer on every go around
            i += 1
        }
        return result
    }
}