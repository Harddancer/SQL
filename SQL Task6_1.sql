SELECT 
  (
    SELECT 
      CONCAT(firstname, ' ', lastname) 
    FROM 
      users 
    WHERE 
      id = messages.from_user_id
  ) AS name, 
  COUNT(*) AS send_total 
FROM 
  messages 
WHERE 
  to_user_id = 1 
  AND from_user_id IN (
    SELECT 
      initiator_user_id 
    FROM 
      friend_requests 
    WHERE 
      (target_user_id = 1) 
      AND status = 'approved' 
    UNION 
    SELECT 
      target_user_id 
    FROM 
      friend_requests 
    WHERE 
      (initiator_user_id = 1) 
      AND status = 'approved'
  ) 
GROUP BY 
  from_user_id 
ORDER BY 
  send_total DESC 
LIMIT 
  1;