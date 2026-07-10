
#ifndef DEMOLIB_HEADER_H_
#define DEMOLIB_HEADER_H_

/*!
 * @brief
 * Class for performing mathematical calculations.
 */
struct MyCalculator {
    /*! @brief Sum two values together. */
    static int add(const int num1, const int num2) noexcept;
    /*! @brief Subtract a value from another. */
    static int subtract(const int num1, const int num2) noexcept;
};

#endif // DEMOLIB_HEADER_H_
