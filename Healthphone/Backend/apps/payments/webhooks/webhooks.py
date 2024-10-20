from .factoryWebhook import WebhookFactory

class PaymentWebhook:
    def handle_payment(self, serviceName, request):
        # Obtén el procesador adecuado usando la Factory
        processor = WebhookFactory.get_webhook_handler(serviceName)
        
        # Procesa el pago con el procesador obtenido
        return processor.handle_event(request)
