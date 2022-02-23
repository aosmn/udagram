eb create --sample udagram-api-dev
eb setenv PORT=3000 POSTGRES_PASSWORD=oeyikrF7I1xN5CfdRCfu POSTGRES_DB=udacity DB_PORT=5432 POSTGRES_HOST=udacity.ccvtrr9l9lp4.us-east-1.rds.amazonaws.com AWS_REGION=us-east-1 POSTGRES_PASSWORD=oeyikrF7I1xN5CfdRCfu POSTGRES_USERNAME=postgres

eb deploy udagram-api-dev
eb status