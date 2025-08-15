<?php

namespace Modules\Service\Http\Controllers\Backend\API;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Service\Models\ServicePackage;
use Modules\Service\Transformers\ServiceResource;

class ServicePackageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return $this->sendResponse(ServiceResource::collection(ServicePackage::get()), 'Lista de pacotes de serviço');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Show the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show(ServicePackage $servicePackage)
    {
        return $this->sendResponse(new ServiceResource($servicePackage), 'Detalhes do pacote de serviço');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
