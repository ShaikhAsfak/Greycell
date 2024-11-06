def get_matrix_input(size, matrix_name):
    print(f"Enter elements for {matrix_name} ({size}x{size}):")
    matrix = []
    for i in range(size):
        row = list(map(int, input(f"Row {i + 1}: ").split()))
        if len(row) != size:
            print("Error: Each row must contain exactly", size, "elements.")
            return None
        matrix.append(row)
    return matrix

def multiply_matrices_with_stride(mat1, mat2, size, stride):
    # Initialize the result matrix with zeros
    result = [[0] * size for _ in range(size)]

    # Perform matrix multiplication with the given stride
    for i in range(0, size, stride):  # Skip rows based on stride
        for j in range(0, size, stride):  # Skip columns based on stride
            # Calculate element at result[i][j]
            sum_value = 0
            for k in range(0, size, stride):  # Skip elements based on stride
                sum_value += mat1[i][k] * mat2[k][j]
            result[i][j] = sum_value

    return result

# Main program
def main():
    size = int(input("Enter the size of the square matrix : "))
    stride = int(input("Enter the stride (skip) value : "))

    # Get matrix inputs from the user
    mat1 = get_matrix_input(size, "Matrix 1")
    if mat1 is None:  # Check for input error
        return

    mat2 = get_matrix_input(size, "Matrix 2")
    if mat2 is None:  # Check for input error
        return

    # Multiply the matrices with the given stride
    result = multiply_matrices_with_stride(mat1, mat2, size, stride)

    # Display the result
    print("\nResultant Matrix:")
    for row in result:
        print(" ".join(map(str, row)))

# Run the program
main()
