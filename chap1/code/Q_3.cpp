#define _USE_MATH_DEFINES // 为了在某些编译器下使用 M_PI
#include <cmath>
#include <fstream>
#include <iostream>
#include <vector>

// ---------------------------------------------------------
// 递推公式: Term_i = Term_{i-1} * (-x^2) / ((2i)*(2i+1))
// ---------------------------------------------------------
std::vector<double> taylor_series(const std::vector<double> &x_vals, int n) {
    std::vector<double> result(x_vals.size(), 0.0);

    for (size_t k = 0; k < x_vals.size(); ++k) {
        double x = x_vals[k];
        double term = x;
        double sum = term;

        for (int i = 1; i <= n; ++i) {
            term *= (-x * x) / ((2.0 * i) * (2.0 * i + 1.0));
            sum += term;
        }
        result[k] = sum;
    }
    return result;
}

int main() {
    // 1. 生成 x 的数据点
    int num_points = 80;
    double x_start = -2.0 * M_PI;
    double x_end = 2.0 * M_PI;
    double step = (x_end - x_start) / (num_points - 1);

    std::vector<double> x, y_true, y_2, y_5, y_10;

    for (int i = 0; i < num_points; ++i) {

        double current_x = x_start + i * step;
        x.push_back(current_x);
        y_true.push_back(std::sin(current_x)); // 真实的 sin(x)
    }

    // 2. 计算不同阶数的泰勒展开
    y_2 = taylor_series(x, 1);   // n=1 (计算到 x^3)
    y_5 = taylor_series(x, 5);   // n=5 (计算到 x^11)
    y_10 = taylor_series(x, 10); // n=10 (计算到 x^21)

    // 3. 将计算结果输出到 CSV 文件，供 Python 画图使用
    std::ofstream file("q3_data.csv");
    if (!file.is_open()) {
        std::cerr << "无法创建文件!" << std::endl;
        return 1;
    }

    // 写入表头
    file << "x,y_true,y_2,y_5,y_10\n";
    // 写入数据
    for (size_t i = 0; i < x.size(); ++i) {
        file << x[i] << "," << y_true[i] << "," << y_2[i] << "," << y_5[i]
             << "," << y_10[i] << "\n";
    }
    file.close();

    std::cout << "数值计算完成！数据已保存至 chap1/code/q3_data.csv"
              << std::endl;
    std::cout << "请运行 Python 脚本进行可视化。" << std::endl;

    return 0;
}