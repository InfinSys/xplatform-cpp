
#include "demoapp/main.hpp"
#include "demolib/calculator.hpp"

int main(const int argc, const char* argv[]) {
    printProjectInfo();

    constexpr int value1 = 20;
    constexpr int value2 = 5;

    std::cout << "\nThe sum of " << value1 << " and " << value2
        << " is " << MyCalculator::add(value1, value2)
        << std::endl;

    return 0;
}

void printProjectInfo() noexcept
{
    std::cout << "Ready." << std::endl;
}
