# StaticWebHosting-S3-CloudFormation

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Deployment](#deployment)
- [License](#license)
- [Contribution](#contribution)

## Overview

Make static website hosting easy using the power of AWS Services. Using an AWS Cloudformation stack, this solution generates an AWS S3 Bucket with web hosting and public access enabled (through a bucket policy) and syncs the local folder that contains your files to the newly created bucket. Then it provides you with the AWS Region-specific website endpoint of the bucket in order to access your website.

## Prerequisites

* AWS Account and configured ([`AWS-CLI`](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)).

## Deployment

* Make sure that `run.sh` and `AwsS3BucketPlusPolicy.yaml` files are within the the local folder that will by synced to the S3 Bucket.

1. Run `run.sh` and fill out the required parameters.

Parameter Explanation:
| Parameter                                     | Description                                                  | Example |
| ----------------------------------------------| ------------------------------------------------------------ | --------|
| AWS CloudFormation Stack Name                 | An identifier that helps you find a particular stack from a list of stacks. A stack name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and can't be longer than 128 characters.| ExampleCloudFormationStack |
| AWS CloudFormation Stack Region           | The ([`AWS Region`](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/)) that the stack will be deployed.            | eu-west-1 |
|Local Directory that containts the yaml file      | The local directory that contains the `AwsS3BucketPlusPolicy.yaml` file | file://example.yaml                         |
| AWS S3 BucketName | Globally unique name that will be given to the S3 Bucket ([Bucket Naming Rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)) | uniques3bucket |
|AWS S3 Index Document | The home or default page of the website. | index.html |
|AWS S3 Error Document | This is returned when an error occurs. | error.html |

! The Syncing operation of the local directory to the s3 bucket **excludes** any folders with the following names
* .git
*  js
*  dist
*  fonts
as well as any files with the following extensions:
* .yaml
* .sh

2. Paste the provided URL into any broswer.


## License

Licensed under the Apache License, Version 2.0 ([LICENSE](LICENSE) or http://www.apache.org/licenses/LICENSE-2.0).

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be licensed as above, without any additional terms or conditions.
