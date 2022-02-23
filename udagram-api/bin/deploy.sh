configfile='.elasticbeanstalk/config.yml'

eb init udagram-api --platform node.js --region us-east-1
eb create --sample udagram-api-dev
echo "\ndeploy:\n  artifact: www/Archive.zip" >> $configfile
eb deploy udagram-api-dev --profile default
eb setenv PORT=$PORT POSTGRES_DB=$POSTGRES_DB DB_PORT=$DB_PORT POSTGRES_HOST=$POSTGRES_HOST AWS_REGION=$AWS_REGION POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_USERNAME=$POSTGRES_USERNAME
eb status