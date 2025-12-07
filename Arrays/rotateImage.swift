// Rotate Image
// transpose-plus-reverse approach

// Solution
// You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

// You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

 

// Example 1:


// Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
// Output: [[7,4,1],[8,5,2],[9,6,3]]
// Example 2:


// Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
// Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
 

// Constraints:

// n == matrix.length == matrix[i].length
// 1 <= n <= 20
// -1000 <= matrix[i][j] <= 1000

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        // create some vars
        var i = 0
        var j = matrix.count
        var matrixCount = matrix.count

        for i in 0..<matrixCount - 1 {
            for j in (i + 1)..<matrixCount {
                var temp = matrix[j][i]
                matrix[j][i] = matrix[i][j]
                matrix[i][j] = temp
            }

        }

        for i in 0..<matrixCount {
            matrix[i].reverse()
        }
    }
}

// It can definitely feel overwhelming at first! The transpose-plus-reverse approach is a common trick, but it may not be obvious immediately. Let’s break it down step by step and discuss how you might think about it:
// 	1.	Transpose Step:
// 	•	Idea: When you transpose a matrix, you flip it over its diagonal. That means you swap matrix[i][j] with matrix[j][i].
// 	•	How to think about it: Imagine you’re mirroring the matrix. The top-right element becomes the bottom-left element, and so on. You only swap elements above (or below) the diagonal to avoid swapping twice.
// 	•	Practice Tip: Try writing down a small 3x3 matrix on paper. Draw its diagonal and see how each number moves when you flip the rows and columns.
// 	2.	Reverse Each Row:
// 	•	Idea: After transposing, each row is in the wrong order for a 90° clockwise rotation. Reversing every row moves the elements into the correct positions.
// 	•	How to think about it: If you have a transposed matrix, look at one row. Reversing it will move the element that was originally at the top to the left, which is exactly what you need for a clockwise rotation.
// 	•	Practice Tip: Write down a transposed row and manually reverse it to see how it corresponds to the rotated image.
// 	3.	Connecting the Two Steps:
// 	•	Why this works: The combination of transposing (swapping rows and columns) and then reversing each row effectively rotates the matrix 90° clockwise.
// 	•	Visualization: Picture a 3x3 grid. Transposing rearranges the grid so that the first row becomes the first column. Then, reversing each row shifts the positions, resulting in the final rotated image.
// 	4.	Coming Up with It Yourself:
// 	•	Sometimes these techniques come with practice and exposure to similar problems.
// 	•	A good strategy is to start by thinking about the positions: Ask yourself, “Where does the element at (0,0) go?” or “Where should the element at (0,1) end up?”
// 	•	Experiment with small matrices (like 2x2 or 3x3) to see the pattern, then look for operations (like transpose or reverse) that consistently achieve that.

// Remember, it’s totally normal not to come up with this solution on your own right away. Even experienced programmers often learn these patterns by studying and practicing. Keep working through similar problems, and over time these strategies will start to feel more natural.

// How do you feel about trying out some practice examples on paper to see the transformation step by step? Let me know if you’d like to discuss any specific part further!