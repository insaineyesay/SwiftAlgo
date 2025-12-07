// #   Max Consecutive Ones III

// # Solution
// # Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

 

// # Example 1:

// # Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
// # Output: 6
// # Explanation: [1,1,1,0,0,1,1,1,1,1,1]
// # Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
// # Example 2:

// # Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
// # Output: 10
// # Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
// # Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 

// # Constraints:

// # 1 <= nums.length <= 105
// # nums[i] is either 0 or 1.
// # 0 <= k <= nums.length

class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var maxArray = 0
        var left = 0
        var right = 0
        var flipped = k
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                flipped -= 1
            }
            
            while flipped < 0 {
                if nums[left] == 0 {
                    flipped += 1
                } 
                left += 1
            }
            maxArray = max(maxArray, i - left + 1)
        }
        
        return maxArray
    }
}

