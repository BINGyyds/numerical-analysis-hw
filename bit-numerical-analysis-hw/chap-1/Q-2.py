def is_term_less_than(n, threshold):
    term = (-1) ** n / (2 * n + 1)
    return abs(term) < threshold


def calculate_series(n):
    series_sum = .0
    for i in range(n):
        term = (-1) ** i / (2 * i + 1)
        series_sum += term
    return series_sum


def main():
    expected_trunc_errs = [1e-4, 1e-5, 1e-6, 1e-8]
    for trunc_err in expected_trunc_errs:
        print(f'期望截断误差为{trunc_err}')
        n = 0
        while not is_term_less_than(n, trunc_err):
            n += 1
        print(f'需要计算{n}项')
        print(f'π的近似值为{4 * calculate_series(n)}')


if __name__ == '__main__':
    main()
