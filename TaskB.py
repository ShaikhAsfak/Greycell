def reverse_each_word_except_special_chars(s):
    result = []
    for word in s.split(" "):
        letters = [c for c in word if c.isalnum()]
        reversed_word = ""
        for c in word:
            if c.isalnum():
                reversed_word += letters.pop()
            else:
                reversed_word += c
        result.append(reversed_word)
    return " ".join(result)

def reverse_sentence_except_last_n(s, n):
    words = s.split()
    # Get the portion to reverse and the portion to leave as is
    to_reverse = words[:-n] if n < len(words) else words
    unchanged = words[-n:] if n < len(words) else []
    # Reverse the order of words in the to_reverse portion
    reversed_part = " ".join(to_reverse[::-1])
    return f"{reversed_part} {' '.join(unchanged)}"

def combine_both_options(s, n):
    reversed_sentence = reverse_sentence_except_last_n(s, n)
    # Reverse each word in the reversed sentence except for special characters
    return reverse_each_word_except_special_chars(reversed_sentence)

# Menu-driven program
def main():
    print("Choose an option:")
    print("A: Reverse the characters of each word in a string, but do not reverse the entire string.")
    print("B: Reverse the sentence except for the last 'n' words in the sentence.")
    print("C: Combine both Option A and Option B.")
    
    option = input("Enter option (A | B | C): ").strip().upper()
    sentence = input("Enter the sentence: ").strip()
    
    if option == "A":
        result = reverse_each_word_except_special_chars(sentence)
    elif option == "B":
        n = int(input("Enter the number of last words to keep in place: "))
        result = reverse_sentence_except_last_n(sentence, n)
    elif option == "C":
        n = int(input("Enter the number of last words to keep in place: "))
        result = combine_both_options(sentence, n)
    else:
        result = "Invalid option selected."

    print("Output:", result)

# Run the program
main()
