from functools import wraps
from django.http import JsonResponse
from aws_services.cognito_service import CognitoService
cognito_service = CognitoService()

def cognito_verify_token(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        # Obtener el token del encabezado de autorización
        auth_header = request.headers.get('Authorization')
        token = auth_header.split("Bearer ")[1]
        
        # Verificar el token usando el método get_user_info de CognitoService
        user_info = cognito_service.get_user_info(token)
        
        if 'error' in user_info:
            return JsonResponse({"error": "Invalid token"}, status=401)
        
        # Si el token es válido, continuar con la vista
        return view_func(request, *args, **kwargs)
    
    return _wrapped_view
