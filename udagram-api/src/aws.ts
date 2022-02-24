import AWS = require('aws-sdk');
import { config } from './config/config';

// Configure AWS
const credentials = new AWS.SharedIniFileCredentials({ profile: 'default' });
AWS.config.credentials = credentials;

export const s3 = new AWS.S3({
  signatureVersion: 'v4',
  region: config.aws_region,
  params: { Bucket: config.aws_media_bucket }
});
console.log('aws', s3);
console.log('aws', credentials);

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

  let signedUrl = '';
  s3.getSignedUrl(
    'putObject',
    {
      Bucket: config.aws_media_bucket,
      Key: key,
      Expires: signedUrlExpireSeconds
    },
    function (err, url) {
      console.log(err);
      signedUrl=url
    }
  );
  console.log('s3', config.aws_media_bucket);
  console.log('s3', signedUrl);

  return signedUrl;
}
