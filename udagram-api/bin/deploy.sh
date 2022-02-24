configfile='.elasticbeanstalk/config.yml'

eb init udagram-api --platform node.js --region us-east-1
eb create --sample udagram-api-dev
echo "\ndeploy:\n  artifact: www/Archive.zip" >> $configfile
eb use udagram-api-dev
eb deploy udagram-api-dev --profile default
eb setenv \
AWS_REGION=$AWS_REGION \
DB_PORT=$DB_PORT \
JWT_SECRET=$JWT_SECRET \
PORT=$PORT \
POSTGRES_DB=$POSTGRES_DB \
POSTGRES_HOST=$POSTGRES_HOST \
POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
POSTGRES_USERNAME=$POSTGRES_USERNAME \
URL=$URL \
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
AWS_BUCKET=$AWS_BUCKET \
AWS_PROFILE=$AWS_PROFILE \
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

eb status