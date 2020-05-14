/*:
# Flood Fill
  https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3326/

 ---

### Problem Statement:

 An `image` is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

 Given a coordinate `(sr, sc)` representing the starting pixel (row and column) of the flood fill, and a pixel value `newColor`, "flood fill" the image.

 To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

 At the end, return the modified image.


### Example:

 ```
 Input:
 image = [[1,1,1],[1,1,0],[1,0,1]]
 sr = 1, sc = 1, newColor = 2
 
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 
 Explanation:
 From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
 by a path of the same color as the starting pixel are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected
 to the starting pixel.

 ```
 
 ### Notes:
 + The length of image and image[0] will be in the range [1, 50].
 + The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
 + The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
 
 */
class Solution {
    
    func floodFillNeighbours(_ image: inout [[Int]], _ row: Int, _ column: Int, _ originalValue: Int, _ newColor: Int){

        // Check for invalid entry
        if row < 0 || row >= image.count || column < 0 || column >= image[0].count {
            return
        }
        
        // check for value at index
        if (image[row][column] != originalValue) {
            return
        }
      
        // Replace the color at (row, column)
        image[row][column] = newColor
      
        // For neighbours
        floodFillNeighbours(&image, row+1, column, originalValue, newColor);
        floodFillNeighbours(&image, row-1, column, originalValue, newColor);
        floodFillNeighbours(&image, row, column+1, originalValue, newColor);
        floodFillNeighbours(&image, row, column-1, originalValue, newColor);
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        
        if newColor == image[sr][sc] {
            return image
        }
        
        var actualImage = image
        floodFillNeighbours(&actualImage, sr, sc, image[sr][sc], newColor)

        return actualImage
    }
}

let obj = Solution()
//obj.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
obj.floodFill([[0,0,0],[0,1,1]], 1, 1, 1)
