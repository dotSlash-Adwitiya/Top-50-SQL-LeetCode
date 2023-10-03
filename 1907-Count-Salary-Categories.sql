

-- # Method - 1
SELECT 'Low Salary' as category, COUNT(income) as accounts_count FROM Accounts WHERE income < 20000
UNION
SELECT 'Average Salary' as category, COUNT(income) as accounts_count FROM Accounts WHERE income >= 20000 AND income <= 50000
UNION
SELECT 'High Salary' as category, COUNT(income) as accounts_count FROM Accounts WHERE income > 50000
ORDER BY accounts_count DESC;

# Method - 2
