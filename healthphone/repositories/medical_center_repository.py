from apps.scanner.models import MedicalCenterModel

class MedicalCenterRepository:     
    
    @staticmethod
    def get_categorization_method(medical_center_site, organization):
        
        categorization_data = MedicalCenterModel.objects.get(org = organization, 
                                                                 site = medical_center_site)
        result = []
        found = []
        
        for scan in categorization_data: # Se recorren los parametros de la categorización del centro medico
            
            if not scan.measure in found: # Ya se almacenó el measur
                # se agrega el measure con unidad de medida y parametro base a tomar en cuenta para categorizar (azul, verde...)
                result.append({"medical_center": scan.medical_center, "measure_id": scan.measure_id, 
                    "measure": scan.measure, "measure_unit": scan.measure_unit, 
                    "subscription_id": scan.subscription_id, "params": 
                    [{"param": scan.param, "min_value":  scan.min_value, "max_value": scan.max_value}]})
                found.append(scan.measure)

            else:
                # Se agrega el parametro base a tomar en cuenta para categorizar (azul, verde...) 
                result[-1]["params"].append({"param": scan.param, "min_value": scan.min_value, "max_value": scan.max_value})

            
        #return result
        return {"result": "result"}
    
    
