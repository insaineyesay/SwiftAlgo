// Valid Sudoku

// Solution
// Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

// Each row must contain the digits 1-9 without repetition.
// Each column must contain the digits 1-9 without repetition.
// Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
// Note:

// A Sudoku board (partially filled) could be valid but is not necessarily solvable.
// Only the filled cells need to be validated according to the mentioned rules.
 

// Example 1:


// Input: board = 
// [["5","3",".",".","7",".",".",".","."]
// ,["6",".",".","1","9","5",".",".","."]
// ,[".","9","8",".",".",".",".","6","."]
// ,["8",".",".",".","6",".",".",".","3"]
// ,["4",".",".","8",".","3",".",".","1"]
// ,["7",".",".",".","2",".",".",".","6"]
// ,[".","6",".",".",".",".","2","8","."]
// ,[".",".",".","4","1","9",".",".","5"]
// ,[".",".",".",".","8",".",".","7","9"]]
// Output: true
// Example 2:

// Input: board = 
// [["8","3",".",".","7",".",".",".","."]
// ,["6",".",".","1","9","5",".",".","."]
// ,[".","9","8",".",".",".",".","6","."]
// ,["8",".",".",".","6",".",".",".","3"]
// ,["4",".",".","8",".","3",".",".","1"]
// ,["7",".",".",".","2",".",".",".","6"]
// ,[".","6",".",".",".",".","2","8","."]
// ,[".",".",".","4","1","9",".",".","5"]
// ,[".",".",".",".","8",".",".","7","9"]]
// Output: false
// Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 

// Constraints:

// board.length == 9
// board[i].length == 9
// board[i][j] is a digit 1-9 or '.'.

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // create collections to hold the characters 
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)

        // loop through each box 
        for i in 0..<9 {
            for j in 0..<9 {
                let character = board[i][j]

                if character == "." { continue }

                if rows[i].contains(character) {
                    return false
                } else {
                    rows[i].insert(character)
                }

                if columns[j].contains(character) {
                    return false
                } else {
                    columns[j].insert(character)
                }

                let cellIndex = (i / 3) * 3 + (j / 3)
                if boxes[cellIndex].contains(character) {
                    return false
                } else {
                    boxes[cellIndex].insert(character)
                }
            }
        }
        return true
    }
}

// That’s exactly right! Let me break it down further:
// 	1.	Dividing by 3 (i / 3):
// When you do integer division by 3, you’re essentially grouping the rows into three groups:
// 	•	Rows 0, 1, 2 become group 0.
// 	•	Rows 3, 4, 5 become group 1.
// 	•	Rows 6, 7, 8 become group 2.
// 	2.	Multiplying by 3:
// Now, because there are 3 sub-boxes in each row of sub-boxes, you multiply the group number by 3. This multiplication gives you the starting box index for that group. For example:
// 	•	For group 0 (rows 0-2), multiplying by 3 gives 0, which corresponds to sub-boxes 0, 1, and 2.
// 	•	For group 1 (rows 3-5), multiplying by 3 gives 3, corresponding to sub-boxes 3, 4, and 5.
// 	•	For group 2 (rows 6-8), multiplying by 3 gives 6, corresponding to sub-boxes 6, 7, and 8.
// 	3.	Adding j / 3:
// Similarly, j / 3 tells you which sub-box column (0, 1, or 2) the current cell is in. Adding this to the offset from i gives the final sub-box index.

// So, the complete formula:

// let boxIndex = (i / 3) * 3 + (j / 3)

// ensures that each cell is mapped to one of the 9 sub-boxes correctly.

// Does that clarify why we multiply (i / 3) by 3 in the formula?

// Here are some guidelines for when to use this approach (using arrays of sets with nested loops) for problems like Valid Sudoku:
// 	1.	Fixed-Size or Small Grids:
// When you have a grid of a known, relatively small size (like 9x9 for Sudoku), using separate arrays of sets for rows, columns, and sub-boxes is practical. The extra space is fixed and small.
// 	2.	Multiple Constraint Checks:
// Use this method when the problem requires validating multiple constraints simultaneously (e.g., no duplicate digits in each row, each column, and each sub-box). It’s a clear and structured way to enforce all rules concurrently.
// 	3.	Direct Mapping Between Coordinates and Groups:
// When you can mathematically determine groupings (like mapping (row, column) to one of nine sub-boxes), creating a function or using a formula like (i / 3) * 3 + (j / 3) helps maintain clarity and correctness in your logic.
// 	4.	When Iterating Over Every Element is Feasible:
// Since you’re processing every cell in the grid with nested loops, this approach works best when the total number of elements is limited. For Sudoku, 81 cells is manageable.
// 	5.	Early Termination Is Possible:
// If you find a violation (a duplicate in any set), you can immediately return false. This makes the approach efficient for validation, even though you are iterating through the entire grid in the worst-case scenario.
// 	6.	Clarity and Maintainability:
// Using separate data structures for rows, columns, and sub-boxes helps break down the problem into clear parts, making the code easier to understand and maintain.

// Overall, this approach is ideal for problems where you need to validate multiple overlapping constraints in a 2D grid, especially when the grid size is fixed or small.