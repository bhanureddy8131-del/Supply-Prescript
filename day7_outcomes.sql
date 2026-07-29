-- 7 table outcomes 
CREATE TABLE outcomes (
    outcome_id INT AUTO_INCREMENT PRIMARY KEY,
    decision_id INT,
    actual_delay_days INT,
    actual_cost DOUBLE,
    outcome_date DATE,
    FOREIGN KEY (decision_id) REFERENCES decisions(decision_id)
);
INSERT INTO outcomes
(decision_id,
actual_delay_days,
actual_cost,
outcome_date)

SELECT
decision_id,
2,
100.00,
CURDATE()

FROM decisions;
select count(*) from outcomes ;