import UIKit

var numberMatrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]

func handleMatrixOrder(matrix: [[Int]]) {
    for row in matrix {
        let actualRow = matrix.firstIndex(where: {$0 == row})! + 1
        var newRow:[Int]
        
        if actualRow % 2 == 0 {
            newRow = row.reversed()
        } else {
            newRow = row
        }
        
        for rowElement in newRow {
            print(rowElement)
        }
    }
}

handleMatrixOrder(matrix: numberMatrix)
