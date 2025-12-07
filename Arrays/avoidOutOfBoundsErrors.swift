// <!-- Here are some general guidelines:

// Avoiding Out-of-Bounds Errors
// 	•	Check Array Length:
// Always confirm that the array isn’t empty before you start iterating, often using a guard statement (as you did) or an if-check.
// 	•	Define Clear Loop Ranges:
// Use Swift’s range operators wisely. For example, if you need to access array[i+1], iterate over 0..<(array.count - 1) to ensure you never hit the last index without a valid i+1.
// 	•	Use Safe Methods:
// Swift’s collection types often come with methods like first, last, or indices that help avoid direct indexing errors. For example, using for i in array.indices guarantees you’re iterating only valid indices.
// 	•	Boundary Conditions:
// When accessing an element at an index offset (like i+1), always plan your loop so that your index plus offset is within the array’s bounds. If the algorithm is complex, consider writing tests or assertions to validate index usage.

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

// By keeping these guidelines in mind, you’ll be better equipped to write safe loops and decide when a greedy algorithm is appropriate. Let me know if you’d like further clarification on any of these points! -->