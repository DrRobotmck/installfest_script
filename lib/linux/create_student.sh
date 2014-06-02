# curl mac address info to chatbot
chatbot="http://localhost:8080"
url="$chatbot/students"

curl -H "Content-Type: application/json" -d '{
  "name"         : "'$user_name'",
  "email"        : "'$github_email'",
  "github"       : "'$github_name'",
  "mac_address"  : "'$mac_address'"
}' "$url"
