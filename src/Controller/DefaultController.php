<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    public function index(Request $request)
    {
        $response = $this->render(
            'response.txt.twig',
            [
                'hostname' => gethostname(),
                'headers'  => $request->headers->all(),
                'server'   => $request->server->all(),
                'uri'      => $request->getRequestUri(),
                'env'      => $this->getParameter('kernel.environment'),
            ]
        );

        $response->headers->set('Content-Type', 'text/plain');

        return $response;
    }
}