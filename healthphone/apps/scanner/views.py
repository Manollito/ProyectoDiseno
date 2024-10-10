import boto3
import os
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.conf import settings
import tempfile

class VideoEvaluationView(APIView):
    def post(self, request):

        # Recibir el bucket y key (nombre del archivo) del video a procesar desde Lambda
      
        # Descargar el video desde S3
           
        # Procesar el video con SageMaker
        return Response({"result": "result"}, status=status.HTTP_200_OK)


    def evaluate_with_sagemaker(self, video_path):
        # Configuración del cliente SageMaker
        sagemaker_client = boto3.client('sagemaker-runtime', 
                                        aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
                                        aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY)
        
        # Leer el video o convertirlo a un formato adecuado para SageMaker
      
        # Llamar al endpoint de SageMaker, y pasarle los datos del video
     
        # Obtener la respuesta de SageMaker
        result = ""

        return result
