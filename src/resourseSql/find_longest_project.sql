SELECT id, MONTH_COUNT
FROM (
    SELECT
        id,
        EXTRACT(MONTH FROM AGE(FINISH_DATE, START_DATE)) AS MONTH_COUNT,
        RANK() OVER (ORDER BY EXTRACT(MONTH FROM AGE(FINISH_DATE, START_DATE)) DESC) AS rank
    FROM
        project
) AS ranked_projects
WHERE rank = 1;