from django.http import JsonResponse
from django.views import View, APIView
from aws_services.s3_service import  S3Service
from payments.services.services import  PaymentService

from .decorators import cognito_verify_token

# Vista para realizar un pago
@cognito_verify_token
class PaymentView(APIView):
    def post(self, request):
        payment_method = request.data.get('method')
        amount = request.data.get('amount')

        # Instancia el servicio de pago
        payment_service = PaymentService()

        # Procesa el pago usando el método solicitado
        response = payment_service.process_payment(payment_method, amount)
    
        return JsonResponse(response)

# Vista para subir el archivo a S3
@cognito_verify_token
class VideoUploadView(View):
    def post(self, request):
       
        video_file = request.FILES['video']

        # Usar S3Service para subir el archivo
        s3_service = S3Service()
        upload_response = s3_service.upload_file(video_file)

        return JsonResponse({"message": "Video uploaded successfully", "url": upload_response['url']}, status=200)



