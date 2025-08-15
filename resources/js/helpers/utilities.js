import {mergeWith} from 'lodash'
import * as moment from 'moment'

export const XSRF_REQUEST_HEADER = () => {
    const csrfToken = document.head.querySelector("[name~=csrf-token][content]").content;
    return {
        "X-CSRF-Token": csrfToken
    }
}
export const JSON_REQUEST_HEADER = () =>{
    return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        ...XSRF_REQUEST_HEADER()
    }
}


export const createRequest = async (URL,header, bodyData = {}, options = {}) => {
    let headerMerged = mergeWith(JSON_REQUEST_HEADER(), header)
    let response
    try {
        switch (URL.method) {
            case 'GET':
                response = await fetch(URL.path, {headers: headerMerged});
                if (!response.ok) {
                    console.error('HTTP Error:', response.status, response.statusText);
                    return { error: true, status: response.status, message: response.statusText, data: [] };
                }
                return response.json()

            case 'POST':
            case 'PUT':
            case "PATCH":
                response = await fetch(URL.path, {method: URL.method, body: JSON.stringify(bodyData), headers: headerMerged, ...options});
                if (!response.ok) {
                    console.error('HTTP Error:', response.status, response.statusText);
                    return { error: true, status: response.status, message: response.statusText, data: [] };
                }
                return response.json()

            case 'DELETE':
              response = await fetch(URL.path, { method: 'DELETE', headers: headerMerged });
              if (!response.ok) {
                  console.error('HTTP Error:', response.status, response.statusText);
                  return { error: true, status: response.status, message: response.statusText, data: [] };
              }
              return response.json();

            default:
                console.error('Unsupported HTTP method:', URL.method);
                return { error: true, message: 'Unsupported HTTP method', data: [] };
        }
    } catch (error) {
        console.error('Network Error:', error);
        return { error: true, message: 'Network Error', data: [] };
    }
}

export const createRequestWithFormData = async (URL, header, bodyData, options = {}) => {
    let headerMerged = mergeWith(XSRF_REQUEST_HEADER(), header)
    let response

    switch (URL.method) {
        case "POST":
        case "PUT":
        case "PATCH":
            response = await fetch(URL.path, {
                method: URL.method,
                headers: headerMerged,
                body: bodyData,
                ...options
            });
            return response.json()
            break;
    }
}

export const readFile = (file, callback) => {
    let reader = new FileReader();
    reader.addEventListener('load', () => {
        callback(reader.result)
    })
    reader.readAsDataURL(file);
}

export const buildMultiSelectObject = (arr, {value, label}) => {
    console.log('buildMultiSelectObject - Input arr:', arr);
    console.log('buildMultiSelectObject - value key:', value);
    console.log('buildMultiSelectObject - label key:', label);
    console.log('buildMultiSelectObject - arr type:', typeof arr);
    console.log('buildMultiSelectObject - arr is array:', Array.isArray(arr));
    
    if (!Array.isArray(arr)) {
        console.error('buildMultiSelectObject - arr is not an array:', arr);
        return [];
    }
    
    if (arr.length === 0) {
        console.log('buildMultiSelectObject - arr is empty');
        return [];
    }
    
    const result = arr.map((item) => { 
        console.log('buildMultiSelectObject - processing item:', item);
        return {value: item[value], label: item[label]}
    });
    
    console.log('buildMultiSelectObject - result:', result);
    return result;
}

export const startTime = (value) => {
  return moment(value).format('YYYY-MM-DDTHH:mm')
}

export const endTime = (value, addTime) => {
  return moment(value).add(addTime, 'minutes').format('YYYY-MM-DDTHH:mm')
}

export const confirmSwal = async ({title}) => {
    return await Swal.fire({
        title: title,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sim',
        cancelButtonText: 'Cancelar',
      }).then((result) => {
        return result
      })
}

export const confirmcancelSwal = async ({title}) => {
    return await Swal.fire({
        title: title,
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#858482',
        confirmButtonText: 'Sim',
        cancelButtonText: 'Cancelar',
      }).then((result) => {
        return result
      })
}
