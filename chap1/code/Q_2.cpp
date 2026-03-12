#include <cmath>
#include <iomanip>
#include <iostream>
#include <vector>

// 判断第 n 项的绝对值是否小于阈值
bool is_term_less_than(int n, double threshold) {
    double term_abs = 1.0 / (2.0 * n + 1.0);
    return term_abs < threshold;
}

// 计算级数前 n 项的和
double calculate_series(int n) {
    double series_sum = 0.0;
    double sign = 1.0;

    for (int i = 0; i < n; ++i) {

        series_sum += sign / (2.0 * i + 1.0);

        sign = -sign; // 每次循环翻转符号
    }
    return series_sum;
}

int main() {
    std::vector<double> expected_trunc_errs = {1e-4, 1e-5, 1e-6, 1e-8};

    std::cout << std::fixed << std::setprecision(10);

    for (double trunc_err : expected_trunc_errs) {
        std::cout << "期望截断误差为: " << trunc_err << "\n";

        int n = 0;
        while (!is_term_less_than(n, trunc_err)) {
            n++;
        }

        std::cout << "需要计算: " << n << " 项\n";
        std::cout << "π的近似值为: " << 4.0 * calculate_series(n) << "\n";
        std::cout << "-----------------------------------\n";
    }

    return 0;
}