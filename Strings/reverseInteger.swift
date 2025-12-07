//  Reverse Integer

// Solution
// Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 

// Example 1:

// Input: x = 123
// Output: 321
// Example 2:

// Input: x = -123
// Output: -321
// Example 3:

// Input: x = 120
// Output: 21
 

// Constraints:

// -231 <= x <= 231 - 1

class Solution {
    func reverse(_ x: Int) -> Int {
        // handle negative signs
        let sign = x < 0 ? -1 : 1
        // work with the absolute value of x
        var num = abs(x)
        // var for result
        var result = 0
        // var for each individual digit of x
        var digit = 0

        // while x still has digits
        while num > 0 {
            // pop the last digit off
            digit = num % 10
            // update the value of x after you pop off the last digit
            num = num / 10
            // add the digit to the end of the expected result
            result = result * 10 + digit
        }

        // deal with the requirement of a large integer
        if result > Int32.max {
            return 0
        }

        // add the sign back 
        return result * sign
    }
}

// Exactly! To “break up” the number, you can use a loop that repeatedly does two things:
// 	1.	Extract the Last Digit:
// Use the modulo operator (x % 10) to get the last digit of the number.
// For example, with 123, 123 % 10 gives you 3.
// 	2.	Remove the Last Digit:
// Update the number by performing integer division by 10 (x = x / 10).
// With 123, after extracting 3, you update it to 12.
// Then, 12 % 10 gives you 2, and updating 12 / 10 gives you 1.
// Finally, 1 % 10 gives you 1, and 1 / 10 becomes 0, which stops the process.

// This process effectively “breaks up” the number into its individual digits. You can then use these digits to build the reversed number step by step.

// To build a number from individual digits, you typically use a variable (often called reversed or result) initialized to 0. Then, for each digit you extract, you update the variable as follows:

// result = result * 10 + digit

// Here’s why this works:
// 	•	Multiplication by 10:
// When you multiply your current result by 10, you shift its digits one place to the left. For example, if result is 12 and you multiply by 10, it becomes 120.
// 	•	Adding the Digit:
// Then, adding the new digit fills in the rightmost position. So, if you then add 3 to 120, you get 123.

// When you process the digits in order (for a reversal, you’ll typically extract them from the end of the original number), this formula builds up the final number step by step.

// Does that help clarify how to build a number from its digits?

// Let’s take the number 123 as an example:
// 	1.	Initial Number:
// 123
// 	2.	Extract the Last Digit:
// 	•	Compute 123 % 10
// 	•	Result: 3
// 	•	This gives you the last digit (3).
// 	3.	Remove the Last Digit:
// 	•	Update the number with integer division: 123 / 10
// 	•	Result: 12
// 	•	Now the number becomes 12, with the last digit removed.
// 	4.	Repeat the Process:
// 	•	For the updated number 12:
// 	•	12 % 10 gives 2 (the last digit).
// 	•	12 / 10 results in 1 (removing that digit).
// 	•	For the number 1:
// 	•	1 % 10 gives 1.
// 	•	1 / 10 gives 0, ending the loop.

// Start: 123
//     └─> 123 % 10 = 3   (last digit)
//     └─> 123 / 10 = 12  (remaining number)

// Now: 12
//     └─> 12 % 10 = 2    (last digit)
//     └─> 12 / 10 = 1    (remaining number)

// Now: 1
//     └─> 1 % 10 = 1     (last digit)
//     └─> 1 / 10 = 0     (remaining number, stop)

// By using these two operations in a loop, you effectively “break up” the number into its individual digits (3, then 2, then 1), which you can then use as needed (like for building the reversed number).