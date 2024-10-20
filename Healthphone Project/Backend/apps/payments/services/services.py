from .factoryServices import PaymentFactory

class PaymentService:
    def process_payment(self, payment_method, amount):
        # Obtén el procesador adecuado usando la Factory
        processor = PaymentFactory.get_processor(payment_method)
        
        # Procesa el pago con el procesador obtenido
        return processor.process_payment(amount)
