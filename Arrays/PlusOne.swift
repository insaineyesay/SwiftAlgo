// <!-- Plus One

// Solution
// You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

// Increment the large integer by one and return the resulting array of digits.

 

// Example 1:

// Input: digits = [1,2,3]
// Output: [1,2,4]
// Explanation: The array represents the integer 123.
// Incrementing by one gives 123 + 1 = 124.
// Thus, the result should be [1,2,4].
// Example 2:

// Input: digits = [4,3,2,1]
// Output: [4,3,2,2]
// Explanation: The array represents the integer 4321.
// Incrementing by one gives 4321 + 1 = 4322.
// Thus, the result should be [4,3,2,2].
// Example 3:

// Input: digits = [9]
// Output: [1,0]
// Explanation: The array represents the integer 9.
// Incrementing by one gives 9 + 1 = 10.
// Thus, the result should be [1,0].
 

// Constraints:

// 1 <= digits.length <= 100
// 0 <= digits[i] <= 9
// digits does not contain any leading 0's. -->

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        // create something to track moving from the end of the array
        var digits = digits
        var right = digits.count - 1

        // to keep in bounds once the beginning of the array is reached
        // use a while look since decrementing from the right. 
        while right >= 0 {
            // if the last digit is a 9, there is a carry, and turn the last digit to 0
            if digits[right] == 9 {
                digits[right] = 0
                // decrement to continue through the array
                right -= 1  
            // if the number isn't a 9,
            } else {
                // increment it
                digits[right] += 1
                //  then end the loop
                return digits
            }
        }

        digits.insert(1, at: 0)
        return digits
    }
}