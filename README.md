Database Schema
Key Tables
shipments
Stores all supply chain shipments

id (PK)
shipment_id (UNIQUE)
supplier_id (FK)
product_id (FK)
quantity
origin, destination
expected_delivery_date, actual_delivery_date
historical_delay_days
current_status
predictions
ML model predictions

id (PK)
shipment_id (FK)
delay_probability (0-1)
predicted_delay_days (INT)
risk_level (LOW|MEDIUM|HIGH|CRITICAL)
model_version
recommendations
Prescriptive recommendations

id (PK)
shipment_id (FK)
action_name (Secondary Supplier|Air Freight|etc)
estimated_cost, estimated_delay
recommendation_score (0-1)
ranking (1|2|3)
decisions
Executed decisions

id (PK)
shipment_id (FK)
recommendation_id (FK)
selected_action
decision_cost
decision_timestamp
executed_by (user)
outcomes
Actual shipment outcomes

id (PK)
shipment_id (FK)
decision_id (FK)
predicted_delay, actual_delay
predicted_cost, actual_cost
roi (ROI calculation)
outcome_status (SUCCESS|PARTIAL|FAILED)
model_versions
ML model version history

id (PK)
model_name
version
training_date
accuracy, precision, recall, f1_score, rmse
model_path
is_active (BOOLEAN)
