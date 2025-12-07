// Move Zeroes

// Solution
// Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

// Note that you must do this in-place without making a copy of the array.

 

// Example 1:

// Input: nums = [0,1,0,3,12]
// Output: [1,3,12,0,0]
// Example 2:

// Input: nums = [0]
// Output: [0]
 

// Constraints:

// 1 <= nums.length <= 104
// -231 <= nums[i] <= 231 - 1
 

// Follow up: Could you minimize the total number of operations done?

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        // create the pointers
        var trailing = 0
        var leading = 0

        while leading < nums.count {
            if nums[leading] != 0 {
                if leading != trailing {
                    var replacement = nums[leading]
                    nums[leading] = nums[trailing]
                    nums[trailing] = replacement
                }
                trailing += 1
            
            }
            leading += 1
        }
    }
}

// The two-pointer approach is particularly useful in situations like this, where you need to:
// 	•	Rearrange Elements In-Place:
// When you must modify the array without creating a copy. In “Move Zeroes,” you need to shift nonzero elements forward while pushing zeros to the end.
// 	•	Maintain Relative Order:
// The approach allows you to preserve the relative order of the non-target elements (in this case, nonzero numbers) because you only move them to the next available spot.
// 	•	Minimize Operations:
// By having one pointer scan the array and another pointer track where the next nonzero element should go, you only swap elements when necessary. This helps reduce the number of operations compared to other methods.
// 	•	Achieve Linear Time Complexity (O(n)):
// Both pointers traverse the array once, making this method efficient for large arrays.
// 	•	Use O(1) Extra Space:
// Since no additional arrays or significant extra memory is used, this method is ideal when space is a constraint.

// In summary, you’ll want to use this two-pointer approach when you need to partition or rearrange an array in place, particularly when you’re filtering elements (like moving zeros) while preserving the order of the rest. This strategy is common in many array manipulation problems, such as partitioning, segregating even/odd numbers, or removing duplicates.