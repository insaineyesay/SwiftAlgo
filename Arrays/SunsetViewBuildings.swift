// Here’s an example of the “Buildings With an Ocean View” problem along with a walkthrough:


// Problem Statement

// You are given an array of integers where each integer represents the height of a building in a row, and the ocean is to the right of these buildings. A building has an ocean view if there are no taller buildings to its right. Return an array of the indices of all buildings that can see the ocean, ordered from left to right.

// Example 1:
// 	•	Input: heights = [4, 2, 3, 1]
// 	•	Output: [0, 2, 3]

// Explanation:
// 	•	Building 0 (height 4) can see the ocean because every building to its right is shorter.
// 	•	Building 1 (height 2) is blocked by building 2 (height 3).
// 	•	Building 2 (height 3) can see the ocean because building 3 (height 1) is shorter.
// 	•	Building 3 (height 1) is the rightmost building, so it always has a view.

// Example 2:
// 	•	Input: heights = [4, 3, 2, 1]
// 	•	Output: [0, 1, 2, 3]

// Explanation:
// Since the heights decrease as you move right, every building can see the ocean.

// ⸻

// Walkthrough of the Solution
// 	1.	Observation:
// Since the ocean is on the right, the rightmost building always has an ocean view. For any building, if it’s taller than every building to its right, then it can see the ocean.
// 	2.	Approach:
// A smart way to solve this is to iterate from right to left:
// 	•	Maintain a variable maxHeight:
// Initialize it with a very small number (or simply the height of the rightmost building). This variable will track the tallest building encountered so far.
// 	•	Iterate from the end:
// For each building at index i (starting from the right), check:
// 	•	If heights[i] is greater than maxHeight, then building i has an ocean view.
// 	•	Update maxHeight to be the maximum between maxHeight and heights[i].
// 	•	Record the indices:
// Add each qualifying index to a result list.
// 	•	Reverse the Result (if needed):
// Since you collect indices from right to left, reverse the result so that the indices are in increasing order.
// 	3.	Time and Space Complexity:
// 	•	Time Complexity: O(n) because you traverse the list once.
// 	•	Space Complexity: O(n) in the worst case (if every building has an ocean view), though no extra space is used for computation aside from the result list.

// ⸻

// Swift Code Example

class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        guard !heights.isEmpty else { return [] }
        
        var result = [Int]()
        var maxHeight = Int.min
        
        // Iterate from rightmost building to leftmost
        for i in stride(from: heights.count - 1, through: 0, by: -1) {
            if heights[i] > maxHeight {
                result.append(i)
                maxHeight = heights[i]
            }
        }
        
        // Reverse to return indices in ascending order (from left to right)
        return result.reversed()
    }
}

// Explanation of the Code:
// 	•	Guard Clause:
// Ensures the function handles an empty input array by returning an empty list.
// 	•	Iteration:
// Using stride(from:through:by:), we loop backwards. For each building, we compare its height to maxHeight.
// 	•	Updating maxHeight:
// If a building is taller than maxHeight, it means nothing to its right is taller, so it has an ocean view. We then update maxHeight accordingly.
// 	•	Result Reversal:
// Since we add indices in reverse order (rightmost first), reversing the result gives the correct order from leftmost to rightmost.

// ⸻

// This example should give you a clear picture of the problem and the reasoning behind the solution. Does this walkthrough help clarify the approach? Feel free to ask more questions or discuss any part of the solution in further detail!