SELECT MONTH(START_DATE), CAR_ID, COUNT(*) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE DATE_FORMAT(START_DATE, "%Y-%m") BETWEEN "2022-08" and "2022-10" and CAR_ID IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE DATE_FORMAT(START_DATE, "%Y-%m") BETWEEN "2022-08" and "2022-10"
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
)
GROUP BY 1, 2
HAVING RECORDS > 0
ORDER BY 1, 2 DESC
