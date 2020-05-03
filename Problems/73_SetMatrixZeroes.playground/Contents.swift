/*:
 # Set Matrix Zeroes
 https://leetcode.com/problems/set-matrix-zeroes/
 ___
 
 Given a `m x n` matrix, change all elements of row i and column j to 0 if cell (i, j) has value 0.
 
 Example 1:
 
 ### Input:
 ```
 [
   [1,1,1],
   [1,0,1],
   [1,1,1]
 ]
 ```
 ### Output:
 ```
 [
   [1,0,1],
   [0,0,0],
   [1,0,1]
 ]
 ```
 
 Follow up:

 + A straight forward solution using O(mn) space is probably a bad idea.
 + A simple improvement uses O(m + n) space, but still not the best solution.
 + Could you devise a constant space solution?

 */


import Foundation

// Time Complexity: O(M × N) where M and N are the number of rows and columns respectively.
// Space Complexity: O(M + N)
func setMatrixZeroes(_ matrix: inout [[Int]]) {
    
    var rowSet = Set<Int>()
    var columnSet = Set<Int>()
    
    for (rowIndex, eachArray) in matrix.enumerated() {
        for (columnIndex, eachValue) in eachArray.enumerated() {
            if eachValue == 0 {
                rowSet.insert(rowIndex)
                columnSet.insert(columnIndex)
            }
        }
    }
    
    for rowIndex in 0..<matrix.count {
        for columnIndex in 0..<matrix[rowIndex].count {
            if rowSet.contains(rowIndex) ||
                columnSet.contains(columnIndex) {
                matrix[rowIndex][columnIndex] = 0
            }
            
        }
    }
    
    print(matrix)
}

// Time Complexity: O(M × N) where M and N are the number of rows and columns respectively.
// Space Complexity: O(1)
func setMatrixZeroesRevised(_ matrix: inout [[Int]]) {

    let rowCount = matrix.count
    let columnCount = matrix.first?.count ?? 0
    
    var isColumn: Bool = false
    
    for i in 0..<rowCount {
        
        // Since first cell for both first row and first column is the same i.e. matrix[0][0]
        // We can use an additional variable for either the first row/column.
        // For this solution we are using an additional variable for the first column
        // and using matrix[0][0] for the first row.
        
        if matrix[i][0] == 0 {
            isColumn = true
        }
        
        for j in 1..<columnCount {
            
             // If an element is zero, we set the first element of the corresponding row and column to 0
            if matrix[i][j] == 0 {
                matrix[0][j] = 0
                matrix[i][0] = 0
            }
        }
    }
    
    // Iterate over the array once again and using the first row and first column, update the elements.
    for i in 1..<rowCount {
        for j in 1..<columnCount {
            if matrix[0][j] == 0 || matrix[i][0] == 0 {
                matrix[i][j] = 0
            }
        }
    }
    
    // See if the first row needs to be set to zero as well
    if matrix[0][0] == 0 {
        for j in 0..<columnCount {
            matrix[0][j] = 0
        }
    }
    
    // See if the first column needs to be set to zero as well
    if isColumn {
        for i in 0..<rowCount {
            matrix[i][0] = 0
        }
    }
    print(matrix)
}


var testcase1 = [[1,1,1], [1,0,1], [1,1,1]] // [[1, 0, 1], [0, 0, 0], [1, 0, 1]]
var testcase2 = [[0,1,2,0], [3,4,5,2], [1,3,1,5]] // [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]]
var testcase3 = [[0, 1], [1, 1]] // Output: [[0, 0], [0, 1]]

setMatrixZeroes(&testcase1)
setMatrixZeroesRevised(&testcase2)

