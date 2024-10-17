from django.http import JsonResponse
from django.views import View
from webhooks.webhooks import PaymentWebhook
from services.services import PaymentService

import requests

# Vista para realizar un pago
class PaymentView(APIView):
    def post(self, request):
        payment_method = request.data.get('method')
        amount = request.data.get('amount')

        # Instancia el servicio de pago
        payment_service = PaymentService()

        # Procesa el pago usando el método solicitado
        response = payment_service.process_payment(payment_method, amount)
    
        return JsonResponse(response)
