from django.http import JsonResponse
from django.views import View, APIView
from aws_services.s3_service import  S3Service
from payments.services.services import  PaymentService

# Vista para subir el archivo a S3
class VideoUploadView(View):
    def post(self, request):
       
        video_file = request.FILES['video']

        # Usar S3Service para subir el archivo
        s3_service = S3Service()
        upload_response = s3_service.upload_file(video_file)

        return JsonResponse({"message": "Video uploaded successfully", "url": upload_response['url']}, status=200)



