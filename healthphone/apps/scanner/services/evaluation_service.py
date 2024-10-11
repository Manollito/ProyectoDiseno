from aws_services.sagemaker_service import  SageMakerService

class EvaluationService:
   
    def evaluate(self, video):
       
        # Invoca el modelo SageMaker para evaluar el video
        result = self.sagemaker_service.invoke_model(video)
        
        # Devuelve el resultado de la evaluación
        return result
