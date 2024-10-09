from .handlers import PayPalWebhookHandler
from .handlers import StripeWebhookHandler
from .handlers import MercadoPagoWebhookHandler
from .handlers import YappyWebhookHandler


class WebhookFactory:
    @staticmethod
    def get_webhook_handler(service_name):
        if service_name == "paypal":
            return PayPalWebhookHandler()
        elif service_name == "stripe":
            return StripeWebhookHandler()
        elif service_name == "mercadopago":
            return MercadoPagoWebhookHandler()
        elif service_name == "yappy":
            return YappyWebhookHandler()
        else:
            raise ValueError(f"Unknown service: {service_name}")
