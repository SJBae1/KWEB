const permutation = (n, r) => {
    let result = 1;
    for (let i = n; i > n - r; i--) {
      result *= i;
    }
    return result;
};

const combination = (n, r) => {
    let result = 1;
    for (let i = n; i > n - r; i--) {
      result *= i;
    }
    for (let i = r; i > 1; i--) {
      result /= i;
    }
    return result;
};

const multiPermutation = (n, r) => {
    return n**r;
};

const multiCombination = (n, r) => {
    return combination(n + r - 1, r);
};


module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination,
};