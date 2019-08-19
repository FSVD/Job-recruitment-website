<?php

namespace App\Controllers;

use App\Controllers\Controller;
use App\Models\User;
use Respect\Validation\Validator as v;
use App\Models\Skill;

class SkillsController extends Controller
{
    
    /**
    * List all skills
    *
    * @return
    */
    public function index($request, $response, $args)
    {

        //find all skills by the user with this ID
        if (isset($args['id'])) {
            $skills = Skill::where('user_id', $args['id'])->get();
            //get the user's details
            $user = User::find($args['id']);

            return $this->view->render($response, 'skills/index.twig', ['skills'=>$skills, 'user'=>$user]);
        } else {
            $skills = Skill::all();
            return $this->view->render($response, 'skills/index.twig', ['skills'=>$skills]);
        }
    }



    /**
    * Display a skill
    *
    * @return
    */
    public function view($request, $response, $args)
    {
        $skill = Skill::find($args['id']);
        
        return $this->view->render($response, 'skills/view.twig', ['skill'=>$skill]);
    }


    
    /**
    * Create A New Skill
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
                'title' => v::notEmpty(),
                'body' => v::notEmpty(),
            ]);


            //redirect if validation fails
            if ($validation->failed()) {
                $this->flash->addMessage('error', 'Validation Failed!');
        
                return $response->withRedirect($this->router->pathFor('skills/add.twig'));
            }
        
            $skill = Skill::create([
                'title' => $request->getParam('title'),
                'body' => $request->getParam('body'),
                'user_id' => $this->auth->user()->id,
            ]);

            $this->flash->addMessage('success', 'Skill Added Successfully');
            //redirect to eg. skills/view/8
            return $response->withRedirect($this->router->pathFor('skills.view', ['id'=>$skill->id]));
        }
        return $this->view->render($response, 'skills/add.twig');
    }

    
    
    /**
    * Edit skill
    *
    * @return
    */
    public function edit($request, $response, $args)
    {
    
              //find the skill
        $skill = Skill::find($args['id']);

        //only admin and the person that created the skill can edit or delete it.
        if (($this->auth->user()->id != $skill->user_id) and ($this->auth->user()->role_id > 2)) {
            $this->flash->addMessage('error', 'You are not allowed to perform this action!');
        
            return $this->view->render($response, 'skills/edit.twig', ['skill'=>$skill]);
        }

        //if form was submitted
        if ($request->isPost()) {
            $validation = $this->validator->validate($request, [
                'title' => v::notEmpty(),
                'body' => v::notEmpty(),
            ]);
            //redirect if validation fails
            if ($validation->failed()) {
                $this->flash->addMessage('error', 'Validation Failed!');
        
                return $this->view->render($response, 'skills/edit.twig', ['skill'=>$skill]);
            }
        
            //save Data
            $skill =  Skill::where('id', $args['id'])
                            ->update([
                                'title' => $request->getParam('title'),
                                'body' => $request->getParam('body')
                                ]);
            
            if ($skill) {
                $this->flash->addMessage('success', 'Skill Updated Successfully');
                //redirect to eg. skills/view/8
                return $response->withRedirect($this->router->pathFor('skills.view', ['id'=>$args['id']]));
            }
        }
        
        
        return $this->view->render($response, 'skills/edit.twig', ['skill'=>$skill]);
    }


    /**
        * Delete a skill
        *
        * @return
        */
    public function delete($request, $response, $args)
    {
        $skill = Skill::find($args['id']);
        
        //only admin and the person that created the skill can edit or delete it.
        if (($this->auth->user()->id != $skill->user_id) and ($this->auth->user()->role_id > 2)) {
            $this->flash->addMessage('error', 'You are not allowed to perform this action!');
        
            return $this->view->render($response, 'skills/edit.twig', ['skill'=>$skill]);
        }
        
        if ($skill->delete()) {
            $this->flash->addMessage('success', 'Skill Deleted Successfully');
            return $response->withRedirect($this->router->pathFor('skills.index'));
        }
    }
}
