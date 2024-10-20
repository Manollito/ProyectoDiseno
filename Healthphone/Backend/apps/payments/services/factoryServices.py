# payments/factory.py

from .processors import PayPalProcessor, StripeProcessor, MercadoPagoProcessor, YappyProcessor

class PaymentFactory:
    @staticmethod
    def get_processor(payment_method):
        if payment_method == 'paypal':
            return PayPalProcessor()
        elif payment_method == 'stripe':
            return StripeProcessor()
        elif payment_method == 'mercadoPago':
            return MercadoPagoProcessor()
        elif payment_method == 'yappy':
            return YappyProcessor()
        else:
            raise ValueError(f"Unknown payment method: {payment_method}")