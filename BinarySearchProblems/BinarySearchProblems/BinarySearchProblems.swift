import Foundation

//

func benBinarySearch<T: Comparable>(arr: [T],
                                 target: T,
                                 range: Range<Int>? = nil,
                                 numberOfOperations: Int = 1) -> Bool {
    let searchRange: Range<Int>
    if let range = range {
        searchRange = range
    } else {
        searchRange = (0..<arr.endIndex)
    }
    
    print(searchRange)
    
    // Base Case
    if searchRange.lowerBound >= searchRange.upperBound {
        print("Didn't find \(target) in \(numberOfOperations) operations")
        return false
    }
    
    // Recursive Call
    
    let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2

    
    if target == arr[middleIndex] {
        print("Found \(target) in \(numberOfOperations) operations")
        return true
    } else if target < arr[middleIndex] {
        return benBinarySearch(arr: arr,
                            target: target,
                            range: searchRange.lowerBound..<middleIndex,
                            numberOfOperations: numberOfOperations + 1)
    } else {
        return benBinarySearch(arr: arr,
                            target: target,
                            range: (middleIndex + 1)..<searchRange.upperBound,
                            numberOfOperations: numberOfOperations + 1)
    }
}


// 1. Find if an element is contained within a sorted array in O(log(n)) time.  Do not use recursion.

func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
       var lowerBound = 0
       var upperBound = arr.count
       while lowerBound < upperBound {
           let midIndex = lowerBound + (upperBound - lowerBound) / 2
           if arr[midIndex] == target {
               return true
           } else if arr[midIndex] < target {
               lowerBound = midIndex + 1
           } else {
               upperBound = midIndex
           }
       }
       return false
}



// 2. Find if an element is contained within a sorted array in O(log(n)) time.  Use recursion.

func recursiveBinarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    let searchRange: Range<Int>
    searchRange = (0..<arr.endIndex)
    print(searchRange)
    
    // Base Case
    if searchRange.lowerBound >= searchRange.upperBound {
        return false
    }
    
    // Recursive Call
    
    let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2

    
    if target == arr[middleIndex] {
        return true
    } else if target < arr[middleIndex] {
        return benBinarySearch(arr: arr,
                            target: target,
                            range: searchRange.lowerBound..<middleIndex)
    } else {
        return benBinarySearch(arr: arr,
                            target: target,
                            range: (middleIndex + 1)..<searchRange.upperBound)
    }
}

// https://www.interviewbit.com/problems/matrix-search/

// 3. Find if a value is contained in a matrix of dimensions m x n. This matrix has the following properties:

// Integers in each row are sorted from left to right.
// The first integer of each row is greater than or equal to the last integer of the previous row.

func contains(value: Int, in arr: [[Int]]) -> Bool {
    var minRowIndex = 0
    var maxRowIndex = arr.count - 1
    while minRowIndex < maxRowIndex {
        let middleRowIndex = (minRowIndex + maxRowIndex) / 2
        if arr[middleRowIndex][0] == value {
            return true
        } else if value < arr[middleRowIndex][0] {
            maxRowIndex = middleRowIndex - 1
        } else if value > arr[middleRowIndex][0] {
            minRowIndex = middleRowIndex + 1
        }
    }
    let targetArr = arr[minRowIndex]
    return benBinarySearch(arr: targetArr, target: value)
}



// https://www.techiedelight.com/find-first-or-last-occurrence-of-a-given-number-sorted-array/
// 4. Given a sorted array of integers, find the index of the last occurrence of a given number.  Your solution should work in O(log(n)) time

func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
     var result: Int?
        
        if arr.count == 0{
            return nil
        }
        
        var leftIndex = 0
        var rightIndex = arr.count - 1
        
        while(leftIndex <= rightIndex) {
            let midIndex = (leftIndex + rightIndex)/2
            
            if arr[midIndex] == value{
                result = midIndex
                leftIndex = midIndex + 1
            }
                
            else if arr[midIndex] > value{
                rightIndex = midIndex - 1
            }
                
            else{
                leftIndex = midIndex + 1
            }
            
        }
        return result
    }

// https://www.techiedelight.com/find-smallest-missing-element-sorted-array/
// 5. Given a sorted array of distinct non-negative integers, find the smallest missing number.  Your solution should work in O(log(n)) time

func smallestMissingNumber(in arr: [Int]) -> Int {
    return -1
}

/*#include <stdio.h>

// Function to find smallest missing element in a sorted
// array of distinct non-negative integers
int smallestMissing(int arr[], int low, int high)
{
    // base condition
    if (low > high)
        return low;

    int mid = low + (high - low) / 2;

    // if mid index matches with the mid element, then the mismatch
    // lies on the right half
    if (arr[mid] == mid)
        return smallestMissing(arr, mid + 1, high);
    else
        // mismatch lies on the left half
        return smallestMissing(arr, low, mid - 1);
}

// main function
int main(void)
{
    int arr[] = { 0, 1, 2, 3, 4, 5, 6 };
    int n = sizeof(arr) / sizeof(arr[0]);

    int low = 0, high = n - 1;

    printf("The smallest missing element is %d",
            smallestMissing(arr, low, high));

    return 0;
}**/
