<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DebugMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $response
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        // MIDDLEWARE DESABILITADO TEMPORARIAMENTE
        // return $next($request);
        
        // Log da requisição
        if (config('app.debug')) {
            try {
                Log::info('Request Debug', [
                    'url' => $request->fullUrl(),
                    'method' => $request->method(),
                    'ip' => $request->ip(),
                    'user_agent' => $request->userAgent(),
                    'user_id' => auth()->id(),
                    'timestamp' => date('Y-m-d H:i:s')
                ]);
            } catch (\Exception $e) {
                Log::info('Request Debug Error', [
                    'error' => $e->getMessage(),
                    'timestamp' => date('Y-m-d H:i:s')
                ]);
            }
        }

        $response = $next($request);

        // Log da resposta
        if (config('app.debug')) {
            try {
                Log::info('Response Debug', [
                    'status' => method_exists($response, 'status') ? $response->status() : 'N/A',
                    'timestamp' => date('Y-m-d H:i:s')
                ]);
            } catch (\Exception $e) {
                Log::info('Response Debug Error', [
                    'error' => $e->getMessage(),
                    'timestamp' => date('Y-m-d H:i:s')
                ]);
            }
        }

        return $response;
    }
}
