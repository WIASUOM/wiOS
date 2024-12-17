int main() {
    const char *msg = "Welcome to My OS!";
    char *video = (char*) 0xb8000; // Video memory starts at 0xb8000

    // Print the message to the screen
    while(*msg) {
        *video = *msg;         // Write character
        video++;               // Move to next video memory location
        msg++;                 // Move to next character in the string
        *video = 0x07;         // Set the attribute (text color, here it's white on black)
        video++;               // Move to next character cell
    }

    // Halt the CPU (infinite loop)
    while(1);
}
