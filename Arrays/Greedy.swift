// Greedy 
// #typesOfAlgos 
// Best Time to Buy and Sell Stock II

// You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
// On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.
// Find and return the maximum profit you can achieve.
//  
// Example 1:
// Input: prices = [7,1,5,3,6,4]
// Output: 7
// Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
// Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
// Total profit is 4 + 3 = 7.
// Example 2:
// Input: prices = [1,2,3,4,5]
// Output: 4
// Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
// Total profit is 4.
// Example 3:
// Input: prices = [7,6,4,3,1]
// Output: 0
// Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
//  
// Constraints:
// * 1 <= prices.length <= 3 * 104
// * 0 <= prices[i] <= 104

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // set a var to accumlate profit
        var profit = 0
        // if the input is empty return
        guard prices.count > 0 else { return 0 }
        
        // start at i
        var i = 0
        
        for i in 0..<(prices.count - 1) {
            if prices[i + 1] > prices[i] {
                // if the next price is greater than the current price
                // add the difference to the profit
                profit += prices[i + 1] - prices[i]
            }
        }
        // return the profit
        return profit
    }
}

// When to Use the Greedy Approach
// 	•	Local Choices Lead to Global Optimum:
// Greedy algorithms work well when making a series of locally optimal decisions guarantees a globally optimal solution. For instance, the stock trading problem works because any local profit contributes directly to the total maximum profit.
// 	•	Optimal Substructure and Greedy-Choice Property:
// A problem is a good candidate for a greedy approach if:
// 	•	It has an optimal substructure (the optimal solution can be constructed from optimal solutions to its subproblems).
// 	•	It satisfies the greedy-choice property (a locally optimal choice leads to a global optimum).
// 	•	Simplicity and Efficiency:
// If a greedy solution is available, it is often simpler and more efficient (in both time and space) than more complex approaches like dynamic programming. However, be cautious: not every problem with optimal substructure can be solved by greedy methods if the greedy-choice property doesn’t hold.
// 	•	Real-Time Decisions:
// Greedy algorithms are often a natural fit for problems where decisions are made sequentially and you can’t go back and revise previous choices (like scheduling or route planning).