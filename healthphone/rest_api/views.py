from django.http import JsonResponse
from django.views import View
from aws_services.cognito_service import CognitoService

class VerifyTokenView(View):
    def post(self, request, *args, **kwargs):
        token = request.data.get('token')  # Obtiene el token del cuerpo de la solicitud
        user_info = CognitoService.get_user_info(token) 
        
        if user_info is None:
            return JsonResponse({'error': 'Invalid token'}, status=401)
