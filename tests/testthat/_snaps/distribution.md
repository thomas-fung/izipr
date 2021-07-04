# Test pizip

    Code
      pizip(5, 4, 0.5)
    Output
      [1] 0.7758583

---

    Code
      pizip(c(5, 4), 4, 0.5, ref.lambda = c(2, 1))
    Output
      [1] 0.7631370 0.6197239

---

    Code
      pizip(5, 4, 0.5, ref.lambda = 2)
    Output
      [1] 0.763137

---

    Code
      pizip(5, 4, 1.5)
    Output
      [1] 0.7613315

---

    argument "mu" is missing, with no default

---

    specify 'nu' or 'pi' but not both

# Test dizip

    Code
      dizip(5, 4, 0.5)
    Output
      [1] 0.1561344

---

    Code
      dizip(c(5, 4), 4, 0.5, ref.lambda = c(2, 1))
    Output
      [1] 0.1554023 0.1908305

---

    Code
      dizip(5.5, 4, 0.5)
    Warning <simpleWarning>
      non-integer x = 5.5
    Output
      [1] 0

---

    Code
      dizip(-1, 4, 0.5)
    Output
      [1] 0

---

    argument "mu" is missing, with no default

---

    specify 'nu' or 'pi' but not both

# Test qizip

    Code
      qizip(0.2, 4, 0.5)
    Output
      [1] 2

---

    Code
      qizip(c(0.2, 0.4), 4, 0.5, ref.lambda = c(2, 1))
    Output
      [1] 2 3

---

    Code
      qizip(0, 4, 0.5)
    Output
      [1] 0

---

    Code
      qizip(1.1, 4, 0.5)
    Warning <simpleWarning>
      NaNs produced
    Output
      [1] NaN

---

    Code
      qizip(-1, 4, 0.5)
    Warning <simpleWarning>
      NaNs produced
    Output
      [1] NaN

---

    argument "mu" is missing, with no default

---

    specify 'nu' or 'pi' but not both

# Test rizip

    argument "mu" is missing, with no default

---

    specify 'nu' or 'pi' but not both

