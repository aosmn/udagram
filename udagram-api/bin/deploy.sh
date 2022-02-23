echo $PWD

echo $PORT 
echo $POSTGRES_DB 
echo $DB_PORT 
echo $POSTGRES_HOST 
echo $AWS_REGION 
echo $POSTGRES_PASSWORD 
echo $POSTGRES_USERNAME

eb init udagram-api --platform node.js --region us-east-1
eb create --sample udagram-api-dev
eb setenv PORT=$PORT POSTGRES_DB=$POSTGRES_DB DB_PORT=$DB_PORT POSTGRES_HOST=$POSTGRES_HOST AWS_REGION=$AWS_REGION POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_USERNAME=$POSTGRES_USERNAME
eb deploy udagram-api-dev --profile default
eb status