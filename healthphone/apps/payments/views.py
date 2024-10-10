from django.http import JsonResponse
from django.views import View
from .webhooks.webhooks import PaymentWebhook
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

# Vista para webhook
class WebhookView(View):
    def post(self, request):
        # Identificar qué servicio envió el webhook
        service_name = request.headers.get('X-Service-Name')
        # Instancia el servicio de pago
        payment_webhook = PaymentWebhook()
        
        # Manejar la solicitud del servicio de pago
        transaction_data = payment_webhook.handle_payment(service_name, request)

        # Enviar los datos a la REST API para procesar la transacción y que la almacene en MySQL
        rest_api_url = "https://api/payment/transaction"
        response = requests.post(rest_api_url, json=transaction_data)

        return JsonResponse({"Ok": "Webhook received"})
     
       