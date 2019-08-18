<?php

namespace App\Controllers;

use App\Controllers\Controller;
use App\Models\User;
use Respect\Validation\Validator as v;
use App\Models\Province;

class ProvincesController extends Controller
{
    
    /**
    * List all provinces
    *
    * @return
    */
    public function index($request, $response, $args)
    {

        //find all provinces by the country with this ID
        $provinces = Province::all();
        return $this->view->render($response, 'provinces/index.twig', ['provinces'=>$provinces]);
    }



    /**
    * Display a province
    *
    * @return
    */
    public function view($request, $response, $args)
    {
        $province = Province::find($args['id']);
        
        return $this->view->render($response, 'provinces/view.twig', ['province'=>$province]);
    }


    
    /**
    * Create A New province
    *
    * @return
    */
    public function add($request, $response, $args)
    {
        if ($request->isPost()) {
           
            /**
            * validate input before submission
            * @var
            *
            */
            $validation = $this->validator->validate($request, [
                'code' => v::notEmpty(),
                'name' => v::notEmpty()
            ]);


            //redirect if validation fails
            if ($validation->failed()) {
                $this->flash->addMessage('error', 'Validation Failed!');
        
                return $response->withRedirect($this->router->pathFor('provinces/add.twig'));
            }
        
            $province = Province::create([
                'code' => $request->getParam('code'),
                'name' => $request->getParam('name'),
            ]);

            $this->flash->addMessage('success', 'Province Added Successfully');
            //redirect to eg. province/view/8
            return $response->withRedirect($this->router->pathFor('provinces.view', ['id'=>$province->id]));
        }
        return $this->view->render($response, 'provinces/add.twig');
    }

    
    
    /**
    * Edit province
    *
    * @return
    */
    public function edit($request, $response, $args)
    {
    
              //find the province
        $province = Province::find($args['id']);

        //only admin and the person that created the province can edit or delete it.
        if ($this->auth->user()->role_id > 2) {
            $this->flash->addMessage('error', 'You are not allowed to perform this action!');
        
            return $this->view->render($response, 'provinces/index.twig');
        }

        //if form was submitted
        if ($request->isPost()) {
            $validation = $this->validator->validate($request, [
                'code' => v::notEmpty(),
                'name' => v::notEmpty(),
            ]);
            //redirect if validation fails
            if ($validation->failed()) {
                $this->flash->addMessage('error', 'Validation Failed!');
        
                return $this->view->render($response, 'provinces/edit.twig', ['province'=>$province]);
            }
        
            //save Data
            $province =  Province::where('id', $args['id'])
                            ->update([
                                'code' => $request->getParam('code'),
                                'name' => $request->getParam('name')
                                ]);
            
            if ($province) {
                $this->flash->addMessage('success', 'Province Updated Successfully');
                //redirect to eg. provinces/view/8
                return $response->withRedirect($this->router->pathFor('provinces.view', ['id'=>$args['id']]));
            }
        }
        
        
        return $this->view->render($response, 'provinces/edit.twig', ['province'=>$province]);
    }


    /**
        * Delete a province
        *
        * @return
        */
    public function delete($request, $response, $args)
    {
        $province = Province::find($args['id']);
        
        //only admin and the person that created the province can edit or delete it.
        if ($this->auth->user()->role_id > 2) {
            $this->flash->addMessage('error', 'You are not allowed to perform this action!');
        
            return $this->view->render($response, 'provinces/index.twig');
        }
        
        if ($province->delete()) {
            $this->flash->addMessage('success', 'Province Deleted Successfully');
            return $response->withRedirect($this->router->pathFor('provinces.index'));
        }
    }
}
