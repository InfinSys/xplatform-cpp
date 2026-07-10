
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
    std::cout << "\n[ " << ${PRJ_PREFIX}_FULL_NAME << " Developer Executable ]"
        << "\nCopyright (C) " << ${PRJ_PREFIX}_PUBLISHER << '\n'
        << "\nSoftware type: " << ${PRJ_PREFIX}_SOFTWARE_TYPE
        << "\nInterface: " << ${PRJ_PREFIX}_INTERFACE_TYPE
        << "\nLicense: " << ${PRJ_PREFIX}_LICENSE_TYPE
        << "\nUUID: " << ${PRJ_PREFIX}_UUID << '\n'
        << "\nMain binary: '" << ${PRJ_PREFIX}_MAIN_BINARY << '\''
        << std::endl;
}
