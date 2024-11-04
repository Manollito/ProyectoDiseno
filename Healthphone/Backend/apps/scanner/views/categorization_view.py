import boto3
import os
from rest_framework.views import APIView
from django.http import HttpResponse
from django.conf import settings
import tempfile
from django.http import JsonResponse
from apps.scanner.categorization_service import CategorizationService
from apps.scanner.serializers import  CategorizationSerializer
from aws_services.sns_service import SNSService

from rest_framework.response import Response
from rest_framework import status

from openai import OpenAI
#import openai

class CategorizationView(APIView):
    client = OpenAI(
        api_key = settings.OPENAI_API_KEY
            )
    
    def post(self, request):
        
        response_data = {
        "response": {
            "result": "Leve",
            "measures": {
                "Temperatura": {
                    "cantidad": 36.7,
                    "unidad": "°C"
                },
                "Peso": {
                    "cantidad": 70,
                    "unidad": "kg"
                },
                "Altura": {
                    "cantidad": 175,
                    "unidad": "cm"
                }
            }
        }
    }
        return JsonResponse(response_data)
       
        prompt = """Supone que estas escaneando a una persona, dime la temperatura, altura y peso. Responde solo en formato
            Temperatura: ...  Peso: ... Altura..."""
            
        #organization = request.data.get('organization')
        #site = request.data.get('site')
        
        try:
            # Realiza una solicitud al modelo Davinci
            response = self.client.chat.completions.create(
                model="gpt-4o-mini",  # Puedes usar "davinci" aquí si no estás usando el modelo de chat
                messages=[{"role": "user", "content": prompt}]
            )
            
            # Extrae solo el contenido del mensaje para serializarlo correctamente
            scanner_result = response.choices[0].message.content
            
            categorization_result = CategorizationService.categorize(scanner_result, "organization", "site")
            
            # Devuelve el contenido en JSON
            return JsonResponse({'response': categorization_result})
        
            #result = CategorizationSerializer(categorization_result, many=True)
            
            #self.sns_service.notify_client(categorization_result, client_id)

            #return HttpResponse(status=204)  # 204 No Content
            
            #return JsonResponse({"Resultado":  result.data})
                        
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
      
    
