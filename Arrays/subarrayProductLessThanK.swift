// 713. Subarray Product Less Than K
// Medium

// Hint
// Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.

 

// Example 1:

// Input: nums = [10,5,2,6], k = 100
// Output: 8
// Explanation: The 8 subarrays that have product less than 100 are:
// [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
// Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
// Example 2:

// Input: nums = [1,2,3], k = 0
// Output: 0
 

// Constraints:

// 1 <= nums.length <= 3 * 104
// 1 <= nums[i] <= 1000
// 0 <= k <= 106

//notes to self, remember in these sorts of problems its ok to use i rather than right. Specifically for sliding window. Two pointers can't do this.    

//iteration 1
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var left = 0
        var right = 0
        var n = nums.count
        // for if nums is just one index
        var prod = nums[0]
        if prod == 1 { return nums[0] > 100 ? 0 : 1}

        // start with a sliding window
        // as we extend right, we add +1 to ans every time the subarray < k
        // when we get to an invalid window, we increment left
        // the answer should be the total amount of subarrays in the array
        // remember j - i + 1 (right - left + 1)
        for i in 1..<n {
            
            print(prod)
            while prod > 100 {
                print("while")
                left += 1
                prod *= nums[i]
            } 
            prod *= nums[i]
            ans += 1
            right += 1
        }
        return ans
    }
}

// iteration 2: asked chatGPT for guidance
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var left = 0
        var right = 0
        var n = nums.count
        // for if nums is just one index
        var prod = nums[0]
        // if prod == 1 { return nums[0] > 100 ? 0 : 1}

        // start with a sliding window
        // as we extend right, we add +1 to ans every time the subarray < k
        // when we get to an invalid window, we increment left
        // the answer should be the total amount of subarrays in the array
        // remember j - i + 1 (right - left + 1)
        for i in 0..<n {
            
            print("for", prod)
            while prod > 100 {
                print("while", prod)
                left += 1
                // needed to devide not multiply here
                prod /= nums[left]
            } 
            prod *= nums[right]
            // neded to incoporate the formula here
            ans += right - left + 1
            // still increment right
            right += 1
        }
        return ans
    }
}

// 3rd iteration
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var left = 0
        var n = nums.count
        var prod = 1
        if k <= 1 { return 0 }

        for i in 0..<n {
            prod *= nums[i]

            while prod >= k {
                prod /= nums[left]
                left += 1
            } 

            ans += i - left + 1
        }
        return ans
    }
}