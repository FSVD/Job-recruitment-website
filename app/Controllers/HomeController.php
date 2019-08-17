<?php

namespace App\Controllers;

use Slim\Views\Twig as View;
use App\Models\User;
//uncomment the below, to start using cakephp
use Cake\ORM\TableRegistry;

class HomeController extends Controller
{
    public function index($request, $response)
    {
        // Sending variable to view trough associative array.
        // return $this->view->render($response, 'home.twig', array( 'fontAwesomeKitCode' => env('FONT_AWESOME_KIT_CODE')));
        return $this->view->render($response, 'home.twig');
    }
    

    public function about($request, $response)
    {
        return $this->view->render($response, 'about.twig');
    }
}
