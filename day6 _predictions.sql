 -- 6 table decisions
CREATE TABLE decisions (
    decision_id INT AUTO_INCREMENT PRIMARY KEY,
    prediction_id INT,
    recommended_action VARCHAR(100),
    selected_action VARCHAR(100),
    decision_date DATE,
    FOREIGN KEY (prediction_id) REFERENCES predictions(prediction_id)
);
iNSERT INTO decisions
(prediction_id,
recommended_action,
selected_action,
decision_date)

SELECT
prediction_id,
CASE
    WHEN predicted_risk = 'High' THEN 'Expedite Shipment'
    ELSE 'Normal Shipping'
END,
CASE
    WHEN predicted_risk = 'High' THEN 'Expedite Shipment'
    ELSE 'Normal Shipping'
END,
CURDATE()
FROM predictions;


select count(*) from decisions ;