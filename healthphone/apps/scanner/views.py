import boto3
import os
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.conf import settings
import tempfile
from services import EvaluationService, CategorizationService

class VideoEvaluationView(APIView):
    def post(self, request):

        # Recibir el bucket y key (nombre del archivo) del video a procesar desde Lambda
      
        # Descargar el video desde S3 y los datos de cual centro medico lo subió
           
        # Procesar el video con SageMaker

        """
        evaluation_service =  EvaluationService()
        result_evaluation = evaluation_service.evaluate()
        
        categorization_service = CategorizationService()
        result_categorization = categorization_service.categorize(result_evaluation)
        """
        
        result_categorization = ""
        return Response({"result": result_categorization}, status=status.HTTP_200_OK)

    
