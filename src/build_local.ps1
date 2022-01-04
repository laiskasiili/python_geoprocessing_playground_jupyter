# Running scripts is deactivated by default in Powershell. First time use,
# run as admin in powershell: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Remove potentially existing images
docker rmi $(docker images 'pythongeopprocessingplayground' -q)
# Build new imag, use content of folder ./ctx as context
docker build -t pythongeopprocessingplayground:$(git log -1 --pretty=%H) .