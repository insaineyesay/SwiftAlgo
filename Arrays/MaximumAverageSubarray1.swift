// Maximum Average Subarray I

// Solution
// You are given an integer array nums consisting of n elements, and an integer k.

// Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

 

// Example 1:

// Input: nums = [1,12,-5,-6,50,3], k = 4
// Output: 12.75000
// Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
// Example 2:

// Input: nums = [5], k = 1
// Output: 5.00000
 

// Constraints:

// n == nums.length
// 1 <= k <= n <= 105
// -104 <= nums[i] <= 104

// function fn(arr, k):
//     curr = some data to track the window

//     // build the first window
//     for (int i = 0; i < k; i++)
//         Do something with curr or other variables to build first window

//     ans = answer variable, probably equal to curr here depending on the problem
//     for (int i = k; i < arr.length; i++)
//         Add arr[i] to window
//         Remove arr[i - k] from window
//         Update ans

//     return ans

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // left brack of window
        var left = 0
        // right bracket of window
        var right = 0
        // holds the average of the current window
        var total = 0
        // the current window
        var curr = Array([])
        // the answer
        var maxAverage = 0
        
        // until the leading pointer hits the end of the array
        while right <= nums.count - 1 {
            // while the window count is less than k
            while right - left <= k {
                // extend the right of the window
                right += 1
            }
            // once its the right count, loop through it 
            for i in left..<right {
                // and add all the numbers up within
                total = total += nums[i]
                print(total)
                
            }
            // divide the total by k to get the average
            maxAverage = total / k
            // then shrink the window, making it invalid
            left += 1
            
        }
        maxAverage = max(maxAverage, total )
    }
}

// chatGPT Answer
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
      // start by summing first window of size k
        var total = 0
        for i in 0..<k {
            total += nums[i]
        }

        var maxTotal = total

        // slide the window
        for i in k..<nums.count {
            total += nums[i] - nums[i - k]  // shift window
            maxTotal = max(maxTotal, total)
        }

        return Double(maxTotal) / Double(k)
    }
}

// My understanding now: 
// This is a sliding window problem, but doesn't need the same kind of 'window'. It's a fixed size, so you get the metric from the first 'window' created, then slide the window, but using a for loop 
// to iterate until k meets the end of the array, but using nums[i] - nums[i-k] to move the window after each iteration, calculating the total as you go. 
// Then at the end, do the averaging of the max total, rather than doing it during each iteration. 

