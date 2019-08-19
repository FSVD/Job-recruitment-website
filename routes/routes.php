<?php
 
 //always import middlewares you wish to use
use App\Middlewares\AuthMiddleware;
use App\Middlewares\GuestMiddleware;
use App\Controllers;

/*
$app->get('/', function($request, $response){
        //return a text
        //return 'home';

        //return a view
        return $this->view->render($response, 'home.twig');
    }); */
    

//home page
$app->get('/', 'PostsController:index')->setName('home');
//about page
$app->get('/about', 'HomeController:about')->setName('about');




//GuestMiddleware group
$app->group('', function () use ($app) {
    $app->get('/auth/signup', 'AuthController:getSignup')->setName('auth.signup');
    $app->post('/auth/signup', 'AuthController:postSignup');

    //Handle POST and GET requests for signin, instead of doing it seperately as above
    $app->map(['POST','GET'], '/auth/signin', 'AuthController:signin')->setName('auth.signin');

    $app->map(['POST','GET'], '/auth/password/forgot', 'AuthController:forgotPassword')->setName('auth.password.forgot');
})->add(new GuestMiddleware($container));




//AuthMiddleware group
$app->group('', function () use ($app) {

//change password
    $app->map(['POST', 'GET'], '/auth/password/change', 'PasswordController:changePassword')->setName('auth.password.change');

    $app->map(['POST', 'GET'], '/auth/password/reset', 'PasswordController:resetPassword')->setName('auth.password.reset');

    $app->get('/auth/signout', 'AuthController:getSignout')->setName('auth.signout');


    //roles
    $app->get('/roles/view/{id}', 'RolesController:view')->setName('roles.view');
    $app->get('/roles/index', 'RolesController:index')->setName('roles.index');
    $app->map(['POST', 'GET'], '/roles/add', 'RolesController:add')->setName('roles.add');
    $app->map(['POST', 'GET'], '/roles/edit/{id}', 'RolesController:edit')->setName('roles.edit');
    $app->get('/roles/delete/{id}', 'RolesController:delete')->setName('roles.delete');

    //users
    $app->get('/users/view/{id}', 'UsersController:view')->setName('users.view');
    $app->get('/users/index', 'UsersController:index')->setName('users.index');
    $app->map(['POST', 'GET'], '/users/edit/{id}', 'UsersController:edit')->setName('users.edit');
    $app->get('/users/delete/{id}', 'UsersController:delete')->setName('users.delete');

    //post routes
    $app->get('/posts/index[/{user_id}]', 'PostsController:index')->setName('posts.index'); //Optional user_id parameter
    $app->map(['POST', 'GET'], '/posts/add/', 'PostsController:add')->setName('posts.add');
    $app->map(['POST', 'GET'], '/posts/edit/{id}', 'PostsController:edit')->setName('posts.edit');
    $app->get('/posts/view/{id}', 'PostsController:view')->setName('posts.view');
    $app->get('/posts/delete/{id}', 'PostsController:delete')->setName('posts.delete');

    //country routes
    $app->get('/countries/index', 'CountriesController:index')->setName('countries.index'); //Optional user_id parameter
    $app->map(['POST', 'GET'], '/countries/add/', 'CountriesController:add')->setName('countries.add');
    $app->map(['POST', 'GET'], '/countries/edit/{id}', 'CountriesController:edit')->setName('countries.edit');
    $app->get('/countries/view/{id}', 'CountriesController:view')->setName('countries.view');
    $app->get('/countries/delete/{id}', 'CountriesController:delete')->setName('countries.delete');

    //provinces routes
    $app->get('/provinces/index', 'ProvincesController:index')->setName('provinces.index'); //Optional user_id parameter
    $app->map(['POST', 'GET'], '/provinces/add/', 'ProvincesController:add')->setName('provinces.add');
    $app->map(['POST', 'GET'], '/provinces/edit/{id}', 'ProvincesController:edit')->setName('provinces.edit');
    $app->get('/provinces/view/{id}', 'ProvincesController:view')->setName('provinces.view');
    $app->get('/provinces/delete/{id}', 'ProvincesController:delete')->setName('provinces.delete');

    //skills routes
    $app->get('/skills/index/{id}', 'SkillsController:index')->setName('skills.index'); //Optional user_id parameter
    $app->map(['POST', 'GET'], '/skills/add/', 'SkillsController:add')->setName('skills.add');
    $app->map(['POST', 'GET'], '/skills/edit/{id}', 'SkillsController:edit')->setName('skills.edit');
    $app->get('/skills/view/{id}', 'SkillsController:view')->setName('skills.view');
    $app->get('/skills/delete/{id}', 'SkillsController:delete')->setName('skills.delete');
})->add(new AuthMiddleware($container));
