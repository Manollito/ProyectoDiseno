import boto3
from django.conf import settings
import uuid

class S3Service:
    def __init__(self):
        self.s3_client = boto3.client(
            's3',
            region_name=settings.AWS_REGION,
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY
        )
        self.bucket_name = settings.AWS_STORAGE_BUCKET_NAME

    def upload_file(self, file, folder='uploads/'):
        try:
            file_name = folder + str(uuid.uuid4()) + "_" + file.name
            self.s3_client.upload_fileobj(file, self.bucket_name, file_name)
            file_url = f"https://{self.bucket_name}.s3.amazonaws.com/{file_name}"
            return {'url': file_url, 'status': 'success'}
        except Exception as e:
            return {'error': str(e)}

    def download_file(self, file_key):
        try:
            file_obj = self.s3_client.get_object(Bucket=self.bucket_name, Key=file_key)
            return file_obj['Body'].read()
        except Exception as e:
            return {'error': str(e)}
