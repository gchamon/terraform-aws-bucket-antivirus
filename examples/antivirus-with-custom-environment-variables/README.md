## Usage

* Clone the base repository
* Configure your aws credentials using `aws configure`
* Edit the file `main.tf` to include your region of preference
* Execute, remembering to review the plan to make sure you are not deleting anything of value:
```bash
terraform init
terraform plan -out plan
terraform apply plan
```
* After applying, go to the aws console, look for the lambda function `bucket-antivirus-update`, create a test case with whatever input, execute the test and wait for its completion. This will make sure that you populate the bucket containing the antivirus definitions.
* Create a file containing the [EICAR](https://en.wikipedia.org/wiki/EICAR_test_file) test string
* Upload the file to the test bucket. The bucket is created with the prefix `test-antivirus`, so look for this bucket in your list of s3 buckets, and upload the file create in the previous step.
* Wait for the lambda function to scan the file. You can check the progress in AWS CloudWatch.
* If all goes well, the file you uploaded should be deleted by the scanner function.

