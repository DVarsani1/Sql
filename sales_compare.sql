SELECT * FROM parametrix.quarterly_sales_data;

select Employee_Name,Role,Q1_Sales,Q2_Sales,Q3_Sales ,
				CASE 
						when Q1_Sales>Q2_Sales and Q1_Sales >Q3_Sales then 'Q1 sales is higher as compare to Q2 and Q3 sales' 
						when Q2_Sales>Q1_Sales and Q2_Sales >Q3_Sales then 'Q2 sales is higher as compare to Q1 and Q3 sales' 
                        else 'Q3 sales is higher as compare to Q1 and Q2 sales'
				end As Remark ,
                CASE 
						when Q3_Sales>Q2_Sales  then 'Positive' 
						when Q2_Sales>Q3_Sales  then 'Negative' 
                        else ''
				end As Po_Neg
                
			from parametrix.quarterly_sales_data;
		
WITH RankedEmployees AS (
    SELECT
        Employee_Name,
        Role,
        Q1_Sales,Q2_Sales,Q3_Sales ,
		CASE 
						when Q1_Sales>Q2_Sales and Q1_Sales >Q3_Sales then 'Q1 sales is higher as compare to Q2 and Q3 sales' 
						when Q2_Sales>Q1_Sales and Q2_Sales >Q3_Sales then 'Q2 sales is higher as compare to Q1 and Q3 sales' 
                        else 'Q3 sales is higher as compare to Q1 and Q2 sales'
				end As Remark ,
                CASE 
						when Q3_Sales>Q2_Sales  then 'Positive' 
						when Q2_Sales>Q3_Sales  then 'Negative' 
                        else ''
				end As Po_Neg,
        RANK() OVER (PARTITION BY Role ORDER BY Q3_Sales DESC) AS r
    FROM
       parametrix.quarterly_sales_data	
),Remark1 AS (
SELECT 
	Employee_Name,
	Role,
	Q1_Sales,Q2_Sales,Q3_Sales ,
	Remark , Po_Neg,
	r,
    LAG(r) OVER (PARTITION BY Role ORDER BY r) AS prev_rank,
	LAG(Employee_Name) OVER (PARTITION BY Role ORDER BY r) AS prev_employee_name
    
From 
	RankedEmployees
	
)
SELECT
		Employee_Name,
        Role,
        r,
        Q1_Sales,
        Q2_Sales,
        Q3_Sales ,
		Remark ,
		Po_Neg,
    CASE
        WHEN prev_rank IS NOT NULL AND  r > prev_rank THEN CONCAT('Previous employee ', prev_employee_name, ' has higher rank')
        ELSE "He has Higher Rank"
    END AS Emp_remark
FROM
    Remark1
ORDER BY
    Role,
    r;
     
            
            
