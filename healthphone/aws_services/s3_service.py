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

    def download_video(self, video_key):
        try:
            file_obj = self.s3_client.get_object(Bucket=self.bucket_name, Key=video_key)
            return file_obj['Body'].read()
        except Exception as e:
            return {'error': str(e)}
    
    # Función para obtener el nombre del centro médico
    def download_medical_center_data(self, video_key):
        try:
            response = self.s3_client.head_object(Bucket=self.bucket_name, Key=video_key)
            # Obtener el nombre del centro médico de los metadatos (suponiendo que esté allí)
            medical_center_name = response['Metadata'].get('medical-center', 'Desconocido')
            return medical_center_name
        except Exception as e:
          print(f"Error al obtener metadatos: {e}")
        return None
