import AWS = require('aws-sdk');
import { config } from './config/config';

// Configure AWS
// const credentials = new AWS.SharedIniFileCredentials({ profile: 'default' });
// AWS.config.credentials = credentials;

// AWS.config.update({
//   maxRetries: 3,
//   httpOptions: {timeout: 30000, connectTimeout: 5000},
//   region: config.aws_region,
//   accessKeyId: config.aws_key_id,
//   secretAccessKey: config.aws_secret_key,
// });


export const s3 = new AWS.S3({
  signatureVersion: 'v4',
  region: config.aws_region,
  params: { Bucket: config.aws_media_bucket }
});
console.log('aws', s3);
// console.log('aws', credentials);

// Generates an AWS signed URL for retrieving objects
export function getGetSignedUrl(key: string): string {
  const signedUrlExpireSeconds = 60 * 5;
  const signedUrl = s3.getSignedUrl('getObject', {
    Bucket: config.aws_media_bucket,
    Key: key,
    Expires: signedUrlExpireSeconds
  });
  console.log('s3', config.aws_media_bucket);
  console.log('s3', signedUrl);
  return signedUrl;
}

// Generates an AWS signed URL for uploading objects
export function getPutSignedUrl(key: string): string {
  const signedUrlExpireSeconds = 60 * 5;

  const signedUrl = s3.getSignedUrl(
    'putObject',
    {
      Bucket: config.aws_media_bucket,
      Key: key,
      Expires: signedUrlExpireSeconds
    });
  console.log('s3', config.aws_media_bucket);
  console.log('s3', signedUrl);

  return signedUrl;
}
