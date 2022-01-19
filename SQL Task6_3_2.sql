SELECT COUNT(*), gender
FROM likes, profiles
WHERE likes.user_id = profiles.user_id
GROUP BY gender;