# myapp/views.py
from django.http import JsonResponse
from django.views import View
from .services.stripe_service import makeStripePayment
from .services.paypal_service import makePayPalPayment
from .services.mercadoPago_service import makeMercadoPagoPayment
from .services.yappy_service import makeYappyPayment
from .webhooks.stripe_webhook import handleStripeWebhook
from .webhooks.paypal_webhook import handlePayPalWebhook
from .webhooks.mercadoPago_webhook import handleMercadoPagoWebhook
from .webhooks.yappy_webhook import handleYappyWebhook


########################################### PAYMENTS ###############################################

class StripePaymentView(View):
    def post(self, request, *args, **kwargs):
        amount = request.POST.get('amount')
        session = makeStripePayment(amount)
        return JsonResponse(session)

class PayPalPaymentView(View):
    def post(self, request, *args, **kwargs):
        amount = request.POST.get('amount')
        payment = makePayPalPayment(amount)
        return JsonResponse(payment)
    
class MercadoPagoPaymentView(View):
    def post(self, request, *args, **kwargs):
        amount = request.POST.get('amount')
        payment = makeMercadoPagoPayment(amount)
        return JsonResponse(payment)
    
class YappyPaymentView(View):
    def post(self, request, *args, **kwargs):
        amount = request.POST.get('amount')
        payment = makeYappyPayment(amount)
        return JsonResponse(payment)


########################################### Webhooks #############################################


class StripeWebhookView(View):
    def post(self, request, *args, **kwargs):
        response = handleStripeWebhook(request.body)
        return JsonResponse(response)

class PayPalWebhookView(View):
    def post(self, request, *args, **kwargs):
        response = handlePayPalWebhook(request.body)
        return JsonResponse(response)
    
class MercadoPagoWebhookView(View):
    def post(self, request, *args, **kwargs):
        response = handleMercadoPagoWebhook(request.body)
        return JsonResponse(response)
    
class YappyWebhookView(View):
    def post(self, request, *args, **kwargs):
        response = handleYappyWebhook(request.body)
        return JsonResponse(response)
