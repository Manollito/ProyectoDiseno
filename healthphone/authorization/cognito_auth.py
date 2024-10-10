from django.http import JsonResponse
from aws_services.cognito_service import CognitoService

class CognitoAuthMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
       # self.cognito_service = CognitoService()  # Inicializa el servicio de Cognito
        # Rutas excluidas
        self.exempt_urls = [
          
        ]

    def __call__(self, request):
        # Verificar si la ruta actual está en la lista de excepciones
        """if request.path in self.exempt_urls or request.method == 'OPTIONS':
            return self.get_response(request)

        token = request.headers.get('Authorization')

        # Llama al servicio para obtener información del usuario
        user_info = self.cognito_service.get_user_info(token)  

        if user_info is None:
            return JsonResponse({'error': 'Invalid or expired token'}, status=401)
        """
        # Si el token es válido, simplemente continúa con la solicitud
        
        return self.get_response(request)
