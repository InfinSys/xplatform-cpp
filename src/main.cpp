
#include<iostream>
#include"xptemp/main.hpp"

int myAdd(const int val1, const int val2);

int main(const int argc, char* argv[]) {
    const int value1 = 1;
    const int value2 = 9;

    std::cout << "\nThe sum of " << value1 << " and " << value2 << " is:";

    const int sum = myAdd(value1, value2);

    std::cout << '\n' << sum << std::endl;

    return 0;
}

int myAdd(const int val1, const int val2) {
    return val1+val2;
}
