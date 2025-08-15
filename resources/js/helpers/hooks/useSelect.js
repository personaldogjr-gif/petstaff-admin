import {ref, onMounted} from 'vue'
import { useRequest } from '@/helpers/hooks/useCrudOpration'
import { buildMultiSelectObject } from '@/helpers/utilities'

export const useSelect = async(URL, {value = 'id', label = 'name'}) => {
  let list = []
  let options = []
  const { listingRequest } = useRequest()
  
  try {
    const res = await listingRequest(URL)
    console.log('useSelect - Response:', res);
    
    // Verificar se a resposta tem estrutura {status, data, message} ou se é um array direto
    let data = []
    
    if (res && res.error) {
      console.error('useSelect - Error in response:', res);
      data = []
    } else if (res && res.data) {
      data = res.data
    } else if (Array.isArray(res)) {
      data = res
    } else {
      console.warn('useSelect - Unexpected response format:', res);
      data = []
    }
    
    console.log('useSelect - Processed data:', data);
    
    list = data
    options = buildMultiSelectObject(data, { value: value, label: label })
    
    return {list, options}
  } catch (error) {
    console.error('useSelect - Exception:', error);
    return {list: [], options: []}
  }
}
