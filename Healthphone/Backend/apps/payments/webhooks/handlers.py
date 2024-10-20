# webhooks/paypal_webhook.py
class PayPalWebhookHandler:
    def handle_event(self, request):
        # Maneja los eventos de PayPal
        payload = request.body
        # Aquí procesas el webhook de PayPal
        return {"status": "success", "message": "PayPal webhook processed"}

# webhooks/stripe_webhook.py
class StripeWebhookHandler:
    def handle_event(self, request):
        # Maneja los eventos de Stripe
        payload = request.body
        # Aquí procesas el webhook de Stripe
        return {"status": "success", "message": "Stripe webhook processed"}

# webhooks/mercadopago_webhook.py
class MercadoPagoWebhookHandler:
    def handle_event(self, request):
        # Maneja los eventos de MercadoPago
        payload = request.body
        # Aquí procesas el webhook de MercadoPago
        return {"status": "success", "message": "MercadoPago webhook processed"}

# webhooks/yappy_webhook.py
class YappyWebhookHandler:
    def handle_event(self, request):
        # Maneja los eventos de Yappy
        payload = request.body
        # Aquí procesas el webhook de Yappy
        return {"status": "success", "message": "Yappy webhook processed"}
