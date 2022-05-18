<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RevisarEstablecimiento
{
    //Registrar el middleware en kernel que esta en http
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if(auth()->user()->establecimiento){
            return redirect('/establecimiento/edit');
        }
        return $next($request);
    }
}
