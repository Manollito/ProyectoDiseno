class PayPalProcessor:
    def process_payment(self, amount):
        # Lógica para procesar el pago con PayPal
        return {"status": "ok", "message": "Payment process initiated."}


class StripeProcessor:
    def process_payment(self, amount):
        # Lógica para procesar el pago con Stripe
        return {"status": "ok", "message": "Payment process initiated."}


class MercadoPagoProcessor:
    def process_payment(self, amount):
        # Lógica para procesar el pago con MercadoPago
        return {"status": "ok", "message": "Payment process initiated."}


class YappyProcessor:
    def process_payment(self, amount):
        # Lógica para procesar el pago con MercadoPago
        return {"status": "ok", "message": "Payment process initiated."}
